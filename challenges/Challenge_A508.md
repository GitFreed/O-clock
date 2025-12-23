# Challenge A508 19/12/2025

## Pitch de l’exercice 🧑‍🏫

⌨️ Installer et configurer un serveur Asterisk

Installation Doc <https://docs.asterisk.org/Getting-Started/Installing-Asterisk/>

[Cours A508.](/RESUME.md#-a508-introduction-à-la-voip-et-asterisk)

---

## Installation d'une VM Debian sur Proxmox

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

![status](/images/2025-12-19-17-51-34.png)

## Fichiers de configuration

On va configurer le fichiere `pjsip`

```bash 
cd /etc/asterisk/
sudo mv pjsip.conf pjsip.conf.backup
sudo nano /etc/asterisk/pjsip.conf
```

Transport : Crée un transport UDP qui écoute sur toutes les adresses IP (0.0.0.0)

Endpoint 123 : Définit un téléphone numéro 123, qui utilise les codecs alaw et ulaw, et qui est placé dans le contexte lab

Auth : Définit l'utilisateur 123 avec le mot de passe rocknroll

```bash
[transport-udp]
type=transport
protocol=udp
bind=0.0.0.0

[123]
type=endpoint
context=lab
disallow=all
allow=ulaw,alaw
auth=auth123
aors=123
transport=transport-udp

[123]
type=aor
max_contacts=1

[auth123]
type=auth
auth_type=userpass
password=rocknroll
username=123
```

On recharge la configuration `sudo asterisk -rx "pjsip reload"`

![conf](/images/2025-12-19-18-20-37.png)

Maintenant on va configurer le fichier extensions.conf pour avoir un dialplan

```bash
sudo mv extensions.conf extensions.conf.backup
sudo nano /etc/asterisk/extensions.conf
```

Answer() : Asterisk décroche la ligne.

Wait(2) : Il attend 2 secondes (pour être sûr que l'audio est bien établi).

Playback(hello-world) : Il joue le son de test standard "Hello World".

Hangup() : Il raccroche proprement.

```bash
[lab]
exten => 999,1,Answer()
exten => 999,2,Wait(2)
exten => 999,3,Playback(hello-world)
exten => 999,4,Hangup()
```

Pour valider les changements on recharge le plan de numérotation `sudo asterisk -rx "dialplan reload"`

On va vérifier que Asterisk "écoute" bien le port 5060

`sudo ss -anup | grep asterisk`

![anup](/images/2025-12-19-18-43-54.png)

C'est presque finit, on va aller dans la console (`sudo asterisk -rvvv`) pour demander à Asterisk d'afficher tous les messages réseaux (paquets SIP) qui entrent et sortent.

`pjsip set logger on`

![pjsip](/images/2025-12-19-18-45-42.png)

## Connexion

On va  télécharger et installer un Softphone : Zoiper <https://www.zoiper.com/en/voip-softphone/download/current>

![zoiper](/images/2025-12-19-18-52-08.png)

On reçoit bien la demande côté serveur qui transmet sa réponse.

![aste](/images/2025-12-19-19-10-18.png)

On peut call le 999 pour test la réponse echo "Hello World"

![test](/images/2025-12-22-15-20-15.png)

et le log de l'appel

![log](/images/2025-12-19-19-35-53.png)
