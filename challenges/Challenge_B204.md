# Challenge B204 15/01/2026

## Pitch de l’exercice 🧑‍🏫

>⌨️ Challenge :
>
> Installer Proxmox Backup Server, configurer, backup et restore

[Cours B204.](/RESUME.md#-b204-proxmox-backup-server)

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

Il sera en IP statique 10.0.0.85

![pbs](/images/2026-01-15-10-06-37.png)

Pour se connecter on ira sur `https:10.0.0.85:8007` (port 8006 étant le ProxmoxVE server) et on se connecte en root avec le mdp créé lors de l'installation

![log](/images/2026-01-15-10-16-52.png)

## Configuration du PBE sur ProxmoxVE

On va configurer notre seconde IP réseau (vmbr1/nic1) et faire Apply Configuration

![nic1](/images/2026-01-15-10-20-16.png)

Puis test un ping via le shell de notre serveur ProxmoxVE

![ping](/images/2026-01-15-10-26-48.png)

Sur notre interface on peut trouver :

- Configuration :
  - Access Control pour les connexions sécurisées
  - Remotes pour les serveurs en lien avec notre PBS
  - S3 Endpoints pour AWS
  - Traffic Control pour les limitations et prévisions
  - les certificats, notifications, etc

- Administration :
  - Notre PBS status, logs, repo, etc
  - le Shell
  - les Disques et espaces de stockage, la ZFS

- Tape Backup
  - permet de stocker directement sur des bandes magnétiques (cassettes)

- Datastore
  - notre datastore comme dans TrueNAS avec nos jobs
  - Prune : Supprime les métadonnées des sauvegardes anciennes (snapshots) sans supprimer les données réelles.
  - GC (Garbage Collection) : Étape suivante après le prune. Supprime définitivement les chunks de données inutilisés (non référencés par aucune sauvegarde).

On va créer une ZFS en Miroir (on pourrait se mettre en RAID Z si on avait 3 disques)

![zfs](/images/2026-01-15-11-01-02.png)

![zfs](/images/2026-01-15-11-02-41.png)

On voit qu'on peut sauvegarder des conteneurs, des VM et aussi des serveurs physiques (Host), par exemple sur des cassettes !

![zfs](/images/2026-01-15-11-03-57.png)

On va aller sur notre ProxmoxVE, pour connecter notre PBS

![pbs](/images/2026-01-15-11-11-40.png)

Il nous faut l'empreinte de notre PBS (dans le Dashboard)

![fingerprint](/images/2026-01-15-11-14-02.png)

Et voilà

![pbs](/images/2026-01-15-11-23-59.png)

## Opération de Backup

Il suffit d'aller sur une VM : Backup

![backup](/images/2026-01-15-11-26-47.png)

![backup](/images/2026-01-15-11-34-18.png)

On peut retrouver la Backup sur ProxmoxVE dans notre VM, sur le Storage PBS et surtout dans PBS directement dans le Datastore

![pbs](/images/2026-01-15-11-39-38.png)

En détail on peut même retrouver nos fichiers de config, disques etc

![datastore](/images/2026-01-15-11-40-59.png)

On a des actions disponibles directement : V pour Verify la sauvegarde

![verify](/images/2026-01-15-11-43-22.png)

La silhouette pour changer l'owner

![owner](/images/2026-01-15-11-46-19.png)

Le ciseau pour "Prune" et nettoyer l'historique

![prune](/images/2026-01-15-11-48-10.png)

Le bouclier sur une backup permet de la protéger

![shield](/images/2026-01-15-11-53-30.png)

Et la corbeille pour supprimer (suivi d'un GC Job)

On peut faire de même avec un Container

![ct](/images/2026-01-15-12-00-51.png)

![ct](/images/2026-01-15-12-01-52.png)
