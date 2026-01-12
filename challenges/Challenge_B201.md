# Challenge B201 12/01/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2026-01-12-22-27-06.png)

Challenge : <https://github.com/O-clock-Aldebaran/SB02E01-challenge-truenas>

[Cours B201.](/RESUME.md#-b201-introduction-au-stockage)

---

## Installation de TrueNAS sur ProxmoxVE

TrueNAS Community edition est la version communautaire et gratuite de TrueNAS, il existe 2 version, Scale et Core. On va utiliser la Scale qui est basée sur Debian, la version Core étant basée sur FreeBSD et gère seulement un NAS, alors que la Scale permet d'utiliser d'autres fonctionnalités (comme les conteneurs).

Documentation TrueNAS : <https://www.truenas.com/docs/>

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

![interface](/images/2026-01-12-15-23-25.png)

## Configuration Initiale

On va pouvoir passer le clavier en AZERTY et changer la TimeZone dans les settings

![settings](/images/2026-01-12-15-35-28.png)

On va changer le mdp et dans System>Advanced>Access augmenter la session timeout

![timeout](/images/2026-01-12-15-37-15.png)

On va passer en IP statique

![IP](/images/2026-01-12-15-34-48.png)

## Gestion du stockage avec ZFS

On va aller dans Stockage pour créer un volume (pool)

![pool](/images/2026-01-12-22-30-46.png)

Nom : PoolNAS, Chiffrement : Aucun, Données Layout : RAIDZ1 (équivalent RAID5), les 3 disques de 100 Go.

![raidz1](/images/2026-01-12-22-33-18.png)

Lorsqu'on crée le volume il efface les données qui auraient pu y rester

![pooldone](/images/2026-01-12-22-35-11.png)
