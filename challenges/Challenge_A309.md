# Challenge A309 17/11/2025

## Pitch de l’exercice 🧑‍🏫

![Challenge A309](/images/2025-11-17-16-32-48.png)

[Doc ACLs](https://www.it-connect.fr/les-listes-de-controle-dacces-acl-avec-cisco/)

---

## 1. VLANs & routage inter-VLANs 🌐

Installation.

![Installation](/images/2025-11-17-17-44-20.png)

Config de base sur les 3 switchs.

![Config switchs](/images/2025-11-17-17-44-48.png)

On active le mode Trunk sur les ports Gig qui les relient pour que les Vlans puisse communiquer d'un Switch à l'autre.

![trunk](/images/2025-11-17-17-58-28.png)

Test ping OK

![ping](/images/2025-11-17-18-02-46.png)

## 2. Sécurité & VLANs 🔐

Pour sécuriser nos Vlans, on va créer un Vlan Admin qui sera le seul en mode Natif (le seul qui peut envoyer des paquets untagged, en remplaçant le Default) avec la commande trunk native, et on va limiter les Vlans qui peuvent passer (le 10 20 30 et 50) en mode trunk avec trunk allowed.

![vlan50](/images/2025-11-17-19-18-00.png)

Connexion en SSH, il faut configurer le port sur lequel on se connecte comme sur les autres switchs.

![SSH](/images/2025-11-17-20-38-26.png)

## 3. Routage inter-VLAN 🔀

On va configurer le routeur (L3) avec les mêmes VLANs, trunk, et une passerelle sur chaque LAN et activer le routage avec ``ip routing``

Il faut également indiquer à chaque machine sa passerelle.

![gateway](/images/2025-11-17-19-34-17.png)

Ping d'un PC en 192.168.1.x vers un 172.16.0.x OK !

![ping ok](/images/2025-11-17-19-41-29.png)

## Bonus : ACLs 🔏

Ex: Autoriser les machines du VLAN 20 et 30 à seulement joindre un serveur spécifique dans le VLAN 10, ici je vais prendre le 192.168.1.20 sur le Sw3.

Je vais ajouter 2 ACL sur le Sw3 juste avant le serveur :

- Autoriser l'accès des IP du LAN2 : ``access-list 1 permit 172.16.0.0 0.0.255.255`` (network + wildcard mask /16)
- Autoriser l'accès des IP du LAN3 : ``access-list 2 permit 10.0.0.0 0.0.255.255`` (network + wildcard mask /16)
- Les autres IP ne faisant pas parti de ces LAN seront forcément refusées
- J'applique ces règles sur l'interface ou le serveur est relié (fa 0/2) avec ``ip access-group 1 in``

![??](/images/2025-11-17-20-46-18.png)
