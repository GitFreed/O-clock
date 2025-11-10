# Challenge A305 07/11/2025

>[Pitch](#pitch-de-lexercice-)
>
>Résolution :
>
>1. [Plan Adressage](#1-plan-dadressage-)
>2. [Installation](#2-installation-)
>3. [Config Switchs](#3-config-switchs-)
>4. [Config IP & GW Routeurs](#4-config-ip--gw-routeurs-)
>5. [Routes statiques](#5-routes-statiques-️)
>6. [DHCP](#6-dhcp-)
>7. [Bonus](#bonus-)
>8. [Méga_Bonus](#méga-bonus)
>
>[Fichier packet Tracer](/challenges/Challenge_A305.pkt)
>

## Pitch de l’exercice 🧑‍🏫

## S03 : Atelier Packet Tracer

Premier atelier de cette S03 !

🍔 Au menu :

- adressage IPv4
- configuration de switchs Cisco
- configuration de routeurs Cisco
- routes statiques
- DHCP

## Contexte

Une nouvelle entreprise vous recrute pour professionnaliser son réseau. Actuellement, les salariés sont connectés en WiFi sur des box FAI avec du matériel hétérogène.

Le parc informatique va être complètement renouvelé.

L'entreprise est en pleine expansion, et recrute fréquemment de nouveaux salariés. Actuellement, il y a 59 collaborateurs, vous y compris, mais l'entreprise pourrait dépasser 200 salariés ou plus dans les mois/années à venir ! 📈

Voici les différents services de l'entreprise ainsi que le nombre de salariés par service :

- commerciaux : 16
- communication : 5
- comptabilité : 5
- direction : 4
- ressources humaines : 2
- juridique : 2
- recherche et développement : 23
- informatique : 2

L'entreprise a des bureaux à Paris et à Lille, mais ils envisagent à terme d'ouvrir un site par département Français.

À Paris, on retrouve la direction, la comptabilité, le service juridique, la communication et les ressources humaines.
Il y a également 10 commerciaux, 12 ingénieurs R&D et un informaticien.

Le site de Lille compte 11 ingénieurs R&D, 6 commerciaux et un informaticien.

Sur le site de Paris, une salle serveur va être créée et équipée 4 serveurs. Le coeur du réseau y sera installé. Les salariés du service R&D sont dans un batiment différent, équipé d'une petite baie informatique, de quoi y installer un peu de matériel réseau ! La baie du batiment R&D sera relié à la salle serveur avec une fibre optique.

Les salariés peuvent travailler de façon nomade : depuis leur domicile en télétravail ou en déplacement chez des clients pour les commerciaux, par exemple. Ils se connectent via un VPN sur le routeur du site de Paris au réseau de l'entreprise (plus d'infos ci-dessous).

## Étape 1 - Plan d'adressage

Proposez un plan d'adressage pour le réseau de l'entreprise.

Voici les sous-réseaux minimum à créer :

- Paris :
  - LAN (tous les PC fixes et portables)
  - DMZ (zone démilitarisée, pour les serveurs, voir ci-dessous)
  - WiFi public (pour les visiteurs, filaire obligatoire pour les salariés)

- Lille :
  - LAN (tous les PC fixes et portables)
  - WiFi public (pour les visiteurs, filaire obligatoire pour les salariés)

- VPN (un sous-réseau dans lequel se trouvent les machines des collaborateurs à distance)

Pour chacun des sous-réseaux ci-dessus, vous devez choisir une plage d'adresses IP permettant d'accueillir suffisamment de machines pour les besoins actuels et futurs de l'entreprise. Présentez la plage d'adresses IP du sous-réseau avec la notation CIDR, exemple : `192.168.42.0/24`.

Commencez également à réfléchir à l'adresse de la passerelle (du routeur) dans chaque sous-réseau. Les switchs ne seront pas dans un sous-réseau indépendant, mais on en reparle plus tard, vous pouvez les ignorer pour l'instant.

À ce stade, pas besoin de packet tracer ! Travaillez dans le bloc-note par exemple.

> [!NOTE]  
> Une zone démilitarisée (DMZ) est un sous-réseau un peu particulier : les machines dans ce sous-réseaux sont isolées du LAN par des règles de pare-feu spécifiques. Pas de panique, on ne va pas configurer de pare-feu dans cet atelier, on y reviendra plus tard dans la saison.

## Étape 2 - Câblage

L'informaticien déjà présent dans l'entreprise a travaillé avec un cabinet de conseil sur demande de la direction, et du matériel réseau a déjà été acheté en suivant les recommandations des consultants.

Pas le choix, il falloir l'utiliser ce matériel !

Voici la liste du matériel réseau à votre disposition :

- Routeurs :
  - 2x Cisco 2901 (un pour Paris, un pour Lille)
  - 1x Cisco 1941 (pour le VPN)

- Modules et cartes d'extension pour routeurs :
  - 5x cartes HWIC-1GE-SFP, avec 5x modules SFP GLC-LH-SMD
  - 2x cartes HWIC-2T

- Switchs :
  - 4x Cisco 3650-24PS (2 pour le LAN de Paris, un pour la DMZ, un pour le LAN de Lille)
  - 3x Cisco 2960-24TT (1 pour le WiFi de Paris, un pour le WiFi de Lille, un pour le VPN)

- Modules et cartes d'extension pour switchs :
  - 4x alimentations AC-POWER-SUPPLY (une par switch 3650-24PS)
  - 5x modules SFP GLC-LH-SMD

- Autres équipements :
  - 4x Serveurs
  - 3x Copieurs (2 pour Paris dont un pour le batiment R&D, un pour Lille)

Pour le WiFi, on s'embête pas : on connectera directement les machines sur le switch 2960-24TT en filaire.

Le cabinet de conseil a recommandé à la direction de connecter les switchs et les routeurs en fibre optique, dès que c'était possible, d'où ce choix de matériel. Depuis, la direction ne jure plus que par la fibre ... Pas le choix, il faut donc relier le maximum d'équipements possibles en fibre optique.

Le routeur 1941 utilisé pour le VPN doit être relié au routeur 2901 du site du Paris avec une liaison `Serial DTE`, c'est à ça que servent les cartes HWIC-2T ! Pas de panique, ça fonctionne comme un câble ethernet ou une fibre optique classique.

Pour les PC fixes et et portables, mettez-en quelques-uns, pas besoin de tous les mettre ! Ne configurez aucune adresse IP à ce stade.

## Étape 3 - Configuration des switchs

Sur chaque switch, vous allez devoir :

- configurer le `hostname`
- ajouter un mot de passe pour protéger le mode privilégié (utilisez le même partout)
- configurer une adresse IP sur l'interface Vlan1

L'adresse IP doit être dans le même sous-réseau que les postes connectés au switch.

Mettez une adresse IP statique sur au moins un PC par sous-réseau pour pouvoir pinger le switch.

## Étape 4 - Configuration initiale des routeurs

Sur chaque routeur, vous allez devoir :

- configurer le `hostname`
- ajouter un mot de passe pour protéger le mode privilégié (utilisez le même partout)
- configurer une adresse IP sur chaque interface du routeur connectée à un de nos sous-réseaux

Pour la connexion entre Paris et Lille, utilisez les adresses IP :

- 92.12.34.1/24 pour le routeur de Paris
- 92.12.34.2/24 pour le routeur de Lille

Pour la connexion entre Paris et le VPN, utilisez les adresses IP :

- 92.56.78.1/24 pour le routeur de Paris
- 92.56.78.2/24 pour le routeur du VPN

> [!NOTE]  
> Internet, ça fonctionne pas comme ça ! Mais pour les besoins de cet atelier on va faire comme ça.

À ce stade, le ping devrait passer entre le LAN de Paris, la DMZ et le WiFi public de Paris. De la même façon, le ping devrait fonctionner entre le LAN et le WiFi public de Lille.

> [!TIP]
> Si le ping ne fonctionne pas, vérifiez bien si vous n'avez pas oublié de configurer la passerelle sur les PC !

Le ping ne fonctionne pas encore entre les machines des sites de Lille et de Paris ou du VPN, mais il devrait fonctionner entre les routeurs.

## Étape 5 - Routes statiques

Ajoutez des routes statiques et/ou des routes par défaut sur les routeurs de Lille, Paris et du VPN.

L'objectif ? Faire fonctionner le ping entre tous les sous-réseaux !

## Étape 6 - DHCP

Les salariés sont amenés à se déplacer, pour se faciliter la vie on va donc configurer DHCP sur l'ensemble des réseaux.

Modifiez la configuration des routeurs pour activer DHCP !

Les serveurs et copieurs doivent avoir des adresses IP statiques.

## Bonus

Déjà fini ? Si vous avez encore du temps et de l'énergie, vous pouvez essayez de remplacer les switchs 2960 utilisés pour le WiFi par des point d'accès WiFi !

Utilisez l'équipement AP-PT (Access Point) dans Packet Tracer, dans la catégorie `Network devices` > `Wireless`.

## Méga bonus

Envie d'aller plus loin ?

Devoir configuer DHCP sur chaque routeur est un peu galère, ce serait bien qu'on puisse tout configurer sur un serveur central (dans la DMZ, par exemple), avec plusieurs pools pour chaque sous-réseau ! Problème, les trames DHCP sont en broadcast, et ne traversent donc pas les routeurs...

Il faudrait trouver un moyen de *relayer* les trames DHCP vers notre serveur 🤔

---

## Atelier SA3 ⌨️

## 1. Plan d'adressage 🧮

**Requirements :**

- Salariés : 200+
- Pôles : commercial (16) com (5) compta (5) dir (4) rh (2) juri (2) r&d (23) info (2)
- Sites : Paris, Lille, autres départements potentiels (total : 96)
- Paris : dir, compta, jur, com, r&d, info
- Lille : com, r&d, info
- Paris : Salle Servers de 4 machines : Coeur réseau <-> Salle R&D avec Baie reliée en Fibre
- VPN sur le Routeur de Paris
- Copieurs : Paris (2) dont 1 r&d et Lille (1)

Paris :

- LAN1 : 60+ machines en filaire
- LAN2 : x machines en Wifi Public
- LAN3 : 1+ copieurs
- LAN4 : VPN
- LAN5 : 4 servers (DMZ)

Lille :

- LAN1 : 20+ machines en filaire
- LAN2 : x machines en Wifi Public
- LAN3 : 1+ copieurs

**Prévisions et Futurs Départements :**

- LAN1 : 100+ machines en filaire
- LAN2 : 50+ machines en Wifi Public
- LAN3 : 10+ copieurs
- LAN4 : 10+ servers (DMZ)
- LAN5 : VPN

Réseaux Privés sur la plage 192.168.0.0/24, 172.16.0.0/12, 10.0.0.0/8

| Emplacement        | Subnet          | Plage IP disponibles        | Nombre d'adresses Host | Adresses réservées
| --- | --- | --- | --- | ---
| Paris/VPN    | 10.0.0.0/22  (255.255.252.0)   | 10.0.0.1   à 10.0.3.254 | 1022 | GW : 10.0.0.1 , Switch VPN : 10.0.3.254
| --- | --- | --- | --- | ---
| Paris/PC     | 10.75.10.0/23 (255.255.254.0) | 10.75.10.1 à 10.75.11.255 | 510 | GW : 10.75.10.1 , Switch PC : 10.75.10.254
| Paris/WIFI   | 10.75.20.0/23 (255.255.254.0) | 10.75.20.1 à 10.75.21.255 | 510 | GW : 10.75.20.1 , Switch Wifi : 10.75.20.254
| ~~Paris/PRINT~~   | ~~10.75.30.0/24 (255.255.255.0)~~ | 10.75.30.1 à 10.75.30.255 | 254 | GW : 10.75.30.1 , Switch PRINT : 10.75.30.254
| Paris/DMZ    | 10.75.40.0/24 (255.255.255.0) | 10.75.40.1 à 10.75.40.255 | 254 | GW : 10.75.40.1 , Switch DMZ : 10.75.40.254
| --- | --- | --- | --- | ---
| Lille/PC     | 10.59.10.0/23 (255.255.254.0) | 10.59.10.1 à 10.59.11.255 | 510 | GW : 10.59.10.1 , Switch PC : 10.59.10.254
| Lille/WIFI   | 10.59.20.0/23 (255.255.254.0) | 10.59.20.1 à 10.59.21.255 | 510 | GW : 10.59.20.1 , Switch Wifi : 10.59.20.254
| ~~Lille/PRINT~~   | ~~10.59.30.0/24 (255.255.255.0)~~ | 10.59.30.1 à 10.59.30.255 | 254 | GW : 10.59.30.1 , Switch PRINT : 10.59.30.254
| Lille/DMZ    | 10.59.40.0/24 (255.255.255.0) | 10.59.40.1 à 10.59.40.255 | 254 | GW : 10.59.40.1 , Switch DMZ : 10.59.40.254
| --- | --- | --- | --- | ---
| SiteX/PC     | 10.xx.10.0/23 (255.255.254.0) | 10.xx.10.1 à 10.xx.11.255 | 510 | GW : 10.xx.10.1 , Switch PC : 10.xx.10.254
| SiteX/WIFI   | 10.xx.20.0/23 (255.255.254.0) | 10.xx.20.1 à 10.xx.21.255 | 510 | GW : 10.xx.20.1 , Switch Wifi : 10.xx.20.254
| ~~SiteX/PRINT~~   | ~~10.xx.30.0/24 (255.255.255.0)~~ | 10.xx.30.1 à 10.xx.30.255 | 254 | GW : 10.xx.30.1 , Switch PRIN : 10.xx.30.254
| SiteX/DMZ    | 10.xx.40.0/24 (255.255.255.0) | 10.xx.40.1 à 10.xx.40.255 | 254 | GW : 10.xx.40.1 , Switch DMZ : 10.xx.40.254
| --- | --- | --- | --- | ---
| Routeur Paris > Lille | 92.12.34.1/24 | --- | --- | ---
| Routeur Lille < Paris | 92.12.34.2/24 | --- | --- | ---
| Routeur Paris > VPN   | 92.56.78.1/24 | --- | --- | ---
| Routeur VPN > Paris   | 92.56.78.2/24 | --- | --- | ---

**Matériel :**

Paris : 1 Routeur Cisco 2901, 3 Switchs Cisco 3650-24PS (2 LAN, 1 DMZ), 1 Switch Cisco 2960-24TT (Wifi), 2 Copieurs (dont R&D)

VPN : 1 Routeur Cisco 1941, 1 Switch Cisco 2960-24TT

Lille : 1 Routeur Cisco 2901,  1 Switch Cisco 3650-24PS (LAN), 1 Switch Cisco 2960-24TT (Wifi), 1 Copieur

Mods :

Routeurs : 5x cartes HWIC-1GE-SFP avec 5x mods SFP GLC-LH-SMD, 2x cartes HWIC-2T

Switchs : 4x AC-POWER-SUPPLY (3650-24PS), 5x mods SFP GLC-LH-SMD

Connexion :

Wifi = filaire sur le switch 2960-24TT

Connecter les switchs et les routeurs en fibre optique

Le routeur 1941 utilisé pour le VPN doit être relié au routeur 2901 du site du Paris avec une liaison Serial DTE (cartes HWIC-2T)

## 2. Installation 🔌

![Cable Mngt](/images/2025-11-07-13-42-37.png)

## 3. Config Switchs 🌐

Démarrer, renommer (nommenclature Sw-région-emplacement), sécuriser et arrtibuer une IP à chaque Switch. Ping tests OK 🥳

![Switchs](/images/2025-11-07-16-15-17.png)

## 4. Config IP & GW Routeurs 🌐

Démarrer, renommer (nommenclature Rootroot-région), sécuriser et arrtibuer les IP de chaque Routeur, entre eux et les Gateway. Ping tests OK 🥳

![Routers](/images/2025-11-07-16-50-39.png)

## 5. Routes statiques 🛣️

RootrootVNP :

>ip route 0.0.0.0 0.0.0.0 92.56.78.1

Rootroot59 :

>ip route 0.0.0.0 0.0.0.0 92.12.34.1

Rootroot75 :

>ip route 10.0.0.0 255.255.252.0 92.56.78.2
>
>ip route 10.59.10.0 255.255.254.0 92.12.34.2
>
>ip route 10.59.20.0 255.255.254.0 92.12.34.2

Pings OK 🥳

![Routes](/images/2025-11-07-17-34-09.png)

## 6. DHCP 🤖

[DHCP sur Routeurs](https://www.it-connect.fr/configurer-le-service-dhcp-sur-un-routeur-cisco/)

Routeur du VPN :
>enable, con f,
>
>RootrootVPN(config)#ip dhcp pool LAN_VPN
>
>RootrootVPN(dhcp-config)#network 10.0.0.0 255.255.252.0
>
>RootrootVPN(dhcp-config)#default-router 10.0.0.1
>
>RootrootVPN(dhcp-config)#end
>
>RootrootVPN#copy run sta

Routeur Paris :

>Rootroot75(config)#ip dhcp pool LAN_PC75
>
>Rootroot75(dhcp-config)#network 10.75.10.0 255.255.254.0
>
>Rootroot75(dhcp-config)#default-router 10.75.10.1
>
>Rootroot75(dhcp-config)#exit
>
>Rootroot75(config)#ip dhcp pool LAN_WIFI75
>
>Rootroot75(dhcp-config)#network 10.75.20.0 255.255.254.0
>
>Rootroot75(dhcp-config)#default-router 10.75.20.1
>
>Rootroot75(dhcp-config)#exit
>
>Rootroot75(config)#ip dhcp pool DMZ75
>
>Rootroot75(dhcp-config)#network 10.75.40.0 255.255.255.0
>
>Rootroot75(dhcp-config)#default-router 10.75.40.1

Routeur Lille :

>Rootroot59(config)#ip dhcp pool LAN_WIFI59
>
>Rootroot59(dhcp-config)#network 10.59.20.0 255.255.254.0
>
>Rootroot59(dhcp-config)#default-router 10.59.20.1
>
>Rootroot59(dhcp-config)#exit
>
>Rootroot59(config)#ip dhcp pool LAN_PC59
>
>Rootroot59(dhcp-config)#network 10.59.10.0 255.255.254.0
>
>Rootroot59(dhcp-config)#default-router 10.59.10.1

Je branche des Labtop dans chaque LAN et active leur DHCP et... c'est bon!! 🥳

![DHCP](/images/2025-11-07-18-24-53.png)

![Reseau](/images/2025-11-07-18-51-24.png)

## Bonus 🛜

Je remplace comme demandé les Switchs par des Access point WIFI (AT-PT), je les branche sur les mêmes ports que les précédents, je configure leur Wifi (SSID,password)

![AT-PT](/images/2025-11-10-15-50-17.png)

Installation de cartes Wifi sur les Portables

![carte wifi](/images/2025-11-10-15-47-33.png)

Page de recherche et connection au réseau Wifi depuis un Labtop dans "Desktop/PC Wireless"

![Wifi](/images/2025-11-10-15-51-27.png)

Avec la mise en place du DHCP sur les Routeurs, les Labtops ont directement la bonne IP et Passerelle une fois connectés, les Pings passent sans problème.

![avec wifi all](/images/2025-11-10-15-59-55.png)

## Méga Bonus 🖥️

Comme indiqué dans l'intitulé, si on configure un serveur DHCP dans la DMZ, les machines en dehors du LAN de la DMZ n'y auraient pas accès car les routeurs cloisonnent et empêchent donc les demandes DHCP en broadcast de passer.

[Mise en place d'un agent relais DHCP](https://www.it-connect.fr/mise-en-place-dun-agent-relais-dhcp/)

Il va donc falloir configurer en premier temps un server DHCP qui gère différentes "pool" d'adresses, c'est à dire les plages d'adresses/passerelles, dans notre exercice : 6 LAN différents :

![servDHCP](/images/2025-11-10-16-48-17.png)

Maintenant je dois activer l'agent relai sur chaque Routeur en indiquant ou se trouve le serveur DHCP :

>1. RootrootVPN>enable
>2. Password:
>3. RootrootVPN#conf t
>4. RootrootVPN(config)#interface gigabitEthernet 0/0
>5. RootrootVPN(config-if)#ip helper-address 10.75.40.14
>6. RootrootVPN(config-if)#end
>7. RootrootVPN#copy run sta

![agent relai](/images/2025-11-10-17-10-32.png)

On doit activer ce relai sur chaque port ou nous pouvons potentiellement recevoir une demande DHCP.

Exemple pour celui de Paris avec 3 interfaces :

![relai paris](/images/2025-11-10-17-17-38.png)
