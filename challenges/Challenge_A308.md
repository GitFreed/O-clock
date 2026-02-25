# Challenge A308 14/11/2025

## Pitch de l’exercice 🧑‍🏫

[Pitch de l'Atelier A308](https://github.com/O-clock-Aldebaran/SA3-atelier-proxmox)

![schema logique](/images/2025-11-14-17-59-36.png)

![Serveur](/images/2025-11-14-09-56-09.png)

---

> 📚 **Ressources :**
>
>- Proxmox : <https://fr.wikipedia.org/wiki/Proxmox_Virtual_Environnement>
>- Pfsense : <https://fr.wikipedia.org/wiki/PfSense>

---

[Configuration](#configuration)
[Bonus](#bonus)
[MégaBonus](#méga-bonus)

---

## Configuration

Proxmox, un Hyperviseur de type 1, permet de superviser le matériel serveur. On doit configurer l'interface réseau. Ajout de Bridges qui vont permettre de connecter nos interfaces réseau VM à l'interface réseau physique.

Mise en place du NAT au niveau du serveur Proxmox, activation l'IP forward, sorte de "mode routeur" du noyau Linux et activation avec ``sudo iptables -t nat -A POSTROUTING -s 192.168.42.0/24 -o vmbr0 -j MASQUERADE``

Installation et configuration de pfSense sur une VM, qui en fera un routeur pour nos futures VMs. On y ajoute des interfaces réseau pour nos futurs LANs. Il faut passer en AZERTY avec la commande ``kbdcontrol -l /usr/share/vt/keymaps/fr.kbd``

Configuration à partir de la console

![console pfsense](/images/2025-11-14-14-54-06.png)

On y config l'interface WAN en IP fixe (192.1168.42.254). La suite se fera via l'interface graphique sur une VM.

Installation d'une VM Win10. Config du LAN via l'interface graphique de pfSense. Interface/LAN. Service/DHCP. etc

Installation du VPN dans VPN/OpenVPN et config de ce dernier avec des utilisateurs et certificats.

![VPN OK](/images/2025-11-14-12-00-53.png)

## Bonus

Installation de Caddy ([challenge A307](/challenges/Challenge_A307.md)) et config : port 2019 dans le config.json

Config NAT Proxmox

``sudo iptables -t nat -A PREROUTING -i vmbr0 -p tcp --dport 2019 -j DNAT --to-destination 192.168.42.254``

Config NAT pfSense

![pfsense](/images/2025-11-14-13-10-10.png)

Lien vers le serveur : <http://54.36.121.237:2019/>

![OK](/images/2025-11-14-17-36-01.png)

## Méga Bonus

On reviens dans [Configuration](#configuration) mais on ne s'occupe pas du NAT de Proxmox, on ajoute la nouvelle interface réseau puis on la configure directement dans pfsense en interface graphique Interface/LAN3. Service/DHCP Serv/LAN3. et cette fois-ci : Firewall/Rules/LAN3.

![Firewall](/images/2025-11-14-16-50-42.png)

Je vais créer une nouvelle VM (401) sur ce LAN3, et y installer Caddy, il faut à nouveau rediriger un Port (401) vers ce nouveau serveur dans pfSense et Proxmox.

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

---
