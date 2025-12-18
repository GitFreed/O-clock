# Challenge A507 18/12/2025

## Pitch de l’exercice 🧑‍🏫

⌨️ Installer et configurer une machine Arch

Installation Guide <https://wiki.archlinux.org/title/Installation_guide>

[Cours A507.](/RESUME.md#-a507-arch-linux)

---

## Vérification du hash

Dans notre shell proxmox `sha256sum`

![proxmox](/images/2025-12-18-14-56-13.png)

On compare avec <https://archlinux.org/iso/2025.12.01/sha256sums.txt>

## Préparation de la VM

On va télécharger l'image ici <https://archlinux.org/download/#http-downloads>

On va mettre 32Go de DD, ça suffira largement pour notre utilisation, et 4Go de RAM

## Lancement

![arch](/images/2025-12-18-14-31-27.png)

Le clavier est en qwerty on va devoir le changer <https://wiki.maxcorp.org/basculer-un-clavier-en-azerty-ou-en-qwerty-sous-linux/>

`loadkeys fr`

## Vérifications

On vérifie si on est en BIOS ou UEFI avec la présence ou absence du dossier /efi/

![efi](/images/2025-12-18-15-06-19.png)

On ping pour voir si le net est OK

![ping](/images/2025-12-18-15-05-11.png)

On vérifie l'horloge `timedatectl`

![time](/images/2025-12-18-15-54-25.png)

## Partitions

`cfdisk` > dos en BIOS

![disk](/images/2025-12-18-15-09-30.png)

On va devoir créer les 2 partitions :

SWAP : 2G, Primary, Type 82 Linux swap / Solaris

ROOT : le reste, Primary, Type laisser 83 Linux >> Bootable *

![disk](/images/2025-12-18-15-15-13.png)

Write : yes. Quit.

## Formatage

La Swap

```bash
mkswap /dev/sda1
swapon /dev/sda1
```

La Racine (en ext4, le standard Linux) ```mkfs.ext4 /dev/sda2```

On monte la partition pour le système  ```mount /dev/sda2 /mnt```

![mount](/images/2025-12-18-15-21-08.png)

On vérifie avec `lsblk`

![lsblk](/images/2025-12-18-15-24-26.png)

## Installation des packets essentiels

On va installer la base : structure minimale, linux : le kernel, linux-firmware : les pilotes, nano : l'éditeur de txt, networkmanager pour garder internet après le reboot

`pacstrap /mnt base linux linux-firmware nano networkmanager`

## Fstab

On va créer un fichier de configuration avec nos partitions

`genfstab -U /mnt >> /mnt/etc/fstab`

![fstab](/images/2025-12-18-15-55-49.png)

## Chroot

On va passer en root sur le système

![chroot](/images/2025-12-18-15-56-51.png)

## Fuseau horaire

On va se mettre sur notre fuseau horaire en créant un lien symbolique

`ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime` et on synchronise l'horloge matérielle `hwclock --systohc`

## Localisation

On va config la langue et le clavier pour qu'il reste après reboot

`nano /etc/locale.gen`

on enlève le # devant fr_FR

![fr](/images/2025-12-18-16-03-42.png)

On génère les locales `locale-gen` et on définit la langue puis le clavier

![locale](/images/2025-12-18-16-05-35.png)

## Réseau

On nomme `echo "archlinux" > /etc/hostname`

On active le gestionnaire réseau `systemctl enable NetworkManager`

![net](/images/2025-12-18-16-08-39.png)

## Mot de passe Root

`passw`

## Installation du bootloader GRUB

`pacman -S grub`

![grub](/images/2025-12-18-16-16-37.png)

On installe l'amorce sur le disque dur `grub-install --target=i386-pc /dev/sda`

On génère le fichier de configuration `grub-mkconfig -o /boot/grub/grub.cfg`

![grub](/images/2025-12-18-16-21-26.png)

On sort du chmod et on démonte les partitions `umount -R /mnt` qui peuvent corrompre un système.

On lance le reboot (en sortant le disque d'installation)

Et voilà une install "The Arch Way"

![arh](/images/2025-12-18-16-31-36.png)

## Qemu guest agent

On va installer l'agent invité pour notre VM Proxmox

```bash
pacman -Sy
pacman -S qemu-guest-agent
systemctl enable --now qemu-guest-agent
```

![qemu](/images/2025-12-18-16-55-27.png)

## SSH

On va installer SSH

```bash
pacman -S openssh
systemctl enable --now sshd
```

On ajoute un utilisateur au groupe wheel et config son password

```bash
useradd -m -G wheel freed
passwd freed
```

et `Sudo pacman -S sudo`

On configure ses droits `EDITOR=nano visudo`

![visudo](/images/2025-12-18-17-24-27.png)

Et depuis powershell je suis bien connecté!

![ssh](/images/2025-12-18-17-29-33.png)

## Environnement

On va installer un environnement préconfiguré (ML4W) maintenant pour ne pas passer 3h à installer manuellement tout.

My Linux for Work <https://www.ml4w.com/>

On installe git `sudo pacman -Syu git base-devel`

On clone et installe le script ML4W

```bash
git clone --depth 1 https://github.com/mylinuxforwork/dotfiles.git
cd dotfiles
./install.sh
```

![setup](/images/2025-12-18-17-47-20.png)

Le script va télécharger et compiler les packets puis les installer automatiquement.

On reboot et on va activer l'interface graphique : `sudo systemctl enable --now sddm`

On est bien sur le bureau, je vais continuer l’installation du script

```bash
cd ~/dotfiles/setup
./setup.sh
```

![desk](/images/2025-12-18-18-22-49.png)

Après un reboot voilà le résultat !

![graphic](/images/2025-12-18-18-46-29.png)

Sur Kitty (terminal), fastfetch donne le Logo arch avec les infos machine. Avec un | lolcat tout passe rainbow (aïe)

![test](/images/2025-12-18-19-38-26.png)
