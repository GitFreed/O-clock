# Challenge A401 19/11/2025

## Pitch de l’exercice 🧑‍🏫

⌨️ Nous avons vu l'installation de Windows Server 2019. Vous devez réinstaller Windows Server 2022 sur VMware.

[Cours A401.](https://github.com/GitFreed/O-clock/blob/main/RESUME.md#-saison-a4-windows-server)

---

## 1. Installation de VMware et pfSense

VMware est bien plus stable que VirtualBox, une fois la prise en main effectué on s'y retrouve vite.

Installation de pfSense pour servir de Routeur virtuel comme sur notre serveur Proxmox.

Je configure pfSense sur le réseau virtuel (VMnet8) en NAT, et je lui ajoute une seconde carte réseau avec un Lan Segment qui sera le LAN pour mes machines.

![NAT](/images/2025-11-19-18-39-42.png)

Sur mon WAN la gateway est donc 198.162.8.2 car 198.168.8.1 est prise par le Virtual Network de VMware.

Je configure dans pfSense (via Set interface IP) l'interface LAN : 198.168.80.1

![pfsense](/images/2025-11-19-18-36-35.png)

à partir de là je peux me connecter depuis une de mes VM (en la mettant sur le même LAN Segement) sur l'interface graphique pour finir la configuration.

## 2. Installation de Windows Server 2022

Rien de compliqué, juste mettre sur le même LAN Segment donné par pfSense.

![Serv2022](/images/2025-11-19-18-52-10.png)
