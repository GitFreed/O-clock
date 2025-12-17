# Atelier A506 17/12/2025

## Pitch de l’exercice 🧑‍🏫

![Atelier](/images/2025-12-17-12-03-47.png)

[Atelier A506](https://github.com/O-clock-Aldebaran/SA5-atelier-SAMBA)

---

## Création d'une VM Debian

On va refaire tout comme lors de notre Atelier LAMP :

Installation sans l'environnement de bureau, avec SSH. On va la nommer debianSRVn et OCLOCK.LAN comme nom de domaine. On va ajouter SUDO et notre utilisateur dedans, puis les Guest Addition.

## Configuration réseau

On va donner une ip fixe à notre serveur en modifiant le fichier /etc/network/interfaces avec `sudo nano /etc/network/interfaces` et en vérifiant notre interface réseau avec avec `ip a`

![ip](/images/2025-12-17-16-21-02.png)

On modifie également /etc/hosts avec cette nouvelle ip

![host](/images/2025-12-17-16-21-23.png)

Pareil pour /etc/hostname/

![hostname](/images/2025-12-17-16-10-46.png)

## SAMBA installation

Avant d’installer Samba, on doit installer plusieurs dépendances :

`sudo apt install build-essential libacl1-dev libattr1-dev libblkid-dev libgnutls28-dev libreadline-dev gdb pkg-config libpopt-dev libldap2-dev dnsutils libbsd-dev attr acl krb5-user docbook-xsl libcups2-dev libpam0g-dev ntpsec ntpsec-ntpdate`

Lors de l'installation Kerberos nous demande le Royaume (Realm), c'est notre domaine OCLOCK.LAN et le serveur hostname : debianSRV

![kerberos](/images/2025-12-17-19-27-49.png)

On installe a nouveau les dépendances suivantes `sudo apt install python3-dev liblmdb-dev flex bison libgpgme11-dev libparse-yapp-perl libjansson-dev libarchive-dev libdbus-1-dev python3-pyasn1 python3-markdown python3-dnspython libjson-perl python3-iso8601`

On va télécharger et compiler la dernière version de Samba

```bash
wget http://ftp.samba.org/pub/samba/samba-latest.tar.gz
tar zxvf samba-latest.tar.gz
cd samba-4.23.4
./configure --enable-debug --enable-selftest
```

![success](/images/2025-12-17-16-38-22.png)

Maintenant on peut lancer l'installation avec `make` puis `sudo make install`

![install](/images/2025-12-17-17-00-42.png)

## Contrôleur de domaine

On va lancer l'équivalent de la commande dcpromo sur Active Directory (qui permet de configurer le serveur comme contrôleur de domaine) :

`sudo /usr/local/samba/bin/samba-tool domain provision`

![domain](/images/2025-12-17-17-04-02.png)

![OK](/images/2025-12-17-17-05-09.png)

On reboot le serveur

## Démarrage Samba

On démarre Samba, on vérifie les versions serveur et client, et la présence  des partages de base netlogon et sysvol.

![samba](/images/2025-12-17-19-34-14.png)

On se connecte avec `/usr/local/samba/bin/smbclient //localhost/netlogon -UAdministrator`

![smb](/images/2025-12-17-19-39-26.png)

## Configuration

Les serveurs DNS utilisés par un système GNU/Linux sont en général renseignés dans le fichier /etc/resolv.conf

`sudo nano /etc/resolv.conf`

On ajoute les lignes suivantes

```bash
search OCLOCK.LAN
domain OCLOCK.LAN
```

On vérifie la config de smb.conf `sudo nano /usr/local/samba/etc/smb.conf`

On va modifier krb5.conf `sudo nano /usr/local/samba/share/setup/krb5.conf`

![krb5](/images/2025-12-17-19-46-36.png)

On fait un lien symbolique depuis cette config vers /etc

`sudo ln -sf /usr/local/samba/share/setup/krb5.conf /etc/krb5.conf`

et on reboot

## Kerberos

On relance le processus Samba : `sudo /usr/local/samba/sbin/samba`

et on test la connexion avec :  `kinit administrator@OCLOCK.LAN`

On a un avertissement sur la date d'expiration du mot de passe de l'admin. Pour désactiver cette expiration : `sudo /usr/local/samba/bin/samba-tool user setexpiry administrator --noexpiry`

On peut utiliser la commande `klist -e` pour avoir des infos sur les algo de chiffrement & hachage utilisés.

![kerb](/images/2025-12-17-20-24-56.png)

## Config NTP

Afin d'éviter les bugs, le service NTP (Network Time Protocol) doit être configuré : `sudo nano /etc/ntpsec/ntp.conf`

![ntp](/images/2025-12-17-20-36-42.png)

On redémarre le daemon : `sudo systemctl restart ntp`

## Zone inversée DNS

Création d'une zone inversée : `sudo /usr/local/samba/bin/samba-tool dns zonecreate debianSRV 0.0.10.in-addr.arpa --username=administrator`

![arpa](/images/2025-12-17-20-39-20.png)

## Clients Windows

Sur notre VM Windows 10 pro, on va mettre notre serveur Debian en Serveur DNS `ncpa.cpl` et on rajoute le bon domaine.

![win](/images/2025-12-17-20-53-46.png)

![domaine](/images/2025-12-17-21-34-44.png)

Redémarrer et se connecter avec le compte Administrator du domaine

## Outils RSAT

Téléchargement <https://www.microsoft.com/fr-fr/download/details.aspx?id=45520>

![install](/images/2025-12-17-21-08-41.png)

On va aller activer les outils AD-DS et Gestion stratégie de Groupe dans Paramètres : Fonctionnalités facultatives : Ajouter

![rsat](/images/2025-12-17-21-10-35.png)

On va dans la console MMC (Exécuter → mmc) et Fichier > Ajouter des composants logiciels enfichables.

![mmc](/images/2025-12-17-21-39-10.png)

Ajout d'un utilisateur au domaine

![bob](/images/2025-12-17-21-46-39.png)

## Partage Samba

 On doit modifier le fichier de configuration avec la commande `sudo nano /usr/local/samba/etc/smb.conf` en ajoutant une conf

 ![conf](/images/2025-12-17-23-25-14.png)

 On doit ensuite stopper samba et le relancer, avec la commande `ps aux | grep samba` on trouve le PID du processus samba

```bash
sudo kill -9 1425
sudo /usr/local/samba/sbin/samba
```

On va créer le dossier et changer ses permissions (777 ok car partage public)

```bash
sudo mkdir -p /home/shares/public
sudo chmod 777 /home/shares/public
```

Depuis la machine windows sur le domaine on peut y accéder

![dossier](/images/2025-12-17-23-34-03.png)

## GPO

<https://activedirectorypro.com/map-network-drives-with-group-policy/>

On va créer une nouvelle UO "Promo"

![uo](/images/2025-12-17-23-40-11.png)

On va maintenant créer notre GPO sur notre UO

![gpo](/images/2025-12-17-23-43-53.png)

On va ensuite éditer notre GPO pour cibler le dossier public qu'on a créé

![gpo](/images/2025-12-17-23-48-14.png)

Et cibler l'UO Promo de notre utilisateur

![gpo](/images/2025-12-18-00-39-47.png)

On va aussi créer une GPO fond d'écran pour le bureau

![fond](/images/2025-12-18-00-10-04.png)

On va se connecter avec notre utilisateur pour voir si le lecteur et le fond d'écran apparaissent bien

![OK](/images/2025-12-18-00-40-13.png)

## systemd

On va faire en sorte que Samba se lance automatiquement au démarrage serveur ou si crash.

On va couper samba pour créer un nouveau fichier de service `sudo kill -9 2275` (samba PID 2275)

On crée le fichier de service `sudo nano /etc/systemd/system/samba-ad-dc.service`

On ajoute la config trouvée dans la doc <https://wiki.samba.org/index.php/Managing_the_Samba_AD_DC_Service_Using_Systemd>

```bash
[Unit]
Description=Samba Active Directory Domain Controller
After=network.target remote-fs.target nss-lookup.target

[Service]
Type=forking
ExecStart=/usr/local/samba/sbin/samba -D
PIDFile=/usr/local/samba/var/run/samba.pid
ExecReload=/bin/kill -HUP $MAINPID

[Install]
WantedBy=multi-user.target
```

Puis on active et redémarre samba

```bash
sudo systemctl daemon-reload
sudo systemctl enable samba-ad-dc
sudo systemctl start samba-ad-dc
```

![symlink](/images/2025-12-18-00-47-07.png)

On check avec `sudo systemctl status samba-ad-dc`

![status ](/images/2025-12-18-00-48-38.png)
