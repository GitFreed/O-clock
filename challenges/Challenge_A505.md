# Atelier A505 16/12/2025

## Pitch de l’exercice 🧑‍🏫

![Atelier](/images/2025-12-16-11-39-02.png)

[Atelier A505](https://github.com/O-clock-Aldebaran/SA5-atelier-LAMP)

---

## L : Installation d'une VM Debian

![deb](/images/2025-12-16-10-18-39.png)

On a pas besoin d'un environnement de bureau : il n'y a pas d'écran connecté à un serveur, on s'y connecte ultérieurement avec le protocole SSH

![ssh](/images/2025-12-16-10-29-46.png)

![debian](/images/2025-12-16-10-33-48.png)

## Création SUDO

On installe et on passe notre utilisateur en sudo

```bash
su -
apt update
apt install sudo
usermod -aG sudo freed
```

## Guest addition

`sudo apt install open-vm-tools`

![vmtools](/images/2025-12-16-10-54-44.png)

## A : Apache

`sudo apt install apache2`

![status](/images/2025-12-16-11-02-27.png)

On met notre VM par pont pour y avoir accès sur notre réseau, `sudo systemctl restart networking` pour renouveler notre IP, et `ip a` pour avoir l'IP du serveur et s'y connecter dessus.

![apache](/images/2025-12-16-10-59-32.png)

## M : MariaDB

On va installer un serveur de bases de données (un SGBDR, pour Système de Gestion de Bases de Données Relationnelles). L'un des plus connus est MySQL, et un fork a vu le jour il y a quelques années : MariaDB.

```bash
sudo apt install mariadb-server
sudo madiadb_secure_installation 
```

![mariadb](/images/2025-12-16-11-11-48.png)

```bash
Switch to unix_socket authentication [Y/n] Y
Change the root password? [Y/n] Y
New password:
Re-enter new password:
Password updated successfully!
Remove anonymous users? [Y/n] Y
Disallow root login remotely? [Y/n] Y
Remove test database and access to it? [Y/n] Y
Reload privilege tables now? [Y/n] Y
```

![mariadb](/images/2025-12-16-11-16-42.png)

On se connecte au shell mySQL avec `mysql -u root -p`

On va créer un utilisateur avec les instructions SQL suivantes

```bash
CREATE USER 'dbuser'@'localhost' IDENTIFIED BY 'rocknroll';
GRANT ALL PRIVILEGES ON *.* TO 'dbuser'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
exit
```

## P : PHP

La plupart des applications web sont développées avec le langage PHP : c'est le cas de GLPI, il faut donc qu'on installe l'interpréteur PHP

`sudo apt install php libapache2-mod-php`

On va également installer plusieurs modules de PHP, souvent utiles (certains sont indispensables, comme le module php-mysql)

`sudo apt install php-{curl,gd,intl,memcache,xml,zip,mbstring,json,mysql,bz2,ldap}`
Redémarrage du service Apache avec la commande `sudo systemctl restart apache2`

Création d'un fichier PHP basique pour vérifier sur <http://192.168.1.86/info.php>

![php](/images/2025-12-16-11-44-32.png)

## Connexion SSH

![ssh](/images/2025-12-16-11-21-18.png)

## GLPI

On va télécharger et décompresser GLPI avec

```bash
cd ~
wget https://github.com/glpi-project/glpi/releases/download/10.0.17/glpi-10.0.17.tgz
sudo tar -xvf glpi-10.0.17.tgz -C /var/www/html
```

En allant sur <http://192.168.1.86/glpi/> on a une erreur qui indique que GLPI nécessite php 7.4.0 à 8.4.0 hors Debian 13 a la version php 8.4.10

On va devoir réinstaller une version antérieure de php

```bash
sudo apt install curl
sudo curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list
sudo apt update
sudo apt install php8.2 php8.2-mysql php8.2-xml php8.2-curl php8.2-gd php8.2-intl php8.2-mbstring php8.2-zip php8.2-bz2 php8.2-ldap -y
sudo a2dismod php8.4
sudo a2enmod php8.2
sudo systemctl restart apache2
```

C'est OK, maintenant on passe à l'installation de GLPI

On doit modifier les droits d'accès au fichier html avec un chmod 770

![chmod](/images/2025-12-16-12-41-40.png)

On va ignorer les erreurs de sécurisé qu'on corrigera ultérieurement, et on va se connecter à l'utilisateur dbuser qu'on avait créé puis créer une nouvelle db

![glpi](/images/2025-12-16-12-43-50.png)

On a finit l'installation, et on peu se connecter avec glpi/glpi, et nous voilà sur notre tableau de bord !

![glpi](/images/2025-12-16-12-50-23.png)

## Bonus : PHPMyAdmin & Adminer

Pour administrer un serveur de base de données relationnelles tel que MySQL ou MariaDB, on utilise en général une interface web. Il existe deux solutions populaires : PHPMyAdmin et Adminer

`sudo apt install phpmyadmin`

On sélectionne `apache2` en appuyant sur la touche `Espace` de votre clavier AVANT d'appuyer sur `Entrée` pour valider. Sinon la commande `sudo dpkg-reconfigure phpmyadmin` permet de reconfigurer (dpkg : debian package)

On s'y connecte avec notre dbuser

![myadmin](/images/2025-12-16-13-11-43.png)

On va aussi tester Adminer

```bash
cd /var/www/html
mkdir adminer
cd adminer
wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php
mv adminer-4.8.1-mysql.php index.php
```

On a une interface très légère voir minimaliste

![adminer](/images/2025-12-16-13-16-08.png)

![ranger](/images/2025-12-16-13-14-45.png)

## Super-bonus : sécurité

On va résoudre les problèmes de sécurité indiqués lors de l'installation.

Documentation officielle sur la [configuration du serveur Apache]<https://glpi-install.readthedocs.io/en/latest/prerequisites.html#apache-configuration>, et les [Virtual Hosts Apache]<https://www.linuxtricks.fr/wiki/apache-les-virtual-hosts>.

On va retrouver nos erreurs dans : Configuration > Générale

![errors](/images/2025-12-16-16-27-24.png)

### Erreur 1 : le site GLPI doit pointer sur /public et non /glpi

`Web server root directory configuration is not safe as it permits access to non-public files. See installation documentation for more details.`

![config](/images/2025-12-16-16-41-14.png)

On va créer un fichier de configuration avec `sudo nano /etc/apache2/sites-available/glpi.conf`

![conf](/images/2025-12-16-17-15-23.png)

On va désactiver l'ancienne conf et mettre la nouvelle

```bash
sudo a2ensite glpi.conf
sudo a2dissite 000-default.conf
sudo a2enmod rewrite
sudo systemctl restart apache2
```

### Erreur 2 : les cookies 🍪

`PHP directive "session.cookie_httponly" should be set to "on" to prevent client-side script to access cookie values.`

On doit sécuriser l'accès aux Cookies pour empêcher des scripts d'y accéder

On va ouvrir notre config php avec `sudo nano /etc/php/8.2/apache2/php.ini`

On cherche la ligne en question avec Crtl + W et on l'active avec `on`

![cookie](/images/2025-12-16-17-19-38.png)

On sauvegarde et redémarre apache

### Problème de Timezone

Mariadb n'a pas accès aux informations de TZ nativement <https://glpi-install.readthedocs.io/en/latest/timezones.html>

On va lui injecter ces informations :

```bash
 mariadb-tzinfo-to-sql /usr/share/zoneinfo > /tmp/zones.sql
 sudo mariadb -u root -p mysql
 ```

Il faut maintenant donner le droit de lecture à notre utilisateur

`sudo mariadb -u root -p`

```bash
USE mysql;
GRANT SELECT ON time_zone_name TO 'dbuser'@'localhost';
FLUSH PRIVILEGES;
exit
```

### Effacer le fichier d'installation

`sudo rm /var/www/glpi/install/install.php`

![erreursOK](/images/2025-12-16-17-35-52.png)

### Hyper-bonus : configuration de GLPI

Prérequis : avec une VM Windows avec l'agent GLPI Windows et qui est sur le même réseau que notre serveur.

Depuis ma VM Windows 10 je ping mon serveur et je vais télécharger mon agent GLPI (.msi) sur <https://github.com/glpi-project/glpi-agent/releases/tag/1.15>

![VM](/images/2025-12-16-17-46-51.png)

On target notre serveur GLPI

![target](/images/2025-12-16-17-51-04.png)

On va activer l'inventaire dans notre serveur GLPI > Administration > Inventaire > Activer.

On va forcer l'inventaire en ouvrant `http://localhost:62354` dans notre navigateur sur la VM Windows

![inventory](/images/2025-12-16-17-52-37.png)

Et voilà !

![tableau](/images/2025-12-16-18-00-21.png)

![ordi](/images/2025-12-16-18-00-55.png)
