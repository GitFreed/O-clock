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

