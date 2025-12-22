# Challenge A509 22/12/2025

## Pitch de l’exercice 🧑‍🏫

> ⌨️ On va installer la dernière version disponible d'Asterisk, en le compilant depuis le code source, sur une VM Debian 13.

Atelier Asterisk : <https://github.com/O-clock-Aldebaran/SA5-atelier-Asterisk>

[Cours A508.](/RESUME.md#-a508-introduction-à-la-voip-et-asterisk)

> 📚 **Ressources** :
>
> <https://berenger-benam.over-blog.com/2023/06/mise-en-place-de-la-telephonie-sur-ip-avec-asterisk-pjsip.html>

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

## Configuration d'un serveur avec services interactifs

### Messagerie Vocale (Voicemail)

On va créer une boîte vocale pour chaque utilisateur.

Dans le fichier /etc/asterisk/voicemail.conf tout à la fin (ctrl V plusieurs fois) on ajoute

```bash
[default]
123 => 1234,Utilisateur Mac,root@localhost
456 => 1234,Utilisateur Smartphone,root@localhost
; Syntaxe : numero => mot_de_passe,Nom Complet,Email
```

Puis dans Fichier /etc/asterisk/extensions.conf on ajoute

```bash
[lab]
; Si pas de réponse au bout de 10s, on va sur la messagerie
exten => 123,1,Dial(PJSIP/123,10)
 same => n,VoiceMail(123@default,u) ; u = unavailable
 same => n,Hangup()

exten => 456,1,Dial(PJSIP/456,10)
 same => n,VoiceMail(456@default,u)
 same => n,Hangup()

; Consulter sa messagerie en composant le 888
exten => 888,1,Answer()
 same => n,VoiceMailMain(@default)
 same => n,Hangup()
 ```

On reload no configurations avec

```bash
sudo asterisk -rx "voicemail reload"
sudo asterisk -rx "dialplan reload"
```

Test d'appel du 456 sur le 123 en laissant un message, et rappel la messagerie au 888 pour l'écouter

![messageok](/images/2025-12-22-17-28-40.png)

Logs

![logs](/images/2025-12-22-17-30-09.png)

### Appels Vidéo

Zoiper gratuit est limité donc test impossible.

Dans le fichier /etc/asterisk/pjsip.conf on ajoute

```bash
; Tout au début du fichier
[global]
user_agent=Asterisk PBX

; Dans les sections Endpoint [123] et [456]
allow = h264,vp8      ; Ajoute les codecs vidéo
support_video = yes   ; (Optionnel sur certaines versions, activé par défaut)
```

On reload `sudo asterisk -rx "pjsip reload"`

### Interception d'appels (Call Pickup)

Permet de composer un code (ex: *8) pour prendre l'appel qui sonne sur le téléphone du collègue.

Dans le fichier /etc/asterisk/pjsip.conf on ajoute ces deux lignes dans les sections Endpoint [123] et [456] :

```bash
call_group = 1    ; Je fais partie du groupe 1
pickup_group = 1  ; J'ai le droit d'intercepter le groupe 1
```

Dans le fichier /etc/asterisk/extensions.conf on ajoute le code dans [lab]

```bash
; Compose *8 pour intercepter un appel qui sonne
exten => *8,1,Pickup(1@lab) ; Ou simplement Pickup()
 same => n,Hangup()
 ```

On reload

```bash
sudo asterisk -rx "pjsip reload"
sudo asterisk -rx "dialplan reload"
```

### Salle de Conférence

On va utiliser le module moderne ConfBridge (remplaçant de MeetMe).

Dans le fichier /etc/asterisk/confbridge.conf

```bash
[default_bridge]
type=bridge
max_members=10

[default_user]
type=user
music_on_hold_when_empty=yes
```

Dans le fichier /etc/asterisk/extensions.conf Ajoute le numéro 9000 pour rejoindre la salle :

```bash
; Salle de conférence
exten => 9000,1,Answer()
 same => n,ConfBridge(1,default_bridge,default_user)
 same => n,Hangup()
```

On reload

```bash
sudo asterisk -rx "module reload app_confbridge"
sudo asterisk -rx "dialplan reload"`
```

On est bien acceuillis dans la conférence, musique de fond, qui se coupe lorsque l'autre utilisateur se connecte

![conf](/images/2025-12-22-17-21-19.png)

### Serveur Vocal Interactif (IVR)

Le fameux "Tapez 1 pour..."

Dans le fichier /etc/asterisk/extensions.conf on ajoute ce bloc pour le numéro 500 :

```bash
exten => 500,1,Answer()
 same => n,Background(main-menu)       ; Joue "Tapez 1..." (fichier son par défaut)
 same => n,WaitExten(5)                ; Attend 5 secondes que tu tapes un truc

; Si on tape 1 -> Appelle le Mac
exten => 1,1,Playback(you-entered)     ; Dit "Vous avez saisi..."
 same => n,SayDigits(1)
 same => n,Dial(PJSIP/123,20)

; Si on tape 2 -> Salle de conf
exten => 2,1,Goto(lab,9000,1)

; Si on se trompe ou que ça time-out
exten => i,1,Playback(invalid)
exten => t,1,Playback(vm-goodbye)
 same => n,Hangup()
```

On reload `sudo asterisk -rx "dialplan reload"`

On peut tout reload d'Asterisk avec `sudo asterisk -rx "core reload"`

En testant le serveur vocal interactif il n'y a pas de son et il raccroche, il faut donc analyser les logs

![logs](/images/2025-12-22-17-35-23.png)

Il essaie de jouer le fichier son "main-menu" (qui dirait par exemple "Bonjour, tapez 1 pour..."), mais ce fichier n'existe pas car nous ne l'avons pas créé

On va ajouter ça dans extensions.conf (contexte [lab]) :

```bash
; --- Le Dictaphone ---
; Appelle le 200, attends le BEEP, parle, et appuie sur # pour finir.
exten => 200,1,Answer()
 same => n,Wait(1)
 same => n,Playback(beep)             ; Le signal pour commencer
 same => n,Record(main-menu.wav)      ; Enregistre dans le fichier "main-menu.wav"
 same => n,Wait(1)
 same => n,Playback(main-menu)        ; Te fait réécouter pour confirmer
 same => n,Hangup()
```

On peut appeler le 200 et au "BEEP" on dit "Bonjour, tapez 1 pour appeler le Mac, ou tapez 2 pour la conférence." et on appuie sur # (dièse) pour terminer

On appele le 500 et maintenant on entend bien un message qui nous renvoie dans la salle de conférence enf aisant le 2 par exemple

![500](/images/2025-12-22-17-44-41.png)

## Rendre le serveur accessible par l'extérieur

On va créer une config visiteur sur pfsense

System > User Manager > Add

On le paramètre (username, passwd, nom, not admin, créer un nouveau certificat)

On va récupérer le fichier de config dans VPN > OpenVPN > Client Export > Guest > Inline config > Most clients

![guest](/images/2025-12-22-18-03-26.png)

On va maintenant créer un compte générique que tout le monde pourra utiliser une fois connecté au VPN. Dans le fichier : /etc/asterisk/pjsip.conf

```bash
; --- LE COMPTE VISITEUR (PUBLIC) ---
[guest]
type = endpoint
context = public_lab       ; <--- IMPORTANT : On l'enferme dans une zone sécurisée
disallow = all
allow = alaw
allow = ulaw
auth = auth_guest
aors = guest
force_rport = yes
rewrite_contact = yes

[guest]
type = aor
max_contacts = 10          ; Jusqu'à 10 personnes peuvent se connecter en même temps

[auth_guest]
type = auth
auth_type = userpass
password = welcome       ; Mot de passe simple à donner
username = guest
```

On reload `sudo nano /etc/asterisk/pjsip.conf`

On rajoute une boite vocale dans /etc/asterisk/voicemail.conf

```bash
[default]
; ... autres lignes
9999 => 0000,Guest,root@localhost
```

On reload `sudo asterisk -rx "module reload app_confbridge"`

Dans /etc/asterisk/extensions.conf, on va ajouter le contexte [public_lab] pour donner des droits au visiteur, joindre le 1000, un nouveau serveur vocal interactif. On va modifier notre dictaphonne pour enregistrer le message.

Modifie juste temporairement ton extension 200 pour qu'elle enregistre sous le nom menu-guest au lieu de main-menu. (Dans extensions.conf, change Record(main-menu.wav) par Record(menu-guest.wav)).

```bash
[lab]

; Ecouter la boite Guest
exten => 9999,1,VoiceMailMain(9999@default)
 same => n,Hangup()

; --- Le Dictaphone ---
; Appelle le 200, attends le BEEP, parle, et appuie sur # pour finir.
exten => 200,1,Answer()
 same => n,Wait(1)
 same => n,Playback(beep)             ; Le signal pour commencer
 same => n,Record(menu-guest.wav)      ; Enregistre dans le fichier "menu-guest.wav"
 same => n,Wait(1)
 same => n,Playback(menu-guest)        ; Fait réécouter pour confirmer
 same => n,Hangup()

[public_lab]
; --- Zone Visiteur isolée ---
; --- Standard Automatique Visiteur ---

; Le numéro unique d'entrée (1000)
exten => 1000,1,Answer()
 same => n,Wait(1)
 same => n,Background(menu-guest)     ; Joue le message "Tapez 1 ou 2..."
 same => n,WaitExten(10)              ; Attend 10 secondes une réponse

; --- Les Choix ---

; Choix 1 : Boîte Vocale
exten => 1,1,Playback(vm-intro)
 same => n,VoiceMail(9999@default,s)
 same => n,Hangup()

; Choix 2 : Conférence
exten => 2,1,Goto(lab,9000,1)

; --- Gestion des erreurs ---

; Si il ne tape rien (Timeout)
exten => t,1,Playback(vm-goodbye)
 same => n,Hangup()

; Si il tape n'importe quoi (Invalid)
exten => i,1,Playback(invalid)
 same => n,Goto(1000,1)               ; On le renvoie au début du menu
```

On reload `sudo asterisk -rx "dialplan reload"` `sudo asterisk -rx "pjsip reload"`

On peut test en utilisant le [fichier config openvpn](pfSense-UDP4-1194-guest-config.ovpn)

Et depuis un softphone :  guest@10.0.0.61 psswd(welcome)

Logs nouveau message menu-guest

![log](/images/2025-12-22-19-12-44.png)

En essayant de se connecter avec le nouveau guest, erreur 503

![logs](/images/2025-12-22-19-24-31.png)

On tente un reload pjsip puis avec `sudo asterisk -rx "pjsip show endpoints"`on vérifie nos endpoints

![endpoints](/images/2025-12-22-19-24-59.png)

On relance la connection depuis le softphone et c'est bon !

On peut maintenant appeler en faisant le 1000.

Option 1 revois sur la boite vocale(9999), logs :

![logs](/images/2025-12-22-19-37-12.png)

Je peux écouter le message laissé en appelant le 9999 depuis ma machine qui n'est pas Guest (pswwd 0000), logs :

![logs](/images/2025-12-22-19-40-21.png)

![repondeur9999](/images/2025-12-22-19-41-59.png)

Option 2 renvois bien sur réunion(9000), logs :

![9000](/images/2025-12-22-19-29-31.png)

## 📞 Guide de Connexion : Accès au Serveur Vocal

Bonjour ! Voici la procédure simple en 3 étapes pour vous connecter à notre serveur de téléphonie sécurisé depuis votre smartphone.

### 1️⃣ Étape 1 : Le Tunnel Sécurisé (VPN)

Pour accéder au serveur, vous devez d'abord activer la connexion privée.

1. Téléchargez l'application **OpenVPN Connect** (disponible sur [App Store](https://apps.apple.com/fr/app/openvpn-connect/id590379981) ou [Google Play](https://play.google.com/store/apps/details?id=net.openvpn.openvpn)).
2. Ouvrez le fichier de configuration **`.ovpn`** que je vous ai transmis. [.ovpn](pfSense-UDP4-1194-guest-config.ovpn)
3. Choisissez "Ouvrir avec OpenVPN" (ou importez-le depuis l'application onglet *File*).
4. Cliquez sur **ADD**, puis activez l'interrupteur pour vous connecter.

* ✅ *Indicateur : L'écran doit passer au vert (Connected).*

### 2️⃣ Étape 2 : Le Téléphone (Zoiper)

Une fois le VPN connecté, configurez votre ligne.

1. Téléchargez l'application **Zoiper Lite** (gratuite).
2. Ouvrez l'appli et allez dans **Paramètres** (Settings) > **Comptes** (Accounts).
3. Cliquez sur le **+** et choisissez **"SIP Account"** (ou configuration manuelle).
4. Remplissez **uniquement** ces 3 champs :

* **Account Name :** `Guest`
* **Host / Domain :** `10.0.0.61`
* **Username :** `guest`
* **Password :** `welcome`

1. Validez (Register).

* ✅ *Indicateur : Le compte doit afficher "Account is Ready" ou un point vert.*

### 3️⃣ Étape 3 : Passez l'appel

Tout est prêt. Depuis le clavier de Zoiper :

* Composez le **`1000`** 📞
* *Vous accéderez à notre menu interactif (laissez un message ou rejoignez la conférence).*

*Note : Assurez-vous de laisser l'application OpenVPN active en arrière-plan pendant votre appel.*
