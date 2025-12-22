# Challenge A509 22/12/2025

## Pitch de l’exercice 🧑‍🏫

> ⌨️ On va installer la dernière version disponible d'Asterisk, en le compilant depuis le code source, sur une VM Debian 13.

Atelier Asterisk : <https://github.com/O-clock-Aldebaran/SA5-atelier-Asterisk>

[Cours A508.](/RESUME.md#-a508)

---

## 1. Install VM Debian 13

![debian13](/images/2025-12-22-10-09-44.png)

## 2. Préparation du serveur : sudo, IP statique & SSH

On va se connecter en SSH, installer sudo, ajouter notre utilisateur au groupe sudo, mettre à jours les paquets, installer qemu agent et resolvconf pour pas avoir de problème de dns en ip fixe

```bash
su -
apt update
apt upgrade
apt install sudo
usermod -aG sudo freed
exit
sudo apt install qemu-guest-agent
```

On va passer notre serveur en IP fixe en modifiant le fichier network/interfaces

`sudo nano /etc/network/interfaces/`

```bash
allow-hotplug ens18
iface ens18 inet static
  address 10.0.0.61
  netmask 255.255.0.0
  network 10.0.0.0
  gateway 10.0.0.1
  dns-nameservers 10.0.0.1 8.8.8.8
```

`sudo nano /etc/resolv.conf/`

`nameserver 10.0.0.1`

![OK](/images/2025-12-22-11-11-42.png)

## 3. Installation d'Asterisk

On ne peut malheureusement pas installer Asterisk depuis les dépôts Debian car il n'est pas disponible sur notre version (Debian 13, Trixie). On va donc le compiler depuis le code source (ce qui nous permettra aussi d'avoir la toute dernière version disponible, 22.7).

On intalle git et on télécharge dans le dossier usr/src le code source, et les 2 dépendances qu'on va devoir compiler au préalable : dahdi et libpri

```bash
sudo apt update
sudo apt install -y git
cd /usr/src
sudo git clone https://github.com/asterisk/asterisk.git
sudo git clone https://github.com/asterisk/dahdi-linux-complete.git
sudo git clone https://github.com/asterisk/dahdi-linux.git linux
sudo git clone https://github.com/asterisk/dahdi-tools.git tools
sudo git clone https://github.com/asterisk/libpri.git
```

On doit installer un compilateur pour la suite

```bash
sudo apt update
sudo apt install build-essential linux-headers-$(uname -r)
```

Maintenant on va installer dahdi

```bash
cd /usr/src/dahdi-linux-complete
sudo make all
sudo make install
sudo make config
```