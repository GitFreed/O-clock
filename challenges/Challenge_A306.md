# Challenge A306 12/11/2025

## Pitch de l’exercice 🧑‍🏫

![Challenge A306](/images/2025-11-12-16-27-07.png)

[Cours A306.](/RESUME.md#-a306-dns-telnet-et-ssh)

---

## Ma Box 👾

J'accède a l'interface de ma box via l'IP 192.168.1.254, il y  aune vue globale mais dans le menu les options sont intéressantes.

![ma box](/images/2025-11-12-16-31-28.png)

Vision des appareils connectés sur mon réseau, gestion des paramètres du Wifi, et des réglages avancés dans lesquels on va trouver les configurations  de pare-feu, DHCP, filtrage d'adresses Mac, etc

![DHCP](/images/2025-11-12-17-17-21.png)

## Désactiver le CG-NAT 🌐

Pour avoir une adresse IP "fullstack" c'est à dire avoir une "vraie" adresse IP publique personnelle et non une IP partagée donnée par notre fournisseur via le CG-NAT (Carrier-Grade Network Address Translation), étant chez B&You je dois contacter le SAV via le chat de l'application. L'employé qui m'a répondu ne savait pas ce que c'était, j'ai demandé à remonter ma demande à un technicien nv2 mais je n'ai pas eu de suite.

## DNS et SSH dans Packet Tracer 🖥️

Je crée un réseau avec un Switch, un Serveur gérant DNS & DHCP, un Serveur hébergeant une page HTTP à afficher.

- LAN 192.168.0.0/24
- Server 1 DNS/DHCP : 192.168.0.1
- Server 2 Home.com : 192.168.0.2
- Switch : 192.168.0.254 (conf t / interface vlan 1 / ip address / no shutdown)

Config DNS sur Server 1 :

![DNS](/images/2025-11-12-18-00-30.png)

Config DHCP sur Server 1 :

![DHCP](/images/2025-11-12-18-01-02.png)

Config HTTP / index.html sur Server 2 :

![html](/images/2025-11-12-18-03-07.png)

une fois le Labtop branché au Switch, il récupère bien toutes les informations :

![Labtop](/images/2025-11-12-18-04-46.png)

J'ouvre le web browser, et j'entre l'URL de mon server 2 : Home.com

![URL](/images/2025-11-12-18-05-52.png)

Config du Switch pour SSH :

1. enable
2. conf t
3. Hostname HomeSwitch
4. Secret ******
5. ip domain-name *Home*
6. crypto key generate rsa *1024*
7. ip ssh version 2
8. line vty 0 4
9. transport input ssh
10. login local
11. exit
12. username *boss* password *****
13. end
14. copy run sta

Connexion depuis le Labtop sur l'interface client SSH :

![SSH](/images/2025-11-12-18-24-59.png)

Une fois la connexion réussi il me demande le mdp admin et on arrive sur l'invite de commande permettant de gérer le switch à distance.

![CLI](/images/2025-11-12-18-26-27.png)

En SSH la connexion est sécurisée contrairement à ce qu'on a vu avec Telnet.

![Sniffer](/images/2025-11-12-18-34-19.png)

[Fichier Packet Tracer](/challenges/Challenge_A306.pkt) de ce Challenge
