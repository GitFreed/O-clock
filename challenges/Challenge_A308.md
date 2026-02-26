# Atelier A308 14/11/2025

## Pitch de l’exercice 🧑‍🏫

[Pitch de l'Atelier A308](https://github.com/O-clock-Aldebaran/SA3-atelier-proxmox)

![atelier](/images/2026-02-26-18-50-41.png)

---

> 📚 **Ressources :**
>
>- Pfsense : <https://fr.wikipedia.org/wiki/PfSense>
>- Proxmox : <https://fr.wikipedia.org/wiki/Proxmox_Virtual_Environnement>

---

## Configuration Proxmox

Proxmox, un Hyperviseur de type 1, permet de superviser le matériel serveur. On doit configurer l'interface réseau. Ajout de Bridges qui vont permettre de connecter nos interfaces réseau VM à l'interface réseau physique

Notre serveur chez OVH n’a qu’une seule adresse IP publique, déjà configurée après l’installation

On va devoir mettre en place du NAT ! Plus exactement, on va mettre en place deux NATs consécutifs : un premier directement au niveau de Promox, un deuxième dans une VM pfSense

Voici le diagramme réseau représentant ce qu'on va devoir mettre en place :

![schema](/images/2025-11-14-17-59-36.png)

### Interfaces bridge

Sur GNU/Linux, on peut créer des interfaces réseaux appelées `bridges` (pont, en français). Ces interfaces virtuelles vont nous permettre d'inter-connecter des interfaces réseau physiques et également les interfaces réseau de nos machines virtuelles

On peut voir ça comme une sorte de **switch virtuel**, un peu comme les interfaces `réseau interne` sur Virtual Box

Par défaut, on a qu'une seule interface bridge : `vmbr0`, l'interface réseau physique `eno1` de notre serveur y est connectée. ⚠️ **Ne pas modifier la configuration de cette interface !**

**Cette interface `vmbr0` sera l'interface de sortie de notre NAT.**

Pour connecter le WAN de la VM pfSense qu'on va créer par la suite, il va nous falloir une nouvelle interface bridge.

➡️ Dans la section `Système > Réseau` du serveur Proxmox : `Créer` > `Linux Bridge` pour créer cette nouvelle interface.

➡️ Dans le champ `IPv4/CIDR`, on met l'adresse IP statique au format CIDR que nous voulons attribuer à notre serveur Proxmox sur cette interface : `192.168.42.1/24`. `Démarrage automatique` doit être coché, on laisse le reste des champs vides et `OK`.

➡️ On refait la même opération pour créer l'interface `vmbr2`, sans adresse `IPv4/CIDR` ce coup-ci ⚠️

➡️ `Appliquer la configuration` en haut !

On peut maintenant mettre en place notre premier NAT, au niveau du serveur Proxmox ! Proxmox est basé sur Debian, donc on va utiliser le pare-feu `iptables` pour faire ça

➡️ On ouvre le `Shell`.
Nnom d'utilisateur `user` et le mot de passe `xxxxxx`

💡 Les commandes tapées dans le `Shell` sont lancées directement sur le serveur dédié sur lequel Proxmox est installé. Attention, on peut facilement tout casser !

➡️ On vérifie nos interfaces bridges avec `ip a` pour voir si elles sont bien détectées et correctement configurées.

On doit avoir la configuration suivante :

- **vmbr0 :** l'adresse IP publique du serveur
- **vmbr1 :** `192.168.42.1/24`
- **vmbr2 :** pas d'adresse IPv4

### NAT Proxmox

➡️ On va éditer le fichier `sudo nano /etc/sysctl.conf`.

Dans ce fichier on doit **localiser puis décommenter la ligne `net.ipv4.ip_forward=1`**, en enlevant le caractère `#` au début de la ligne. Pour Save & Quit : `Ctrl+S` et `Ctrl+X`

➡️ On lance la commande `sudo sysctl -p /etc/sysctl.conf` pour appliquer la modification que nous venons d'effectuer (la commande devrait retourner `net.ipv4.ip_forward = 1`).

💡 Cette modification permet d'**activer l'IP forward**, sorte de "mode routeur" du noyau Linux.

➡️ Pour finir, `sudo iptables -t nat -A POSTROUTING -s 192.168.42.0/24 -o vmbr0 -j MASQUERADE` afin d'activer le NAT.

`-s 192.168.42.0/24` permet de n'autoriser que les paquets en provenance de ce sous-réseau à traverser le NAT.

`-o vmbr0` permet d'indiquer l'interface réseau de sortie.

On peut lancer la commande `sudo iptables -L -t nat` pour vérifier la configuration du pare-feu `iptables`

Ça y est, la configuration réseau sur Proxmox est terminée 🎉

## pfSense

💡 **pfSense est un système d'exploitation** permettant de transformer n'importe quel ordinateur en un **routeur** professionnel. Il n'est pas rare d'en rencontrer en entreprise !

Sur cette étape, nous allons créer une VM pfSense qui servira de passerelle/de routeur pour toutes nos VMs pour le reste de la formation.

### Création VM

➡️ Couton `Créer une VM`, tout en haut dans l'interface.

Voici les réglages à utiliser :

- ID : 100
- nom : NAT-pfSense
- iso : pfSense 2.7.2
- type : Other (à la place de "Linux")
- disque : 20 Gio
- RAM : 2048 MiB
- CPU : 1
- Pont (bridge) : vmbr1 (⚠️ très important)
- Pare-feu : décoché (⚠️ très important)

**Laisser tous les autres réglages par défaut.**

➡️ **Avant de démarrer la VM**, on ajoute une seconde interface réseau depuis la section `Matériel`. On sélectionne le Pont `vmbr2` cette fois-ci, et on décoche aussi le pare-feu.

### Installation

➡️ On démarre la VM, et on va dans la section `Console`

Rien de particulier pendant l'installation, il faut appuyer quasiment tout le temps sur `Entrée` pour valider le choix par défaut ! ⚠️ **Seule exception**, lors du choix du disque dur, il faudra appuyer sur la touche `Espace` pour cocher la case **avant** d'appuyer sur `Entrée`.

💡 Une fois l'installation terminée, on éjecte l'image ISO du lecteur de DVD virtuel via la section `Matériel` (`Éditer > N'utiliser aucun média`), afin d'éviter que l'installation se relance en boucle après le redémarrage.

![console pfsense](/images/2025-11-14-14-54-06.png)

### Configuration et test

Une fois la VM pfSense redémarrée, nous allons pouvoir configurer les adresses IPv4 sur ses interfaces et vérifier qu'elle a bien accès à Internet.

💡 Notre pfSense ne va pas récupérer automatiquement d'adresse sur son interface WAN : il n'y a pas de serveur DHCP actif sur notre pont `vmbr1` !

➡️ Sur pfSense : `8) Shell` avec le clavier (attention il est en Qwerty de base !), puis `kbdcontrol -l /usr/share/vt/keymaps/fr.kbd` pour passer le clavier en Azerty. `exit` pour retourner au menu.

➡️ Toujours sur la pfSense : `2) Set interface(s) IP address`, puis `1` pour configurer l'interface WAN (192.1168.42.254). La pfSense va vous poser une série de questions pour configurer cette interface, voir les points ci-dessous pour vous aider à répondre à ces questions.

💡 Petit indice : on ne veut pas récupérer une adresse via DHCP, mais attribuer une adresse IP fixe sur le pont `vmbr1` (notre switch virtuel entre la pfSense et Proxmox). Voir le diagramme pour déterminer l'adresse à utiliser sur la patte WAN de la pfSense !

⚠️ Attention, **cette interface WAN doit avoir une passerelle** : l'adresse IP de notre Proxmox sur le pont `vmbr1`. Cette passerelle sera celle utilisée **par défaut** par la pfSense.

💡 Pas besoin d'adresse IPv6, pas besoin d'activer un serveur DHCP sur le WAN, ni de désactiver HTTPS et repasser en HTTP pour l'interface web de la pfSense.

L'interface LAN a déjà une configuration par défaut. On modifiera cette configuration depuis l'interface graphique, après avoir installé une VM Windows 10 !

➡️ Toujours sur la pfSense : `7) Ping host` > `8.8.8.8` pour vérifier que la VM a bien accès à Internet.

### VM Windows 10

➡️ On va créer une nouvelle VM Windows 10.

💡 L'interface réseau doit être connectée sur le pont `vmbr2`, notre "switch virtuel" pour toutes nos VMs ! (décocher également le pare-feu dans la partie `Réseau`)

À la fin de l'installation, la machine Windows devrait obtenir une adresse IP grace au serveur DHCP de la pfSense installée précédemment.

➡️ Depuis un navigateur web de la VM Windows 10, on va sur l'interface de la pfSense à l'adresse [192.168.1.1](https://192.168.1.1).

💡 Le navigateur nous avertira d'un risque de sécurité, c'est normal. `Avancé` et pursuivre !

![login](/images/2026-02-26-18-25-45.png)

On se connecte avez le nom d'utilisateur `admin` et le mot de passe `pfsense`.

➡️ On suit les étapes du `Wizard pfSense Setup`, pour effectuer la configuration initiale de notre pfSense.

Voici les réglages à utiliser :

- Première page :
  - Hostname : pfSense
  - Domain : le nom du Proxmox + `.lan` (par exemple : `ns500131.lan`)
  - Primary DNS Server : `8.8.8.8`
  - Secondary DNS Server : laisser vide
  - Override DNS : décocher
- Deuxième page :
  - Time server hostname : laisser le serveur renseigné par défaut
  - Timezone : changer pour `Europe/Paris`
- Troisième page :
  - rien à changer, sauf tout en bas ! Décocher la case `Block RFC1918 Private Networks` (⚠️ très important)
- Quatrième page :
  - rien à changer, on laisse l'IP configurée pour l'instant.
- Cinquième page :
  - admin password : `xxxxxx`

`Reload` pour appliquer les changements.

Par défaut, pfSense utilise `192.168.1.1/24` comme adresse sur le LAN !

➡️ Dans `Interfaces > LAN` (depuis le menu tout en haut) on attribue l'adresse `10.0.0.1/16` à la pfSense sur le LAN. `Save` tout en bas puis d'appliquer les changements !

Dès cette configuration validée, nous allons **perdre l'accès à l'interface web de la pfSense** (normal, elle a changée d'adresse).

➡️ **Attribuer une adresse IP statique** à notre VM windows 10 sur le sous-réseau `10.0.0.0/16` (10.0.0.100)

💡 On configure l'adresse IP de la pfSense sur le LAN (`10.0.0.1`) comme passerelle et comme serveur DNS.

➡️ Reconnection à la pfSense via sa nouvelle adresse sur le LAN (`10.0.0.1`), puis `Services > DHCP Server` et on ajuste les paramètres du serveur DHCP sur le LAN. On veut qu'il distribue des adresses sur l'étendue `10.0.0.50 - 10.0.0.250`.

On  verifie que notre machine Windows 10 récupère bien une adresse IP en DHCP.

💡 Il y aura probablement un problème de DNS. Pour le résoudre, il faut se rendre dans `Services > DNS Resolver` sur la pfSense, puis relancer le service en utilisant le bouton 🔄 en haut à droite.

Une fois le service relancé, on a accès à Internet depuis la VM Windows 🎉

![pfsense](/images/2026-02-26-18-33-35.png)

## VPN

Pour pouvoir plus facilement bosser sur nos VMs par la suite, on va créer un VPN permettant de directement accéder à notre pfSense depuis le navigateur web de notre PC, et pouvoir prendre la main à distance sur nos VMs en utilisant le protocole RDP ou SSH.

### Serveur OpenVPN

Dans `VPN > OpenVPN`, onglet `Wizards`.

On laisse `Local User Access`, puis `Next`.

Remplir les différents champs en suivant :

- Première page :
  - Descriptive name : `vpn`
  - Common Name : `vpn`
  - les autres champs par défaut, et `Add new CA`.
- Deuxième page :
  - `Add new Certificate`
  - Descriptive name :`vpn-cert-server`
  - Common Name :`vpn-cert-server`
  - les autres champs par défaut, et `Create new Certificate`.
- Troisième page :
  - Description :`vpn-remote-access`
  - IPv4 Tunnel Network :`10.42.0.0/24`
  - IPv4 Local Network :`10.0.0.0/16`
  - les autres champs par défaut, et `Next`.
- Quatrième page :
  - Firewall Rule : ✅
  - OpenVPN rule : ✅
  - puis `Next`.
- et enfin `Finish` !

Le VPN est presque prêt ! Il faut encore que l'on créé les utilisateurs !

### Utilisateurs & certificats

Dans `System > User Manager`, puis `Add` :

- Username : `user1`
- Password/Confirm Password : un mot de passe solide.
- Certificate : ✅ (⚠️ sinon ça ne fonctionnera pas)
- Section `Create Certificate for User` :
  - Descriptive name : `user1-vpn-cert`
- les autres champs par défaut et `Save`.

Mêmes étapes pour le deuxième utilisateur `user2`.

On peut vérifier dans `System > Certificates` puis dans l'onglet `Certificates`, on doit avoir 3 nouveaux certificats (un pour le serveur, et un pour chaque utilisateur, en plus du certificat `GUI default` qui est présent de base)

### Export de la configuration client

Pour pouvoir exporter facilement les configurations pour nos utilisateurs du serveur VPN, on va devoir installer un paquet logiciel sur la pfSense.

Dans `System > Package Manager` > `Available Packages`.

On cherche "openvpn", et on installe le premier paquet de la liste : `openvpn-client-export` (en cliquant sur le bouton `+ Install` correspondant) !

Ensuite dans `VPN > OpenVPN`, puis sur l'onglet `Client Export`.

On va changer le champ `Host Name Resolution` : on remplace `Interface IP Address` par `Other`, **puis dans le champ `Host Name` l'adresse IPv4 publique de notre serveur Proxmox.**

Une fois que c'est fait, on va télécharger le fichier Inline Configurations : `Most Clients` ou `OpenVPN Connect (iOS/Android)` pour notre utilisateur un peu plus bas.

### Redirection de port sur Proxmox

Sur le shell Proxmox, se connecteret lancer la commande suivante :

```sh
sudo iptables -t nat -A PREROUTING -i vmbr0 -p udp --dport 1194 -j DNAT --to-destination 192.168.42.254
```

💡 Cette commande permet de créer une redirection du port 1194 sur le protocole UDP (utilisé par OpenVPN) vers notre pfSense.

### Connexion au VPN

Il faut installer le logiciel [OpenVPN Connect](https://openvpn.net/client/).

Une fois sur OpenVPN Connect, il faudra cliquer sur le bouton `Upload File` en bas pour charger votre fichier de configuration VPN récupéré à l'étape précédente.

Une fois le fichier importé, on peut se connecter en cliquant sur le bouton `Connect`. Renseignez le nom d'utilisateur (`user1` ou `user2`) et le mot de passe.

![vpn](/images/2026-02-26-18-44-58.png)

Depuis notre navigateur web (sur notre PC) accéder à [https://10.0.0.1/](https://10.0.0.1/). Si la page de connexion de notre pfSense s'affiche ça veut dire que le VPN fonctionne 🎉

## Sauvegarde iptables

Si tout fonctionne bien (Windows 10 a accès à Internet et le VPN fonctionne), on peut sauvegarder notre configuration `iptables`.

En effet, notre config' `iptables` pour le NAT sur Proxmox ne sera pas conservée après un redémarrage. Comme pour les équipements Cisco, il va falloir qu’on « sauvegarde » cette config.

➡️ **Sur le Shell de notre serveur Proxmox**, exporter la config' dans le fichier `/etc/iptables-rules.save` avec la commande `sudo iptables-save | sudo tee /etc/iptables-rules.save`.

On veut que ce fichier soit « appliqué » au démarrage, pour cela on doit rajouter la ligne `post-up iptables-restore < /etc/iptables-rules.save` dans le fichier `/etc/network/interfaces`, sous notre interface `vmbr0` (après une tabulation).

Utiliser la commande `sudo nano /etc/network/interfaces`, et ajoutez la ligne indiquée ci-dessus comme visible dans cette capture d'écran :

![screen](/images/2026-02-26-18-47-28.png)

## Bonus

Installation de Caddy ([challenge A307](/challenges/Challenge_A307.md)) et config : port 2019 dans le config.json

Config NAT Proxmox

``sudo iptables -t nat -A PREROUTING -i vmbr0 -p tcp --dport 2019 -j DNAT --to-destination 192.168.42.254``

Config NAT pfSense

![pfsense](/images/2025-11-14-13-10-10.png)

Lien vers le serveur : <http://54.36.121.237:2019/>

![OK](/images/2025-11-14-17-36-01.png)

## Méga Bonus

On retourne dans [Configuration](#configuration-proxmox) mais on ne s'occupe pas du NAT de Proxmox, on ajoute la nouvelle interface réseau puis on la configure directement dans pfsense en interface graphique : Interface/LAN3. Service/DHCP Serv/LAN3. et cette fois-ci : Firewall/Rules/LAN3.

![Firewall](/images/2025-11-14-16-50-42.png)

On peut créer une nouvelle VM sur ce LAN3, et y installer Caddy, il faut à nouveau rediriger un Port (401) vers ce nouveau serveur dans pfSense et Proxmox.

![NET LAN3](/images/2025-11-14-17-28-17.png)

``sudo iptables -t nat -A PREROUTING -i vmbr0 -p tcp --dport 401 -j DNAT --to-destination 192.168.42.254``

Il faut penser à sauvegarder à nouveau la table : ``sudo iptables-save | sudo tee /etc/iptables-rules.save``

Et ça fonctionne, lien vers le serveur : <http://54.36.121.237:401/>

![matrix](/images/2025-11-14-17-33-07.png)

Ajout d'un fichier start-caddy.bat au démarrage de la VM pour que le serveur caddy se relance après chaque redémarrage.

``@echo off
cd /d C:\caddy
echo Demarrage de Caddy.
caddy run --config caddy.json``
