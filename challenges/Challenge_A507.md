# Challenge A507 18/12/2025

## Pitch de l’exercice 🧑‍🏫

⌨️ Installer et configurer une machine Arch

[Cours A507.](/RESUME.md#-a507)

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
