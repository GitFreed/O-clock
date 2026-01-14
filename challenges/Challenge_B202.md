# Challenge B202 13/01/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2026-01-13-15-42-44.png)

[Cours B201.](/RESUME.md#-b201-introduction-au-stockage)

> - Installation Veeam Backup & Replication <https://help.ovhcloud.com/csm/fr-public-cloud-storage-veeam-backup-replication?id=kb_article_view&sysparm_article=KB0046511>
>
> Veeam Backup & Replication est un logiciel de protection des données. Il offre diverses possibilités de sauvegarde, de réplication et de restauration.

---

## Installation de Veeam Backup & Replication 13

Télécharger l'ISO ici <https://download2.veeam.com/VBR/v13/VeeamBackup&Replication_13.0.1.1071_20251217.iso>

Attention il faut une VM avec au moins 80+ Go de libre

On monte l'ISO dans notre machine Windows pour installer Veeam

![veeam](/images/2026-01-13-15-36-07.png)

![wizard](/images/2026-01-13-15-38-06.png)

Au niveau de la Licence on peut faire suivant

![licence](/images/2026-01-13-16-05-01.png)

![install](/images/2026-01-13-16-15-31.png)

![installation](/images/2026-01-13-16-15-46.png)

![OK](/images/2026-01-13-16-52-32.png)

## Configuration de Veeam Backup & Replication 13

On redémarre et maintenant on peut se connecter à notre console Veeam en local

![backup](/images/2026-01-13-17-11-47.png)

Puis sign in as current user (Veeam utilisera les identifiants de notre session Windows actuelle pour ouvrir l'interface de gestion)

![signin](/images/2026-01-13-23-09-52.png)

Nous voilà connectés

![Veeam](/images/2026-01-13-23-12-33.png)

Maintenant il nous reste à configurer notre Repo (avec TrueNAS), ajouter notre machine et créer un Backup Job.

## Configuration des Repository

Sur TrueNAS on va créer un dossier de partage UNIX (NFS)

![nfs](/images/2026-01-14-11-24-11.png)

![nfs](/images/2026-01-14-11-25-34.png)

On retrouve le volume SMB mais pas NFS dans le partage réseau car il n'est pas activé sur Windows

![dataset](/images/2026-01-14-11-35-00.png)

On va monter ce volume NFS pour le voir sur notre machine

Avant ça on va activer les fonctionnalités Windows : Services NFS

![nfs](/images/2026-01-14-11-44-45.png)

Dans un invite de commande on lance `mount -o 10.0.0.70:/mnt/PoolNAS/NFSDataset N:`

![nfs](/images/2026-01-14-11-46-31.png)

Dans Veeam on va dans Inventory : Unstructured Data et Add Data Source

![inventory](/images/2026-01-14-11-52-46.png)

Ici on peut choisir les volumes à ajouter

On va choisir le volume dataset SMB pour commencer

![smb](/images/2026-01-14-11-54-25.png)

On va ajouter notre utilisateur TrueNAS dans les accès

![smb](/images/2026-01-14-12-02-26.png)

Ici on peut choisir entre vitesse et impact sur la machine pour la backup

![smb](/images/2026-01-14-12-08-01.png)

![smb](/images/2026-01-14-12-12-24.png)

![smb](/images/2026-01-14-12-13-25.png)

On va faire de même pour le NFS, attention ici on est sur une structure serveur (format Linux, sensible aux majuscules, qu'on peut retrouver dans TrueNAS)

![nfs](/images/2026-01-14-13-22-04.png)

![nfs](/images/2026-01-14-13-23-26.png)

On va maintenant pouvoir ajouter un Backup Repository dans la Backup Infrastructure : NFS Share

![nfs](/images/2026-01-14-13-52-12.png)

On le nomme et ajout du serveur, on configure le nombre de tâches max

![repo](/images/2026-01-14-13-57-47.png)

On ajoute notre Windows et il va vérifier si tout est OK puis démarrer les services

![services](/images/2026-01-14-13-58-23.png)

![valide](/images/2026-01-14-14-00-17.png)

Quand c'est finit on valide et on choisi ce Repo NFS comme Repo de Backup par défaut

> - **Récap** :
>
> 1. Le partage NFS (Côté TrueNAS)
> Ce qu'on vient de créer sur TrueNAS, c'est la cible physique. C'est le dossier sur nos disques durs qui va recevoir les octets de sauvegarde. En informatique, on appelle ça un "Partage réseau" ou un "Volume".
>
> 2. Le Repository (Côté Veeam)
> Dans Veeam, le Repository (Dépôt) est un objet logique. C'est l'étape où on vas dans l'interface de Veeam pour lui dire :
>
> "Hé Veeam, je te présente le dossier NFS qui se trouve sur l'IP 10.0.0.70. Désormais, considère-le comme un 'Repository' utilisable pour mes jobs de Backup."

## Configuration de la Backup

On va Create Backup Job dans Unstructured Data

![backup](/images/2026-01-14-13-46-13.png)

![name](/images/2026-01-14-13-47-20.png)

Choix de l'objet à sauvegarder, ici on va prendre tout notre dataset

![objet](/images/2026-01-14-13-49-44.png)

Puis on sélectionne notre Repo NFS créé précédemment, on configure le nombre de versions de backup à garder et on peut même choisir un second endroit de Backup (par exemple pour notre règle 3-2-1). Dans Advanced on peut configurer plus précisément, avec les permissions, la compression, le chiffrement, lancer des scripts, des notifications etc

![repo](/images/2026-01-14-14-09-34.png)

On laisse l'Archivage, on peut choisir le calendrier et l'automatisation
