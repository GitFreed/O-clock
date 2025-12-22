# Challenge A509 22/12/2025

## Pitch de l’exercice 🧑‍🏫

> ⌨️ On va installer la dernière version disponible d'Asterisk, en le compilant depuis le code source, sur une VM Debian 13.

Atelier Asterisk : <https://github.com/O-clock-Aldebaran/SA5-atelier-Asterisk>

[Cours A508.](/RESUME.md#-a508)

---

## 1. Install VM Debian 13

![debian13](/images/2025-12-22-10-09-44.png)

## 2. Préparation du serveur : sudo, IP statique & SSH

On va se connecter en SSH, installer sudo, ajouter notre utilisateur au groupe sudo, mettre à jours les paquets, installer qemu agent et resolvconf pour pas avoir de problème de dns en ip fixe

```bash
su -
apt update
apt upgrade
apt install sudo
usermod -aG sudo freed
exit
sudo apt install qemu-guest-agent
```

On va passer notre serveur en IP fixe en modifiant le fichier network/interfaces

`sudo nano /etc/network/interfaces/`

```bash
allow-hotplug ens18
iface ens18 inet static
  address 10.0.0.61
  netmask 255.255.0.0
  network 10.0.0.0
  gateway 10.0.0.1
  dns-nameservers 10.0.0.1 8.8.8.8
```

`sudo nano /etc/resolv.conf/`

`nameserver 10.0.0.1`

![OK](/images/2025-12-22-11-11-42.png)

## 3. Installation d'Asterisk

On ne peut malheureusement pas installer Asterisk depuis les dépôts Debian car il n'est pas disponible sur notre version (Debian 13, Trixie). On va donc le compiler depuis le code source (ce qui nous permettra aussi d'avoir la toute dernière version disponible, 22.7).

On intalle git et on télécharge dans le dossier usr/src le code source, et les 2 dépendances qu'on va devoir compiler au préalable : dahdi et libpri

```bash
sudo apt update
sudo apt install -y git
cd /usr/src
sudo git clone https://github.com/asterisk/asterisk.git
sudo git clone https://github.com/asterisk/dahdi-linux-complete.git
sudo git clone https://github.com/asterisk/dahdi-linux.git linux
sudo git clone https://github.com/asterisk/dahdi-tools.git tools
sudo git clone https://github.com/asterisk/libpri.git
```

On doit installer un compilateur pour la suite

```bash
sudo apt update
sudo apt install build-essential linux-headers-$(uname -r)
```

### Dahdi

Maintenant on va installer dahdi

```bash
cd /usr/src/dahdi-linux-complete
sudo make all
```

Il faut installer les bibliothèques manquantes

```bash
sudo apt -y install gcc g++ automake autoconf libtool make libncurses5-dev flex bison patch linux-headers-$(uname -r) sqlite3 libsqlite3-dev
sudo sudo apt -y install libusb-1.0-0-dev libglib2.0-dev
```

Maintenant on peut lancer `sudo make install``

![install](/images/2025-12-22-12-19-09.png)

Et `sudo make install-config`

![OK](/images/2025-12-22-12-19-42.png)

### Libpri

On passe à Libpri

```bash
cd /ust/src/libpri
make
sudo make install
```

![ok](/images/2025-12-22-12-29-50.png)

### Asterisk

On va installer les dépendances pour Asterisk et vérifier avec le prerequis s'il en manque encore

```bash
cd ./asterisk
sudo apt install -y build-essential git wget libssl-dev libxml2-dev \
libncurses-dev libsqlite3-dev uuid-dev libjansson-dev libedit-dev \
pkg-config curl subversion
sudo contrib/scripts/install_prereq install
```

![ok](/images/2025-12-22-12-32-48.png)

On peut lancer l'installation en le forçant a bien utiliser nos configurations précédentes

`sudo ./configure --with-dahdi --with-pri --with-jansson`

![ok](/images/2025-12-22-12-40-39.png)

On va ajouter des modules nécessaires à notre installation

`sudo make menuselect`

[*] Add-ons -> format_mp3

[*] Core Sound Packages -> CORE-SOUNDS-FR-WAV FR-ULAW FR-ALAW

[*] Extras Sound Packages -> EXTRA-SOUNDS-FR-WAV FR-ULAW FR-ALAW

[*] Music On Hold File Packages -> -WAV -ULAW -ALAW

F12

![menu](/images/2025-12-22-12-45-39.png)

Téléchargement du module mp3 `sudo contrib/scripts/get_mp3_source.sh`

Compilation `sudo make`

![ok](/images/2025-12-22-12-55-50.png)

Installation `sudo make install`

![ok](/images/2025-12-22-12-56-48.png)

On complète l'installation en ajoutant la documentation relative à Asterisk ainsi que les fichiers de configuration par défaut. `sudo make samples`

`sudo make config` On crée les scripts pour que la commande systemctl fonctionne

`sudo ldconfig` On met à jour les liens des librairies

On vérifie avec `systemctl status asterisk`

![ok](/images/2025-12-22-12-59-02.png)

Facultativement, on peut aussi installer un script de rotation des logs (très utile en prod, moins dans notre lab) :

`sudo make install-logrotate`

## 4. Configuration

### Sécurité

Par sécurité on va créer un utilisateur système asterisk et son groupe, puis ajouter notre utilisateur dedans, et leur donner les droits pour que'Asterisk ne soit pas directement en root

```bash
groupadd asterisk
useradd -r -d /var/lib/asterisk -g asterisk asterisk
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

### Démarrage

On peut démarrer Asterisk maintenant

`sudo systemctl start asterisk`

`sudo asterisk -rvvv`

![ok](/images/2025-12-22-14-26-52.png)

Activer le démarrage automatique au boot du serveur

`sudo systemctl enable asterisk`

### Fichiers de configuration

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
; --- Transport ---
[simpletrans]
type=transport
protocol=udp
bind=0.0.0.0

; --- Endpoint (Le téléphone) ---
[123]
type = endpoint
context = lab              ; C'est le contexte qu'on va utiliser dans extensions.conf
disallow = all
allow = alaw
allow = ulaw
auth = auth123
aors = 123.                ; Lien vers la section AOR ci-dessous
force_rport = yes          ; Recommandé : aide à traverser les routeurs/NAT
rewrite_contact = yes      ; Recommandé : assure que le retour audio trouve le chemin
direct_media = no          ; Recommandé : Asterisk gère l'audio (plus stable pour les tests)

; --- AOR (Address of Record - Où joindre le téléphone) --
[123]                 
type = aor
max_contacts = 1

; --- Auth (Mot de passe) ---
[auth123]
type = auth
auth_type = userpass
password = rocknroll
username = 123
```

On recharge la configuration `sudo asterisk -rx "pjsip reload"`

![ok](/images/2025-12-22-14-30-44.png)

Maintenant on va configurer le fichier extensions.conf pour avoir un dialplan

```bash
sudo mv extensions.conf extensions.conf.backup
sudo nano /etc/asterisk/extensions.conf
```

```bash
[general]
static=yes
writeprotect=no

[lab]
; Test Hello World sur le 999
exten => 999,1,Answer()
 same => n,Wait(1)               ; Petite pause d'une seconde
 same => n,Playback(hello-world) ; Joue le fichier son
 same => n,Hangup()

; (Optionnel) Permet au 123 de s'appeler lui-même pour tester la sonnerie
exten => 123,1,Dial(PJSIP/123)
```

Pour valider les changements on recharge le plan de numérotation `sudo asterisk -rx "dialplan reload"`

![ok](/images/2025-12-22-14-31-50.png)

On va vérifier que Asterisk "écoute" bien le port 5060

`sudo ss -anup | grep asterisk`

socket statistics

-a : All (tout afficher) ou -l (Listening) pour voir seulement ce qui écoute.

-n : Numeric (affiche les ports en chiffres, ex: 5060 au lieu de "sip").

-u : UDP (le protocole qu'on veut vérifier).

-p : Process (affiche quel programme utilise le port).

![ok](/images/2025-12-22-14-32-50.png)

## 5. Lancement et utilisation

On va aller dans la console (`sudo asterisk -rvvv`) pour demander à Asterisk d'afficher tous les messages réseaux (paquets SIP) qui entrent et sortent.

`pjsip set logger on`

![log](/images/2025-12-22-14-50-50.png)

## Client Mac : Connexion et test

On va  télécharger et installer un Softphone : Zoiper <https://www.zoiper.com/en/voip-softphone/download/current>

![zoiper](/images/2025-12-22-15-14-45.png)

On reçoit bien la demande côté serveur qui transmet sa réponse.

![aste](/images/2025-12-19-19-10-18.png)

On est bien connectés !

![ok](/images/2025-12-22-15-29-34.png)

On peut call le 999 pour test la réponse echo "Hello World"

![test](/images/2025-12-22-15-29-07.png)

et le log de l'appel avec la réponse Hello Word

![log](/images/2025-12-22-15-28-13.png)

## Client Smartphone

Pour me connecter depuis mon smartphone je vais installer Openvpn pour me connecter à ma pfsense proxmox et l'appli Zoiper. On doit aussi activer la duplication de connection dans notre tunnel sur pfsense : VPN>OpenVPN>Servers>Edit

![pfsense](/images/2025-12-22-16-13-05.png)

On va ajouter un nouvel utilisateur vu qu'on va devoir par la suite s'appeler entre les 2 machines

```bash
; --- Endpoint 456 (Smartphone) ---
[456]
type = endpoint
context = lab
disallow = all
allow = alaw
allow = ulaw
auth = auth456
aors = 456_aor
force_rport = yes
rewrite_contact = yes
direct_media = no

; --- AOR 456 ---
[456]
type = aor
max_contacts = 1

; --- Auth 456 ---
[auth456]    
type = auth
auth_type = userpass
password = rocknroll
username = 456
```

Puis `sudo asterisk -rx "dialplan reload"`

Il faut également modifier le diaplan pour ajouter

```bash
; (456)
exten => 456,1,Dial(PJSIP/456,30)
 same => n,Hangup()
```

Test depuis le téléphone

![phone](/images/2025-12-22-16-26-33.png)

Test entre le téléphone et le macbook

![test](/images/2025-12-22-16-22-51.png)

![logs](/images/2025-12-22-16-25-15.png)