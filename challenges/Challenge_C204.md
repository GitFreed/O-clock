# Challenge C204 19/02/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2026-02-19-16-36-02.png)

[Challenge C204](https://github.com/O-clock-Aldebaran/SC2E04-Openstack-GitFreed)

[Cours C204](/RESUME.md#-c204-openstack--le-cloud-privé)

> - Documentation officielle : <https://docs.openstack.org/devstack/latest/>

---

## Serveur

Installation d'une VM Ubuntu-server-live pour installer Openstack.

![VM](/images/2026-02-19-13-34-32.png)

## Installation  DevStack

![DevStack](/images/2026-02-19-13-51-12.png)

DevStack est un ensemble de scripts officiels qui télécharge, installe, configure et connecte tous ces services automatiquement sur une VM.
Il se charge de tout le travail de configuration d'un administrateur système (bases de données, dépendances Linux, permissions). Cela permet d'arriver beaucoup plus vite à la partie intéressante et de mettre les mains dans la configuration des routeurs virtuels et de l'architecture réseau.

```sh
# Add Stack User
sudo useradd -s /bin/bash -d /opt/stack -m stack
sudo chmod +x /opt/stack
echo "stack ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/stack
sudo -u stack -i
# Download DevStack
git clone https://opendev.org/openstack/devstack
cd devstack
```

On crée un fichier local.conf `nano local.conf` avec nos mots de passe à changer

```sh
[[local|localrc]]
ADMIN_PASSWORD=secret
DATABASE_PASSWORD=$ADMIN_PASSWORD
RABBIT_PASSWORD=$ADMIN_PASSWORD
SERVICE_PASSWORD=$ADMIN_PASSWORD
```

![config](/images/2026-02-19-13-43-38.png)

Une fois tout configuré on lance l'installation qui dure 15 à 30 min

![install](/images/2026-02-19-13-59-26.png)

Et on peut se connecter sur l'interface web directement

![interface](/images/2026-02-19-14-08-19.png)

## Configuration et Utilisation

### Ajout d'une image

Pour ajouter une VM (par exemple Debian), il faut Utiliser une image pour l’informatique dématérialisée, en .qcow2 pour Openstack sur <https://www.debian.org/distrib/>

![download](/images/2026-02-19-14-30-25.png)

On doit juste ajouter le nom, le type d'image et si on la veut en privé, partage, publique etc

![image](/images/2026-02-19-14-31-25.png)

![images](/images/2026-02-19-14-33-19.png)

### Configuration du réseau

🏗️ Architecture à déployer

```schema
                    Internet (external)
                            │
                    ┌───────┴────────┐
                    │  router-prod   │
                    └───────┬────────┘
                            │
            ┌───────────────┼
            │               │
    ┌───────▼─────┐  ┌──────▼──────┐ 
    │   DMZ       │  │    LAN      │───────┐
    │ 10.0.1.0/24 │  │ 10.0.2.0/24 │       │
    └─────────────┘  └─────────────┘       │
            │               │              │
    ┌───────▼──────┐ ┌──────▼──────┐ ┌─────▼──────┐
    │  web-server  │ │ app-server  │ │ db-server  │
    │  10.0.1.10   │ │  10.0.2.10  │ │ 10.0.2.20  │
    │ Floating IP  │ │             │ │            │
    │              │ │             │ │ + Volume   │
    └──────────────┘ └─────────────┘ └────────────┘
```

- Objectif : avoir une DMZ et un LAN qui sortent vers `external`.
  - Créer `dmz-network` + `dmz-subnet` en `10.0.1.0/24` (DHCP activé)
  - Créer `lan-network` + `lan-subnet` en `10.0.2.0/24` (DHCP activé)
  - Créer `router-prod` et le connecter à `external`, `dmz-subnet`, `lan-subnet`

- Objectif : un web exposé, un LAN protégé.
  - `sec-web` : SSH (22), HTTP (80), ICMP depuis `0.0.0.0/0`
  - `sec-lan` : SSH (22), ICMP depuis `0.0.0.0/0`, MySQL (3306) depuis `10.0.2.0/24`

#### Réseaux

On va créer les réseaux pour notre projet

![subnet](/images/2026-02-19-14-41-38.png)

DHCP activé pour chaque, DNS, etc

![réseaux](/images/2026-02-19-14-45-10.png)

![topologie](/images/2026-02-19-14-46-17.png)

#### Routeur

Une fois nos réseaux créés, pour qu'ils puissent communiquer  on va ajouter un routeur

![routeur](/images/2026-02-19-14-49-05.png)

Dans la partie interface, on peut ajouter les sous-réseaux pour créer nos passerelles

![subnet](/images/2026-02-19-14-50-25.png)

![passerelles](/images/2026-02-19-14-54-48.png)

Topologie mise à jour

![topologie](/images/2026-02-19-14-55-22.png)

#### Sécurité

On va créer les Groupes de sécurité (équivalent Firewall),

Pour la DMZ on va restreindre

![GS](/images/2026-02-19-15-00-38.png)

Puis modifier les règles, on ajoute les règles d'entrée nécessaire : http, https, ssh, icmp etc

![https](/images/2026-02-19-15-02-29.png)

![regles](/images/2026-02-19-15-05-11.png)

Pour le Groupe de Sécurité des App, on va mettre en 10.0.0.0/16 pour que les autres puissent y accéder

![ssh](/images/2026-02-19-15-12-23.png)

![tcp](/images/2026-02-19-15-13-05.png)

![GSapp](/images/2026-02-19-15-14-17.png)

Pour le groupe de Sécurité de la Database,

![GSdb](/images/2026-02-19-15-20-42.png)

On va aller dans Paires de Clés pour créer notre clé SSH et la télécharger (fichier.pem) et garder

![key](/images/2026-02-19-15-25-40.png)

### Création de VM

Objectif : 3 VMs conformes à l’architecture.

- Paramètres communs :
  - Image : `debian-13.1`
  - Flavor : `m1.small`
  - Key pair : `keypair-prod`

- VMs :
  - `web-server` sur `dmz-network` avec `sec-web` + **floating IP**
  - `app-server` sur `lan-network` avec `sec-lan`
  - `db-server` sur `lan-network` avec `sec-lan`

On va créer la VM admin dans Instance > Nouvelle Instance

On ajoute son nom, et le nombre d'instance sera le nombre de VM crées, et si on a besoin d'un nouveau volume ou pas

![source](/images/2026-02-19-15-29-09.png)

Dans Gabarit on peut choisir les "flavors", les capacités de stockage etc

![gabarit](/images/2026-02-19-15-31-04.png)

Dans Réseaux on ajoute notre DMZ pour cette machine

![réseaux](/images/2026-02-19-15-31-48.png)

![GS](/images/2026-02-19-15-32-41.png)

![key](/images/2026-02-19-15-32-51.png)

![instance](/images/2026-02-19-15-33-37.png)

On fait de même pour les autres machines avec leurs configurations propres.

![instances](/images/2026-02-19-15-38-57.png)

### IP Flottante

Pour se connecter à notre projet on va créer une adresse IP flottante, en quelque sorte comme si on était sur le ""WAN"" (ou comme les IP elastic que AWS)

On créer sans rien changer dans l'allocation d'IP.

Puis on va l'associer à un port (ici notre DMZ, le server web)

![asso](/images/2026-02-19-15-42-50.png)

Pour tester on peut ping notre serveur DMZ depuis notre machine Openstack

![ping](/images/2026-02-19-15-49-00.png)

On se connecte en SSH sur l'IP flottante de notre machine

`nano PassePartout.pem`

On ajoute le contenu de notre clef SSH

`ssh -i PassPartout.pem debian@172.24.4.178`

![ssh](/images/2026-02-19-16-07-20.png)

Et nous voilà connecté à la VM debian web-server, on peut ping l'app-server et le db-server pour tester

![test](/images/2026-02-19-16-56-02.png)

### Volume

- Objectif : un volume persistant attaché à `db-server`.
  - Créer `db-data` (10 GB)
  - Attacher à `db-server`

![volume](/images/2026-02-19-16-53-08.png)

Vue d'ensemble de notre infra

![dashboard](/images/2026-02-19-16-58-26.png)

![topologie](/images/2026-02-19-16-59-51.png)

## Correction

<https://github.com/O-clock-Aldebaran/SC2E04-Openstack-GitFreed/blob/master/correction.md>
