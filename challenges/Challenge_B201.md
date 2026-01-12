# Challenge B201 12/01/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/)

[Cours B201.](/RESUME.md#-b201-introduction)

---

## Installer et configurer TrueNAS sur ProxmoxVE

TrueNAS Community edition est la version communautaire et gratuite de TrueNAS, il existe 2 version, Scale et Core. On va utiliser la Scale qui est basée sur Debian, la version Core étant basée sur FreeBSD et gère seulement un NAS, alors que la Scale permet d'utiliser d'autres fonctionnalités (comme les conteneurs).

![DL](/images/2026-01-12-14-16-44.png)

On installe `TrueNAS-SCALE-25.10.1.iso` sur une VM Proxmox, on laisse l'installation de base, linux, i440 et SCSI, par contre au niveau des disques on va en ajouter vu qu'on va faire un NAS. Le disque système reste en SCSI, mais les 3 autres seront en SATA (pour le RAID). 2x2 coeurs, et 8 Go de RAM.

![TrueNAS](/images/2026-01-12-14-40-38.png)

Pour installer notre système on choisi donc le disque SCSI

![disks](/images/2026-01-12-14-47-11.png)

On va utiliser le truenas_admin, on choisira un mot de passe facile de 5 caractères car on ne sait pas si on est en azerty ou qwerty et on changera après. Allow EFI yes.

Finit, on arrive sur le GRUB et on démarre

![grub](/images/2026-01-12-14-52-08.png)

On arrive sur notre TrueNAS, on a son IP pour se log sur l'interface Web

![ok](/images/2026-01-12-14-54-02.png)

Interface Web

![log](/images/2026-01-12-14-58-54.png)

On va pouvoir chanter le mdp et dans System>Advanced>Access augmenter la session timeout, passer le clavier en AZERTY et changer la TimeZone

![interface](/images/2026-01-12-15-23-25.png)
