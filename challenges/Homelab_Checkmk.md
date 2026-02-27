# Checkmk

![git](/images/2026-02-27-10-53-52.png)

> - Documentation : <https://docs.checkmk.com/latest/fr/>
> - Installation Guide : <https://checkmk.com/download?platform=cmk&distribution=debian&release=trixie&edition=cre&version=2.4.0p22>

![checkmk](/images/2026-02-27-10-50-09.png)

---

## Création de la VM/Container

Installation d'un container LXC

```sh
Hostname : Checkmk
Template : debian-13-standard (ou ubuntu-24.04)
Disque : Taille 15 Go
CPU Cœurs : 1
RAM : 1024 Mo (1 Go)
IPv4 : Static
IPv4/CIDR : 10.0.0.80/16
Passerelle : 10.0.0.1
DNS : 10.0.0.1
```

Une fois lancé on doit vérifier si `wget` et `ssh` sont bien installés

```sh
apt update && apt upgrade -y
apt install wget && apt install openssh-server
```

Pour pouvoir se connecter en SSH on doit modifier le fichier `sshd_config`

```sh
nano /etc/ssh/sshd_config
   PermitRootLogin yes
```

et restart `systemctl restart sshd`

On va aussi configurer l'IP en statique : `nano /etc/network/interfaces`

```sh
auto ens18
iface ens18 inet static
    address : 10.0.0.50
    netmask : 255.255.0.0
    gateway : 10.0.0.1
    dns-nameservers : 10.0.0.1
```

et restart `systemctl restart networking`

## Installation et Configuration Checkmk

Téléchargement de la clé GPG officielle depuis leur site web :

`wget https://download.checkmk.com/checkmk/Check_MK-pubkey.gpg`

Importer la clé dans la liste des signatures fiables du système :

`gpg --import Check_MK-pubkey.gpg`

Téléchargement du packet spécifique pour Debian 13 :

`wget https://download.checkmk.com/checkmk/2.4.0p22/check-mk-raw-2.4.0p22_0.trixie_amd64.deb`

Vérifier la validité du paquet avec gpg :

`gpg --verify ./check-mk-raw-*.deb`

![gpg](/images/2026-02-27-12-49-12.png)

Installation du paquet avec les dépendances :

`sudo apt install ./check-mk-raw-2.4.0p22_0.trixie_amd64.deb`

Test de l'installation :

`omd version`

> omd : Open Monitory Distribution

![omd](/images/2026-02-27-12-51-24.png)

On va maintenant pouvoir créer notre instance de supervision :

`omd create monitoring`

> ⚠️ Bien noter le mot de passe aléatoire généré pour l'utilisateur `cmkadmin`, et l'URL pour se connecter à l'interface web

![password](/images/2026-02-27-13-01-03.png)

Démarrer le moteur de supervision :

`omd start monitoring`

![OK](/images/2026-02-27-13-04-30.png)

L'installation est terminée. On peut se connecter à l'interface web en tapant <http://10.0.0.80/monitoring/> dans le navigateur 🎉

![login](/images/2026-02-27-13-06-14.png)

![dashboard](/images/2026-02-27-13-06-28.png)

Pour vérifier les services de l'instance : `omd status`

![status](/images/2026-02-27-13-10-59.png)

Schema des différentes façons dont Checkmk peut accéder aux systèmes à superviser

![agents](/images/2026-02-27-13-16-39.png)

## Installation des Agents

> - Documentation Agents de supervision checkmk : <https://docs.checkmk.com/latest/fr/wato_monitoringagents.html>

Le grand avantage de Checkmk, c'est que l'installation des agents ne demande aucune configuration système fastidieuse : on installe le paquet, ça ouvre un port d'écoute, et tout le reste de l'intelligence se gère depuis l'interface web centrale.

Pour déployer tes agents : Le serveur est le dépôt 💡

![agents](/images/2026-02-27-13-23-15.png)

Pas besoin de chercher les agents sur Internet. Dès que le site "monitoring" est créé, Checkmk génère et héberge lui-même les agents.

Ils sont toujours disponibles directement sur le serveur via l'interface web dans :
Setup > Agents > Windows, Linux, Solaris, AIX, etc

On peut copier directement le lien de l'agent dont on a besoin.

### Linux

![agents](/images/2026-02-27-13-51-44.png)

Pour télécharger l'agent depuis notre propre serveur Checkmk avec `wget` :

`wget http://10.0.0.80/mkmonitoring/check_mk/agents/check-mk-agent_2.4.0p22-1_all.deb`

Installation de l'agent :

`sudo apt install ./check-mk-agent_*.deb`

### Windows

C'est encore plus simple, on ouvre un navigateur directement sur le PC Windows cible et on se connecte à l'interface Checkmk. Setup > Agents > Windows.

On télécharge le package Windows Installer (.msi).

![windows](/images/2026-02-27-13-56-43.png)

Et on lance le fichier téléchargé, et on termine l'install avec les option de base.

![exe](/images/2026-02-27-14-07-34.png)

Côté réseau : L'installateur crée automatiquement un service Windows en arrière-plan et ajoute la règle au pare-feu Windows pour ouvrir le fameux port TCP 6556. Il n'y a rien d'autre à faire.

## Découverte des agents

### Ajout des agents

Une fois que le port 6556 des machines cibles est ouvert et prêt à répondre, on retourne sur l'interface web Checkmk pour lancer la découverte :

On va dans Setup > Hosts > Add host

![add](/images/2026-02-27-14-12-49.png)

On renseigne le nom de la machine (ex: PC-Fixe ou Proxmox-Host) et son adresse IP, puis **Save & view folder**

![add](/images/2026-02-27-14-14-21.png)

On peut ajouter nos autres hôtes

![hosts](/images/2026-02-27-14-17-30.png)

### Sécurisation des flux

Pour sécuriser les flux et les chiffrer on va utiliser la commande :

`sudo cmk-agent-ctl register --hostname ubuntu-9005 --server 10.0.0.80 --site mkmonitoring --user cmkadmin --password Zy8KpTRvhZi6`

> 🔐 L'agent va s'authentifier auprès du serveur Checkmk, échanger des certificats, et tout le trafic de supervision sur le port 6556 sera chiffré. De plus, l'agent n'acceptera de parler qu'au serveur.

![secure](/images/2026-02-27-14-20-12.png)

Pour Windows on fait de même en invite de commande ou powershell en tant qu'administrateur

`sudo cmk-agent-ctl register --hostname windows10-9002 --server 10.0.0.80 --site mkmonitoring --user cmkadmin --password Zy8KpTRvhZi6`

Si ça ne fonctionne pas (windows ne reconnaît pas la variable d'environnement) on peut utiliser

`"C:\Program Files (x86)\checkmk\service\cmk-agent-ctl.exe" register --hostname windows10-9002 --server 10.0.0.80 --site mkmonitoring --user cmkadmin --password Zy8KpTRvhZi6`

### Découverte

Maintenant que le canal de communication est sécurisé, on va pouvoir aspirer les métriques : la découverte automatique.

Voici comment faire remonter toutes les informations dans le tableau de bord : Setup > Hosts > cliquer sur le carré jaune `Run Service Discovery` 🟨

![discover](/images/2026-02-27-14-30-56.png)

Là, Checkmk va scanner les services sur la machine et te lister tout ce qu'il a trouvé (interfaces réseaux, CPU, disques, services).

On valide avec `Accept all` pour commencer à monitorer toutes ces métriques.

![datasources](/images/2026-02-27-14-33-04.png)

On fait de même pour les autres agents/machines

Les changements sont "en attente" (pending). Il faut les appliquer pour que le moteur de supervision les prenne en compte. Tout en haut à droite il y a un bouton jaune avec un point d'exclamation (indiquant par exemple 2 changes) : `Activate on selected sites`

On peut retrouver les résultats du check dans Monitor > Overview > All Hosts

![hosts](/images/2026-02-27-14-42-05.png)

![dashboard](/images/2026-02-27-14-45-34.png)

## Custom Dashboard

![dash](/images/2026-02-27-15-29-01.png)

to be continued...

Suite Lab : interrogation des tes switchs / pfSense via SNMP
