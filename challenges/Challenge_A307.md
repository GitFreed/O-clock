# Challenge A307 13/11/2025

## Pitch de l’exercice 🧑‍🏫

![Challenge A307](/images/2025-11-13-15-40-31.png)

---

## 1. Self hosting 🖥️

Redirection de port dans la Box.

![Port](/images/2025-11-13-15-55-27.png)

Installation de [Caddy](https://github.com/caddyserver/caddy/releases), la dernière release Windows adm64.zip, extraire dans le dossier C:/caddy, puis création d'un fichier .json de config dans ce même dossier et un dossier /www dans lequel on mettra les fichiers du site.

![json](/images/2025-11-13-16-00-05.png)

Lancement de Caddy via Terminal ``C:\caddy>.\caddy run --config caddy.json``

![Caddy](/images/2025-11-13-15-54-10.png)

Le site est accessible via le web ! (Nostalgie de revoir les vieux sites html que j'avais il y a 20ans).

![Old Site](/images/2025-11-13-15-52-21.png)

---

## 2. NAT et redirection dans PT ⌨️

Je place et configure tout pour l'exercice. Config des IP fixes serveurs, switches, des gateway, des routeurs, des routes etc. Sur le Switch du LAN1 je configure un serveur DHCP pour mon Labtop. Je ping du Labtop aux serveurs : OK 🥳

![DHCP](/images/2025-11-13-20-44-21.png)

![PT](/images/2025-11-13-17-52-17.png)

Configuration du NAT.

![NAT](/images/2025-11-13-20-45-32.png)

![NAT OK](/images/2025-11-13-18-34-58.png)

Configuration des Ports et suppression des routes sur le Routeur internet central.

![config](/images/2025-11-13-20-43-23.png)

J'arrive à me connecter au serveur via <http://84.76.20.1> ou <http://84.76.20.1:80>

![OK 1](/images/2025-11-13-20-25-41.png)

Idem pour le second serveur via <http://84.76.20.1:81>

![OK 2](/images/2025-11-13-20-40-51.png)

[Fichier packet tracer](/challenges/Challenge_A307.pkt)
