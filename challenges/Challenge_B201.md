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

On va aller dans Stockage pour créer un volume (Pool : Datastore créé sur un ou plusieurs Vdevs)

![pool](/images/2026-01-12-22-30-46.png)

Nom : PoolNAS, Chiffrement : Aucun, Données Layout : RAIDZ1 (équivalent RAID5), les 3 disques de 100 Go.

![raidz1](/images/2026-01-12-22-33-18.png)

Lorsqu'on crée le volume il efface les données qui auraient pu y rester

![pooldone](/images/2026-01-12-22-35-11.png)

## Création d’un dataset et partage SMB

On va ajouter un Dataset (une Zone de stockage dans un pool, équivalent à un dossier), Nom : Dataset, Préréglage : SMB (pour Windows), Ne pas cocher "Créer un partage SMB" et laisser les options avancées par défaut.

![dataset](/images/2026-01-12-22-49-09.png)

On va créer un utilisateur SMB : dans Identifiants → Utilisateurs → Ajouter. Prénom/Nom, mot de passe, groupe principal root, cocher Utilisateur SMB.

![user](/images/2026-01-12-23-12-41.png)

Dans Partage on ajoute le SMB

![smb](/images/2026-01-12-23-14-12.png)

![smb](/images/2026-01-12-23-15-36.png)

Running!

![smb](/images/2026-01-12-23-15-59.png)

Pour tester, on va ouvrir les emplacements réseaux

![reseau](/images/2026-01-12-23-19-14.png)

On se log avec notre utilisateur nouvellement créé

![log](/images/2026-01-12-23-19-48.png)

On a bien accès au Dataset

![dataset](/images/2026-01-12-23-20-43.png)

Test de création d'un fichier txt

![fichier](/images/2026-01-12-23-29-14.png)

## Snapshots ZFS

Pour la création d’un snapshot on va aller dans Datasets → Sélectionner Dataset → Créer un instantané.

![snapshot](/images/2026-01-12-23-35-05.png)

Maintenant on supprime notre fichier Test.txt

![delete](/images/2026-01-12-23-40-54.png)

On va dans Datasets View Snapshot On déroule le menu du Snap et on Clone vers un nouveau Dataset

![clone](/images/2026-01-12-23-40-26.png)

![dataset](/images/2026-01-12-23-41-37.png)

Il faut partager ce nouveau dataset en SMB également

![smb](/images/2026-01-12-23-50-43.png)

Et on peut retourner voir sur notre utilisateur

![reseau](/images/2026-01-12-23-48-14.png)

And voilà !

![OK](/images/2026-01-12-23-52-16.png)
