# Challenge A303 05/11/2025

## Pitch de l’exercice 🧑‍🏫

### Au programme du challenge de ce soir ? La création d’un plan d’adressage 💪

**Pitch de l’exercice :**

Vous êtes recruté par une grande entreprise qui souhaite refaire complètement son réseau informatique.

L’entreprise est basé sur plusieurs sites : Montpellier et Bordeaux.

Sur **Montpellier**, le parc est composé de :

>- 200 PC fixes
>- 70 PC portables
>- 20 serveurs
>- 15 copieurs

Sur **Bordeaux**, le parc est composé de :

>- 100 PC fixes
>- 40 PC portables
>- 5 serveurs
>- 5 copieurs

Sur les deux sites, il faudra **deux réseaux WiFi** :

- un public, pour les visiteurs
- un privé, pour les PC portables des collaborateurs (quand ceux-ci ne seront pas connecté en filaire)

Pour des raisons de sécurité, l’entreprise souhaite que les machines soient cloisonnées dans des **sous-réseaux indépendants.**

Pour chaque site, il faut donc un sous-réseau pour :

- les PC fixes ou portables en filaire
- les serveurs
- les copieurs
- le WiFi public
- le WiFi privé

Proposez un plan d’adressage permettant de répondre à ce besoin !

Mais **attention** ⚠️ Vous devez, pour vos différents sous-réseaux, utiliser les réseaux privés de la RFC 1918.

On en reparlera de l’utilité de ces adresses et de cette RFC bientôt, mais en attendant, un petit tour sur la [page wikipédia](https://fr.wikipedia.org/wiki/R%C3%A9seau_priv%C3%A9) nous indique qu’on peut utiliser les plages d’adresses ci-dessous :

| - | -
| --- | ---
| 10.0.0.0/8 | 10.0.0.0 – 10.255.255.255
| 172.16.0.0/12 | 172.16.0.0 – 172.31.255.255
| 192.168.0.0/16 | 192.168.0.0 – 192.168.255.255

💡 Vous pouvez redécouper les plages ci-dessus, par exemple avoir un sous-réseau en 192.168.1.0/24 et un autre en 192.168.2.0/24.

**Seul impératif : vos sous-réseaux ne doivent pas se chevaucher** !

Chaque sous-réseau doit être au format X.X.X.X/Y (par exemple, 192.168.1.0/24)

Précisez aussi le nombre d’adresses utilisables pour des machines sur chaque sous-réseau !

Voici le rendu qui est attendu (bossez dans le bloc-note, ça suffit amplement) :

- Montpellier/PC    : 192.168.1.0/24 (254 adresses)
- Montpellier/SRV   : 192.168.7.0/24 (254 adresses)
- Montpellier/COPY  : X.X.X.X/Y      (Z adresses)
- Montpellier/pubW  : X.X.X.X/Y      (Z adresses)
- Montpellier/privW : X.X.X.X/Y      (Z adresses)
- Bordeaux/PC       : 192.168.1.0/24 (254 adresses)
- Bordeaux/SRV      : 192.168.7.0/24 (254 adresses)
- Bordeaux/COPY     : X.X.X.X/Y      (Z adresses)
- Bordeaux/pubW     : X.X.X.X/Y      (Z adresses)
- Bordeaux/privW    : X.X.X.X/Y      (Z adresses)

### Bonus 🍬

En bonus, je vous encourage très fortement à pratiquer le protocole DHCP sur Packet Tracer !

Vous pouvez aussi tenter de vous connecter à un équipement Cisco depuis son port Console dans Packet Tracer !

---

## Challenge A303 ⌨️

### Plan d'adressage 🌐

Montpellier :

- LAN1 : min 270 machines en filaire
- LAN2 : min 20 servers
- LAN3 : min 15 copieurs
- LAN4 : min 70 machines en Wifi Privé
- LAN5 : min X machines en Wifi Public

Bordeaux :

- LAN6 : min 150 machines en filaire
- LAN7 : min 5 servers
- LAN8 : min 5 copieurs
- LAN9 : min 40 machines en Wifi Privé
- LAN10 : min X machines en Wifi Public

Réseaux Privés sur la plage 192.168.0.0 à 192.168.255.255

| Emplacement        | Subnet          | Plage IP disponibles        | Nombre d'adresses Host
| --- | --- | --- | ---
| Montpellier/PC     | 192.168.0.0/23  | 192.168.0.1 à 192.168.1.254 | 510
| Montpellier/SERV   | 192.168.2.0/24  | 192.168.2.1 à 192.168.2.254 | 254
| Montpellier/COPY   | 192.168.3.0/24  | 192.168.3.1 à 192.168.3.254 | 254
| Montpellier/WIFIPV | 192.168.4.0/24  | 192.168.4.1 à 192.168.4.254 | 254
| Montpellier/WIFIPB | 192.168.5.0/24  | 192.168.5.1 à 192.168.5.254 | 254
| Bordeaux/PC        | 192.168.6.0/24  | 192.168.6.1 à 192.168.6.254 | 254
| Bordeaux/SERV      | 192.168.8.0/24  | 192.168.7.1 à 192.168.7.254 | 254
| Bordeaux/COPY      | 192.168.8.0/24  | 192.168.8.1 à 192.168.8.254 | 254
| Bordeaux/WIFIPV    | 192.168.9.0/24  | 192.168.9.1 à 192.168.9.254 | 254
| Bordeaux/WIFIPB    | 192.168.10.0/24 | 192.168.10.1 à 192.168.10.254 | 254

### Bonus 🍬

#### DHCP test dans packet tracer

Une fois le server DHCP configuré (ici Server IP 192.168.1.1, DHCP IP Start 192.168.1.100/24) et allumé

On peut observer via la simulation les différentes requêtes (*DORA*)

![end](/images/2025-11-05-21-25-18.png)

- Discover : le PC envois sa demande en broadcast

![start](/images/2025-11-05-21-14-36.png)

- Offer : le server DHCP répond avec une offre

- Request : le client reçois l'offre et renvois un broadcast pour accepter

![DORA](/images/2025-11-05-21-31-30.png)

- ACKnowledge : le server DHCP renvois la configuration qui donnera la bonne IP au client

![ACK](/images/2025-11-05-21-35-21.png)

Je ne comprends pas pourquoi le DHCP renvois l'ACK en Broadcast ?

![?](/images/2025-11-05-21-42-22.png)

Quand il y a plusieurs Clients, je ne comprends pas comment le DHCP choisi le bon client pour renvoyer l'Offer ou le ACK vu que tout se fait en Broadcast, à moins que ce soit un bug de packet tracer.

#### Connexion Switch Cisco depuis son port Console dans Packet Tracer

Je relie le Port RS232 du Labtop au port RJ Console du Switch. Je vais dans le Terminal du Labtop et avec la bonne config de port j'arrive sur le Cisco IOS Software de contrôle du Switch.

![console](/images/2025-11-05-22-06-15.png)

La commande enable me permet d'entrer dans plus d'options de config

![enable](/images/2025-11-05-22-07-36.png)
