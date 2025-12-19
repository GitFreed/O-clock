# Challenge A508 19/12/2025

## Pitch de l’exercice 🧑‍🏫

⌨️ Installer et configurer un serveur Asterisk

Installation Doc <https://docs.asterisk.org/Getting-Started/Installing-Asterisk/>

[Cours A508.](/RESUME.md#-a508)

---

## Installation d'une VM Debian

Après l'install d'un Debian 12.8 sans interface graphique, on se connecte en SSH, on installe sudo, on passe notre utilisateur dans le groupe sudo, et on install le guest agent.

```bash
su -
apt update
apt upgrade
apt install sudo
usermod -aG sudo freed
exit
sudo apt install qemu-guest-agent
```

## Préparation Installation Asterisk

On installe linux-headers de la version du noyau de la machine

`apt install -y linux-headers-$(uname -r)`

Il faut juste s'assurer d'avoir les bons paquets et dépendances à jour

```bash
apt update && apt upgrade -y
apt install -y build-essential git wget libssl-dev libxml2-dev \
libncurses-dev libsqlite3-dev uuid-dev libjansson-dev libedit-dev \
pkg-config curl subversion
```

On va télécharger la version 20 LTS d'Asterisk dans le dossier usr/src/, et le décompresser

```bash
cd /usr/src/
wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-20-current.tar.gz
tar xvf asterisk-20-current.tar.gz
```

Une fois décompressé on peut aller dans le dossier `cd /usr/src/asterisk-20.17.0/`

On installe les dépendances manquantes `contrib/scripts/install_prereq install`

On appelle l'utilitaire « configure » se trouvant dans ce répertoire. Celui-ci vérifie que toutes les dépendances du logiciel ou de la bibliothèque à compiler sont bien satisfaites `./configure`

![config](/images/2025-12-19-15-12-15.png)

On va ouvrir le menu `make menuselect` pour sélectionner les modules à installer

![menuselect](/images/2025-12-19-15-23-21.png)

[*] Add-ons -> format_mp3

[*] Core Sound Packages -> CORE-SOUNDS-FR-WAV

[*] Extras Sound Packages -> EXTRA-SOUNDS-FR-WAV

Téléchargement du module mp3 `contrib/scripts/get_mp3_source.sh`

Compilation `make`

![make](/images/2025-12-19-15-35-39.png)

Installation `make install`

![makeinstall](/images/2025-12-19-15-40-15.png)

On complète l'installation en ajoutant la documentation relative à Asterisk ainsi que les fichiers de configuration par défaut. `make samples`

`make config` On crée les scripts pour que la commande systemctl fonctionne.

`ldconfig` On met à jour les liens des librairies (la plomberie interne).

## Sécuriser notre serveur

Par sécurité on va créer un utilisateur système asterisk et son groupe, puis ajouter notre utilisateur dedans, et leur donner les droits pour ne pas avoir accès directement à root.

```bash
groupadd asterisk
useradd -r -d /var/lib/asterisk -g asterisk asterisk
# audio et dialout seulement si besoin de cartes physiques mais nécessite l'installation de DHADI
usermod -aG audio,dialout asterisk 
usermod -aG asterisk freed
chown -R asterisk:asterisk /etc/asterisk /var/{lib,log,spool}/asterisk /usr/lib/asterisk
chmod -R 775 /etc/asterisk /var/{lib,log,spool}/asterisk /usr/lib/asterisk
```

On doit maintenant configurer l'utilisateur dans Asterisk, et décommenter (enlever le ; devant runuser et rungroup)

```bash
sudo nano /etc/asterisk/asterisk.conf
[options]
runuser = asterisk
rungroup = asterisk
```

## Démarrage

Activer le démarrage automatique au boot du serveur

`sudo systemctl enable asterisk`

On peut démarrer Asterisk maintenant

`sudo systemctl start asterisk`

`sudo asterisk -rvvv`

![asterisk](/images/2025-12-19-16-26-11.png)
