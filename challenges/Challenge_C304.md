# Atelier C304 26/02/2026

## Pitch de l’exercice 🧑‍🏫

[Atelier C304](https://github.com/O-clock-Aldebaran/SC3E04-Atelier-IDS-IPS/blob/master/README.md)

[Cours C304](.)

Dans cet atelier, nous allons mettre en place une **chaîne de détection et de supervision** complète. L'idée est simple : un capteur réseau (**Suricata**) détecte les menaces, puis remonte ses alertes vers un SIEM centralisé (**Wazuh**) pour la visualisation et la corrélation. C'est exactement ce qu'on retrouve dans un **SOC** (Security Operations Center) en entreprise.

**Architecture du lab :**

```
          Internet
              │
       ┌──────┴──────┐
       │  pfSense    │
       │  10.0.0.1   │
       └──────┬──────┘
              │
     ─────── vmbr2 — LAN 10.0.0.0/16 ────────
        │           │             │
   ┌────┴────┐ ┌────┴─────┐  ┌────┴──────┐
   │  Win11  │ │ Suricata │  │   Wazuh   │
   │ .0.10   │ │  .0.50   │  │   .0.40   │
   │ (cible) │ │ (IDS/IPS)│  │  (SIEM)   │
   └─────────┘ └──────────┘  └───────────┘
```

| Machine      | Type                    | IP            | RAM           |  Disque dur        |Rôle                           |
| ------------ | ----------------------- | ------------- | ------------- |  ------------- |------------------------------ |
| pfSense      | VM (existante)          | 10.0.0.1      | 1 Go          | 20 Go | Firewall / Gateway             |
| Win10        | VM (existante)          | 10.0.0.100     | 4 Go          | 32 Go | VM cible                       |
| **Suricata** | **VM ou CT (nouvelle)** | **10.0.0.50** | **2 Go**      | 20 Go | **IDS/IPS + Agent Wazuh**      |
| **Wazuh**    | **VM (nouvelle)**       | **10.0.0.40** | **10 Go mini** | 80 Go | **SIEM (Manager + Dashboard)** |

---

> - Documentation Wazuh : <https://documentation.wazuh.com/current/user-manual/index.html>
> - Documentation Suricata : <https://docs.suricata.io/en/suricata-8.0.2/>
> - Wazu Install Guide : <https://documentation.wazuh.com/current/installation-guide/wazuh-server/index.html>

---

## Installer Suricata (IDS/IPS)

Un IDS (Intrusion Detection System) surveille le trafic réseau et génère des alertes quand il détecte un comportement suspect. Un IPS (Intrusion Prevention System) fait la même chose, mais peut en plus bloquer le trafic malveillant.

Suricata est un moteur open-source qui peut fonctionner dans les deux modes.

### Création de la VM/Container

On va l'installer avec un container LXC

```sh
Hostname : Suricata
Template : debian-13-standard (ou ubuntu-24.04)
Disque : Taille 20 Go
CPU Cœurs : 2
RAM : 2048 Mo (2 Go)
IPv4 : Static
IPv4/CIDR : 10.0.0.50/16
Passerelle : 10.0.0.1
DNS : 8.8.8.8
```

Une fois lancé pour se connecter en SSH on doit modifier le fichier `sshd_config`

```sh
nano /etc/ssh/sshd_config
   PermitRootLogin yes
```

et restart `systemctl restart sshd`

On va ensuite configurer en IP statique : `nano /etc/network/interfaces`

```sh
auto ens18
iface ens18 inet static
    address 10.0.0.50
    netmask 255.255.0.0
    gateway 10.0.0.1
    dns-nameservers 8.8.8.8
```

et restart `systemctl restart networking`

![OK](/images/2026-02-26-12-08-49.png)

### Installation et Configuration Suricata

```sh
apt update && apt upgrade -y
apt install -y suricata suricata-update
```

On vérifie l'installation : `suricata --build-info | head -5`

![OK](/images/2026-02-26-12-10-45.png)

On va éditer le fichier de configuration principal

```bash
nano /etc/suricata/suricata.yaml
```

Pour définir le réseau à protéger (HOME_NET) on cherche la section `vars` → `address-groups` :

```yaml
vars:
  address-groups:
    HOME_NET: "[10.0.0.0/16]"
    EXTERNAL_NET: "!$HOME_NET"
```

> 💡 HOME_NET correspond à notre réseau LAN. Suricata utilise cette variable pour savoir quel trafic est "interne" et quel trafic est "externe". Si HOME_NET est mal défini, les règles ne se déclencheront pas correctement.

Définir l'interface d'écoute : on cherche la section `af-packet` :

```yaml
af-packet:
  - interface: eth0
    cluster-id: 99
    cluster-type: cluster_flow
    defrag: yes
```

(Dans un CT c'est généralement eth0, dans une VM Proxmox avec VirtIO c'est ens18)

![OK](/images/2026-02-26-12-18-08.png)

On va activer les détails dans les logs EVE JSON :

On cherche la section `outputs` → `eve-log` → `types` → `alert`. Par défaut, les options intéressantes sont commentées :

```yaml
- alert:
    # payload: yes             # enable dumping payload in Base64
    # payload-printable: yes   # enable dumping payload in printable (lossy) format
    # packet: yes              # enable dumping of packet (without stream segments)
```

On décommente les lignes `payload`, `payload-printable` et `packet` pour obtenir :

```yaml
- alert:
    payload: yes
    payload-printable: yes
    packet: yes
    tagged-packets: yes
```

> ⚠️ Attention ! On respecter l'indentation ! YAML est très sensible à l'indentation. Les options `payload`, `payload-printable` et `packet` doivent être au même niveau d'indentation que `tagged-packets` (4 espaces).
>
> 💡 **Pourquoi décommenter ces lignes ?** Par défaut, Suricata ne log que le minimum (signature, IP, port). En activant `payload` et `payload-printable`, on aura le contenu du paquet qui a déclenché l'alerte — très utile pour investiguer dans Wazuh. Le fichier `eve.json` est le format de log structuré que Wazuh lira pour récupérer les alertes.
>
> 💡 On vérifie aussi que `eve-log` est bien activé (`enabled: yes`) plus haut dans la section. C'est normalement le cas par défaut, mais mieux vaut vérifier

```yaml
outputs:
  - eve-log:
      enabled: yes
      filetype: regular
      filename: eve.json
```

Suricata utilise des jeux de règles communautaires. Le plus courant est Emerging Threats Open, on télécharge ces règles avec `suricata-update`

Cette commande télécharge et installe les règles dans `/var/lib/suricata/rules/suricata.rules`

On vérifie le nombre de règles chargées : `grep -c "^alert" /var/lib/suricata/rules/suricata.rules`

On a plusieurs dizaines de milliers de règles

![regles](/images/2026-02-26-12-24-09.png)

On peut maintenant démarrer Suricata

```sh
systemctl enable suricata
systemctl start suricata
systemctl status suricata
```

On vérifie les logs de démarrage :

`tail -f /var/log/suricata/suricata.log`

![logs](/images/2026-02-26-12-37-30.png)

![suricate](/images/2026-02-26-12-25-45.png)

On peut vérifier la syntaxe de notre fichier yaml avec `suricata -T -c /etc/suricata/suricata.yaml`

![yaml](/images/2026-02-26-12-34-48.png)

On reboot le container.

### Générer un événement de test et vérifier les logs

On va installer Curl avec `apt install curl -y`

Puis lancer `curl http://testmynids.org/uid/index.html`

![url](/images/2026-02-26-12-41-34.png)

Cette URL retourne volontairement la chaîne uid=0(root) dans sa réponse HTTP, ce qui déclenche la règle ET ATTACK_RESPONSE (SID 2100498)

On installe jq pour lire le JSON facilement : `apt install -y jq`

Puis on vérifie les alertes :

`cat /var/log/suricata/eve.json | jq 'select(.event_type=="alert")'`

![logs](/images/2026-02-26-13-10-17.png)

On peut aussi faire la commande `cat /var/log/suricata/fast.log`

![logs](/images/2026-02-26-13-10-50.png)

## Installer Wazuh (SIEM)

Un **SIEM** (Security Information and Event Management) est une plateforme qui collecte les logs de multiples sources (IDS, pare-feu, serveurs...), les normalise, les corrèle pour détecter des attaques, et alerte les analystes via un tableau de bord centralisé.

**Wazuh** est un SIEM open-source composé de trois briques :

| Composant           | Rôle                                                         | Port              |
| ------------------- | ------------------------------------------------------------ | ----------------- |
| **Wazuh Manager**   | Reçoit les logs des agents, applique les règles de détection | 1514, 1515, 55000 |
| **Wazuh Indexer**   | Stocke et indexe les événements (basé sur OpenSearch)        | 9200              |
| **Wazuh Dashboard** | Interface web de visualisation et d'investigation            | 443               |

```
       Sources                          SIEM Wazuh
    ┌──────────┐                   ┌──────────────────┐
    │ Suricata │──── eve.json ────>│  Wazuh Manager   │
    │  (IDS)   │   via agent       │        │         │
    └──────────┘                   │        ▼         │
                                   │  Wazuh Indexer   │
    ┌──────────┐                   │        │         │
    │  Win11   │──── syslog ──────>│        ▼         │
    │ (cible)  │   via agent       │ Wazuh Dashboard  │
    └──────────┘                   └──────────────────┘
```

### Création de la VM

```sh
Hostname : Wazuh
Image : debian-13 ou ubuntu-24.04 server
Système : Linux
Disque : Taille 50 Go
CPU Cœurs : 2 (idéalement 4)
RAM : 10240 Mo (10 Go)
```

⚠️ **8 Go de RAM est le minimum recommandé** pour une installation tout-en-un (Manager + Indexer + Dashboard). L'Indexer (OpenSearch) est très gourmand. En dessous de 4 Go, l'installation échouera.

⚠️ **Wazuh nécessite une VM, pas un CT.** Les composants Wazuh (notamment l'Indexer basé sur OpenSearch) ont besoin d'un accès système complet et de paramètres kernel spécifiques (`vm.max_map_count`) qui ne sont pas disponibles dans un conteneur LXC.

Une fois la VM lancée on configure le réseau et test avec des pings

`nano /etc/network/interfaces`

```sh
auto ens18
iface ens18 inet static
    address 10.0.0.40
    netmask 255.255.0.0
    gateway 10.0.0.1
    dns-nameservers 8.8.8.8
```

`systemctl restart networking` ou `nano /etc/netplan/` et `sudo netplan apply` sur Ubuntu-live-server

### Installation de Wazuh

On va installer Wazuh, l'installation tout-en-un déploie les trois composants sur la même VM :

`curl -sO https://packages.wazuh.com/4.14/wazuh-install.sh && sudo bash ./wazuh-install.sh -a > wazuh-install.log`

En même temps on peut voir et récupérer les logs d'installation, dont le mot de passe avec

`tail -f wazuh-install.log`

![tail](/images/2026-02-26-13-52-40.png)
