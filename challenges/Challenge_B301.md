# Challenge B301 19/01/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2026-01-19-15-01-11.png)

Challenge : <https://github.com/O-clock-Aldebaran/SB03E01-Mise-en-place-supervision>

[Cours B301.](/RESUME.md#-b301-introduction--monitoring--supervision)

---

## 1. Configuration SNMP dans Cisco Packet Tracer

Sur Packet tracer je crée un réseau PC + Switch

![PT](/images/2026-01-19-22-42-51.png)

Configuration du routeur et de l'interface pour que le PC puisse l'interroger en SNMP, activation du protocole SNMP v2c et passage en Read Only (par sécurité) avec la commande `snmp-server community techsecure_ro RO` qui indique la clé de sécurité

![config](/images/2026-01-19-22-39-07.png)

Depuis le PC on va interroger le routeur avec un outil de supervision le MIB Browser. On entre l'adresse IP, la clé de sécurité et la version, puis on va chercher dans le menu déroulant la commande (OID) correspondante au nom du système et on envois la demande avec GET.

![OID](/images/2026-01-19-22-48-42.png)

La Value correspond bien au nom donné.

En analysant les packets on peut voir le fonctionnement en détail de la requête

![simulation](/images/2026-01-19-22-56-58.png)

avec la clé visible dans le packet SNMP

![SNMP](/images/2026-01-19-22-57-52.png)

---

## 2. Interrogation SNMP

Activation du service SNMP dans la Pfsense

![Pfsense](/images/2026-01-19-23-11-34.png)

Sur la VM Linux que je viens de créer (Container LXC Debian 13), j'update les packets puis j'installe le client SNMP avec `apt install snmp`

Pour interroger la Pfsense je peux utiliser différents OID

`.1.3.6.1.2.1.1` permet d'avoir les informations générales du système

![SNMP](/images/2026-01-20-00-07-46.png)

Si on veut récupérer des informations spécifiques on peut utiliser l'outil MIB de Packet Tracer ou alors utiliser des sites qui les liste comme <https://www.alvestrand.no/objectid/top.html>

```bash
1.3.6.1.2.1.1.5 - sysName
1.3.6.1.2.1.1.1 - sysDescr
1.3.6.1.2.1.2.2.1.2 - ifDescr
```

pour avoir le nom de l'hôte, son OS et la liste des interfaces réseau

![SNMP](/images/2026-01-20-00-23-39.png)

---

## 3. Prérequis Zabbix Server

Prérequis : mettre à jour les paquets puis installer GnuPG2 (ou GPG), un outil de chiffrement et de signature numérique avec `apt install wget curl gnupg2 -y`

![gnupg](/images/2026-01-20-00-41-16.png)

Vérification de la RAM : `free -h` il nous faut au moins 2Go

![ram](/images/2026-01-20-00-42-45.png)

---

## 4. Installation de Zabbix Server

Téléchargement et documentation pour Debian 13 <https://www.zabbix.com/download?zabbix=8.0&os_distribution=debian&os_version=13&components=server_frontend_agent&db=mysql&ws=apache>

![DL](/images/2026-01-19-23-08-57.png)

### Ajout du Repo & Zabbix

Installation du repo et de Zabbix server, frontend & agent

![repo](/images/2026-01-20-00-44-55.png)

![zabbix](/images/2026-01-20-00-46-45.png)

> - zabbix-server-mysql : Le programme principal qui va interroger pfSense.
> - zabbix-frontend-php : L'interface web dans le navigateur.
> - zabbix-sql-scripts : Fichiers nécessaires pour créer les tables dans la future base de données.
> - zabbix-agent : Permet au serveur Zabbix de se surveiller lui-même.

### Création de la Database

![database](/images/2026-01-20-01-06-04.png)

Maintenant on va installer la database (MariaDB) pour stocker nos données de supervision

`apt install mariadb-server -y`

![mariadb](/images/2026-01-20-00-55-48.png)

`mariadb-secure-installation` pour terminer l'installation, ajouter un mdp root, nettoyer

![mariadb](/images/2026-01-20-00-57-28.png)

On peut se connecter à MariaDB avec `mariadb -u root -p`

![mariadb](/images/2026-01-20-00-59-45.png)

On va exécuter les commandes SQL suivantes

```bash
CREATE DATABASE zabbix CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
CREATE USER 'zabbix'@'localhost' IDENTIFIED BY 'Rocknroll';
GRANT ALL PRIVILEGES ON zabbix.* TO 'zabbix'@'localhost';
SET GLOBAL log_bin_trust_function_creators = 1;
QUIT;
```

On peut maintenant importer le schéma de la database avec `zcat /usr/share/zabbix/sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -uzabbix -p zabbix`

il faut se reconnecter à MariaDB pour désactiver une option de sécurité que Zabbix n'utilise que pour l'import :

`mariadb -u root -p`

```bash
SET GLOBAL log_bin_trust_function_creators = 0; 
QUIT;
```

### Configuration de Zabbix

Dans `nano /etc/zabbix/zabbix_server.conf` on ajoute notre MDP

![nano](/images/2026-01-20-01-12-59.png)

Et on démarre les services Zabbix `systemctl restart zabbix-server zabbix-agent apache2` & `systemctl enable zabbix-server zabbix-agent apache2` puis `systemctl status zabbix-server` pour voir le status

![enable](/images/2026-01-20-01-15-52.png)

## 5. Configuration du Frontend Zabbix

Il suffit d'aller sur <http://10.0.0.90/zabbix/> pour accéder a notre interface !

![zabbix](/images/2026-01-20-01-18-41.png)

En poursuivant les prérequis il y a une erreur qui indique que la locale en_US.UTF-8 n'est pas activé dans le système.

![fail](/images/2026-01-20-01-24-10.png)

On retourne sur le terminal et avec `dpkg-reconfigure locales` on va cocher en_US.UTF-8 (et fr_FR.UTF-8 UTF-8 en option si on veut du FR plus tard)

![locale](/images/2026-01-20-01-26-33.png)

On termine et redémarre apache

![done](/images/2026-01-20-01-27-41.png)

and voila !

![fr](/images/2026-01-20-01-28-38.png)

On entre le MDP qu'on avait ajouté dans `zabbix_server.conf`

![mdp](/images/2026-01-20-01-31-22.png)

Une fois terminé on peut se connecter en Admin, et on va aller changer le MDP d'origine

![Admin](/images/2026-01-20-01-33-42.png)

Et nous voilà sur notre monitor !

![finit](/images/2026-01-20-01-35-08.png)

Notre serveur est bien activé

![Actif](/images/2026-01-20-01-37-44.png)

On peut analyser les Dernières données, et voir les infos CPU/memory/disque dur par exemple

![datas](/images/2026-01-20-01-44-12.png)

## 6. Synthèse et réflexion

> Question 1 : Supervision vs Monitoring : Expliquez avec vos propres mots la différence entre supervision et monitoring. Donnez un exemple concret pour illustrer.

Le Monitoring c'est la collecte de données techniques en temps réel. La Supervision c'est l'analyse de ces données pour avoir des statistiques et alerter en cas de problème.
Exemple : Monitoring du CPU renvois 90% d'utilisation, Supervision du CPU nous alerte que le CPU est surchargé !

> Question 2 : Méthodes de surveillance : L'agent Zabbix installé sur le serveur utilise-t-il une méthode de supervision active ou passive ? Quel est l'avantage de cette approche ?

L'agent installé utilise une méthode passive (polling). L'avantage est la simplicité de configuration et la consommation moindre !

> Question 3 : Mise en production : Citez 2 actions indispensables pour rendre cette infrastructure de supervision vraiment utile en production.

On devrait configuration les alertes et notifications pour être informé en temps réel des pannes. Et passer en SNMP v3 pour protéger l'accès aux informations sur le réseau.

## Bonus

Pour voir le Graphique d'une métrique, on va dans Latest Data, et on peut clicker tout à droite de chaque data pour afficher son historique/graphique

![latest data](/images/2026-01-20-02-03-04.png)

![graph](/images/2026-01-20-02-02-29.png)

> Qu'est-ce qu'un "template" Zabbix ?

C'est un modèle, un ensemble de configurations pré-définies (items, triggers, graphiques) que l'on applique à un hôte.

![template](/images/2026-01-20-02-05-52.png)
