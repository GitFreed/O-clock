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

## 3. Routage inter-VLAN 🔀
