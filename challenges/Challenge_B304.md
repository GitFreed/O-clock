# Atelier B304 22/01/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2026-01-22-10-12-04.png)

> - Atelier <https://pmaldi.notion.site/Atelier-Nagios-1977f06da9c780638d9aec9bf4bee68d>

[Cours B304.](/RESUME.md#-b304-nagios)

> 📚 **Ressources** :
>
> - Documentation Nagios <https://www.nagios.org/projects/nagios-core/>

---

## Installation de Nagios Core

Au niveau des requirements, on a pas besoin d'une grosse machine, on va monter ça dans un container LXC Ubuntu 24.04 LTS en IP statique

![req](/images/2026-01-22-10-15-55.png)

On peut voir la documentation officielle pour l'installation sur Ubuntu ici : <https://support.nagios.com/kb/article/nagios-core-installing-nagios-core-from-source-96.html#Ubuntu>

Nagios Core nécessite plusieurs dépendances, y compris Apache, PHP, et des outils de compilation. Pour les installer on utilise la commande suivante :

```bash
apt update
apt upgrade -y
apt install -y build-essential libgd-dev openssl libssl-dev unzip apache2 php libapache2-mod-php libperl-dev libpng-dev
```

Pour continuer notre installation, nous allons maintenant télécharger l'archive source de Nagios Core depuis le site officiel :

![core](/images/2026-01-22-11-22-45.png)

```bash
cd /tmp
wget https://go.nagios.org/get-core/4-5-11
```

Une fois l'archive téléchargée, on la décompresse et on entre dans le dossier extrait :

```bash
tar -xvzf 4-5-11
ls
cd nagios-4.5.11

```

On va créer un utilisateur nagios et l'ajouter au groupe nagcmd. On va créer les utilisateurs et groupes nécessaires pour que Nagios fonctionne correctement avec les bonnes permissions.

```bash
useradd nagios
groupadd nagcmd
usermod -G nagcmd nagios
usermod -G nagcmd www-data
```

Maintenant on va compiler et installer Nagios Core

Configure

```bash
./configure --with-httpd-conf=/etc/apache2/sites-available --with-command-group=nagcmd
```

![config](/images/2026-01-22-11-26-56.png)

et Make `make all`, on peut voir la liste des commandes pour continuer l'installation. Enjoy !

![make](/images/2026-01-22-11-28-13.png)

On va continuer et installer Nagios et ses fichiers de configuration, en commençant par les groupes et users pour la gestion des droits (actualisation)

```bash
make install-groups-users

make install
make install-init
make install-daemoninit

make install-config
make install-commandmode
```

Maintenant on va installer l'interface web puis activer le module Apache nécessaire

```bash
make install-webconf

a2enmod cgi
a2ensite nagios
systemctl restart apache2
```

![apache](/images/2026-01-22-11-33-27.png)

Pour accéder à l'interface web, on doit créer un utilisateur `nagiosadmin` et un mot de passe

```bash
htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
```

Il nous reste plus qu'a démarrer le Nachos !

```bash
systemctl start nagios
systemctl enable nagios
systemctl status nagios
```

![status](/images/2026-01-22-11-48-23.png)

Pour s'y connecter via le navigateur web : <http://10.0.0.90/nagios> , on entre l'user `nagiosadmin` et son mdp

![nagios](/images/2026-01-22-11-49-03.png)

L'installation n'est aps terminée on peut voir des erreurs de services

![services](/images/2026-01-22-11-51-33.png)

On installe les prérequis (certains sont déjà installés, c’est pas grave) :

```bash
apt install -y autoconf gcc libc6 libmcrypt-dev make libssl-dev wget bc gawk dc build-essential snmp libnet-snmp-perl gettext
```

Pour les installer, on télécharge la dernière version des plugins Nagios, on les dezip, on va dans le dossier, on configure, on make et on lance l’installation :

```bash
cd /tmp
wget -O nagios-plugins.tar.gz $(wget -q -O - https://api.github.com/repos/nagios-plugins/nagios-plugins/releases/latest  | grep '"browser_download_url":' | grep -o 'https://[^"]*')
tar zxf nagios-plugins.tar.gz
cd /tmp/nagios-plugins-*/
./configure
make
make install
```

Une fois l'installation terminée, on peut vérifier si les plugins sont correctement installés :

```bash
ls -l /usr/local/nagios/libexec/
```

![list](/images/2026-01-22-11-56-55.png)

Si on a un pare-feu actif sur notre serveur, on peut autoriser l'accès à Apache avec la commande suivante :

```bash
ufw allow 'Apache Full'
```

De retour sur l'interface on peut voir que tout répond

![ok](/images/2026-01-22-12-00-49.png)

![ok](/images/2026-01-22-12-01-10.png)

## Installation de l'Agent NCPA Windows sur un hôte Windows

![agent](/images/2026-01-22-12-03-53.png)

Il expose une API RESTful pour l'interrogation des données, et son installation est plus simple et plus flexible que NRPE.

On va télécharger l'agent sur le site officiel <https://www.nagios.org/projects/ncpa/#downloads>

![ncpa](/images/2026-01-22-12-11-42.png)

On ajoute un token (un mot) qui sera utilisé pour les connexions à l'API de NCPA

![token](/images/2026-01-22-12-13-58.png)

Puis on termine l'install sans activer les checks passifs. On peut voir l'agent actif dans le Gestionnaire de Services

![ok](/images/2026-01-22-12-16-25.png)

Pour être sûr de ne pas avoir de problème avec le pare-feu windows on peut ouvrir le port dans Powershell

`New-NetFirewallRule -DisplayName "NCPA" -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 5693`

Et vérifier que le Ping est bien activé dans le pare-feu, sinon l'activer

![parefeu](/images/2026-01-22-12-46-15.png)

On peut se connecter à l'interface web de l'agent via <https://10.0.0.66:5693> avec le token créé pour s'y log

![agent](/images/2026-01-22-12-20-42.png)

On peut voir les Data collectées en Live par l'agent

![data](/images/2026-01-22-12-47-20.png)

## Configuration de l'Agent NCPA sur le serveur Nagios

De retour sur notre serveur en ligne de commande on accéde à la configuration dans `/usr/local/nagios/etc/`

On va créez un fichier de configuration pour notre serveur Windows dans le dossier **servers** (par exemple, `windows_server.cfg`)

```bash
cd /usr/local/nagios/etc/
mkdir servers
nano /usr/local/nagios/etc/servers/windows_server.cfg
```

On ajoute la configuration suivante (check est le plugin pour interroger l'agent,avec le token créé, et 2 services test pour surveiller le cpu et la memory) :

```bash
define host {
    use                     generic-host
    host_name               windows_server
    alias                   Windows Server
    address                 10.0.0.66
    check_command           check-host-alive
    max_check_attempts      5
    check_interval          1
    retry_interval          1
    check_period            24x7
    notification_interval   30
    notification_period     24x7
    contacts                nagiosadmin
}

define service {
    use                     generic-service
    host_name               windows_server
    service_description     CPU Load
    check_command           check_ncpa!-t mytoken -M cpu/percent
    normal_check_interval   5
    retry_check_interval    1
    notification_interval   30
}

define service {
    use                     generic-service
    host_name               windows_server
    service_description     Memory Usage
    check_command           check_ncpa!-t mytoken -M memory/virtual
    normal_check_interval   5
    retry_check_interval    1
    notification_interval   30
}

```

On save, quitte et on relance nagios `systemctl restart nagios`

Pour configurer correctement la surveillance NCPA, on doit ajouter une définition de commande spécifique dans le fichier de configuration du serveur Nagios. C'est à faire une seule fois.

On va modifier `nano /usr/local/nagios/etc/objects/commands.cfg` et ajoutez la configuration suivante qui permettra à Nagios d'interagir avec l'agent NCPA :

```bash
define command {
    command_name    check_ncpa
    command_line    $USER1$/check_ncpa.py -H $HOSTADDRESS$ $ARG1$
```

Une fois fait, on doit mettre à jour la configuration dans le fichier `nano /usr/local/nagios/etc/nagios.cfg`. Il faut décommenter la ligne `#cfg_dir=/usr/local/nagios/etc/servers` pour permettre la découverte des nouveaux serveurs. Sans cette étape, aucune vérification ni remontée d'information ne sera effectuée.

![nano](/images/2026-01-22-12-35-01.png)

Pour tout prendre en compte on restart nagios `systemctl reload nagios`

Et on peut retourner sur notre interface web pour voir si l'hôte est bien remonté !

![OK](/images/2026-01-22-12-58-52.png)

![host](/images/2026-01-22-12-59-19.png)

On peut voir que nos services ont un problème

![fail](/images/2026-01-22-13-08-22.png)

Nagios n'arrive pas à trouver le script check_ncpa.py, on va donc le retélécharger et le rendre executable (droits), et on va aussi installer un paquet de compatibilité python/python3

```bash
cd /usr/local/nagios/libexec
wget https://raw.githubusercontent.com/NagiosEnterprises/ncpa/master/client/check_ncpa.py
chmod +x check_ncpa.py
chown nagios:nagios check_ncpa.py
sudo apt install -y python3 python-is-python3
```

C'est bon

![ok](/images/2026-01-22-13-18-07.png)

On peut voir un Warn Jaune, `load average: 2.76, 3.49, 3.56` correspond à la charge de du système sur 1 minute, 5 minutes et 15 minutes. Une charge de 1.0 signifie qu'un cœur de processeur est utilisé à 100%. On est à 2.76 sur les 4 cœurs du container Proxmox, c'est OK (~70% de charge).

![warn](/images/2026-01-22-13-11-45.png)

## Installation de l'Agent NCPA sur un hôte Ubuntu

Pour Ubuntu on peut directement télécharger l'agent NCPA avec wget, ajouter les packages manquants, on update et on installe

Documentation : <https://repo.nagios.com/?repo=deb-ubuntu>

```bash
cd /tmp
wget https://assets.nagios.com/downloads/ncpa/ncpa-latest.amd64.deb
sudo apt install gnupg gnupg2 gnupg1
wget -qO - https://repo.nagios.com/GPG-KEY-NAGIOS-V3 | apt-key add -
sudo apt update
sudo apt install ./ncpa-latest.amd64.deb
systemctl status ncpa_listener
```

L'agent est maintenant installé, on peut le voir ici

![status](/images/2026-01-22-15-47-14.png)

On va maintenant configurer le NCPA sur l'hôte Ubuntu

il faut définir un  mot de passe sécurisé, on va modifier le fichier de configuration `nano /usr/local/ncpa/etc/ncpa.cfg` et remplacer la ligne : `community_string = mytoken` par notre mot de passe. Il servira pour l'accès à l'API

NCPA écoute par défaut sur le port **5693**. Pour ouvrir le port sur **UFW**, on peut exécuter la commande suivante : `ufw allow 5693/tcp`

On peut maintenant se connecter à l'interface web <https://10.0.0.50:5693> avec notre token

![web](/images/2026-01-22-15-58-39.png)

## Configuration de l'Agent NCPA Ubuntu sur le serveur Nagios

Comme pour l'agent Windows on va créer un fichier de configuration

![conf](/images/2026-01-22-16-05-22.png)

```bash
cd /usr/local/nagios/etc/servers/
ls
nano /usr/local/nagios/etc/servers/ubuntu_server.cfg
```

On va ajouter la configuration suivante

```bash
define host {
    use                     generic-host
    host_name               ubuntu_server
    alias                   Ubuntu Server
    address                 10.0.0.50
    check_command           check-host-alive
    max_check_attempts      5
    check_interval          1
    retry_interval          1
    check_period            24x7
    notification_interval   30
    notification_period     24x7
    contacts                nagiosadmin
}

define service {
    use                     generic-service
    host_name               ubuntu_server
    service_description     CPU Load
    check_command           check_ncpa!-t mytoken -M cpu/percent
    normal_check_interval   5
    retry_check_interval    1
    notification_interval   30
}

define service {
    use                     generic-service
    host_name               ubuntu_server
    service_description     Memory Usage
    check_command           check_ncpa!-t mytoken -M memory/virtual
    normal_check_interval   5
    retry_check_interval    1
    notification_interval   30
}

```

et on reload `systemctl reload nagios` et on va voir sur notre serveur nagios si tout est bon

![Hosts](/images/2026-01-22-16-13-45.png)

![services](/images/2026-01-22-16-17-39.png)

Les nachos sont bien sous surveillance !

![nachos](/images/2026-01-22-16-16-31.png)
