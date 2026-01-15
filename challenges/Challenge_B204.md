# Challenge B204 15/01/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/)

[Cours B204.](/RESUME.md#-b204)

---

## Installation de Proxmox Backup Server

![proxmox](/images/2026-01-15-09-49-51.png)

> Documentation <https://pbs.proxmox.com/docs/>

On va télécharger l'ISO ici <https://enterprise.proxmox.com/iso/proxmox-backup-server_4.1-1.iso>

Attention : il vaut penser à vider de temps en temps le dossier des téléchargements temporaire

```bash
cd /var/tmp
rm -rf *
```

Lors de l'installation, on ajoute 2 disques en SATA pour les datas, on fait l'installation sur le disque SCSI, on ajoutera avant de démarrer une second vmbr (vmbr1) pour être sur le réseau interne entre nos VM et notre serveur Proxmox

![pbs](/images/2026-01-15-09-57-19.png)

Et c'est parti, on l'installe comme un Proxmox classique

![pbs](/images/2026-01-15-09-58-57.png)
