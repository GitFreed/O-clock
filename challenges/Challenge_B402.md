# Challenge B402 27/01/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2026-01-27-15-45-52.png)

Challenge B402 : <https://github.com/O-clock-Aldebaran/SB04E02-git-github-GitFreed>

[Cours B402.](/RESUME.md#-b402-git-github--markdown)

---

## Installation et configuration de Git

Tout est déjà installé et configuré, utilisant Git et Gihub depuis le début de ma formation.

## Clonage du dépôt

on va cloner le dépôt pour le récupérer en local avec `git clone`

![clone](/images/2026-01-27-18-17-56.png)

On peut vérifier ce qu'il y a dedans et son status avec les commandes `ls` et `git status`

![status](/images/2026-01-27-18-19-48.png)

On peut afficher le log pour voir sur quelle branche on se trouve (master > principale) et laquelle est sur HEAD (moi) et origin (le dépôt)

![log](/images/2026-01-27-18-22-41.png)

## Découverte du dépôt

Avec `ls` on voit ce qui est dans le dépôt, avec `cat README.md` je peux lire ce qu'il y a dans le Readme (qui est en syntaxe markdown).

![readme](/images/2026-01-27-18-29-15.png)

On va vérifier la configuration du du dépôt distant avec `git remote -v` et sur quelle branche on est avec `git branch`

![remote](/images/2026-01-27-18-29-50.png)

## Premier script

On va créer un script avec `code backup-users.sh`

![script](/images/2026-01-27-18-45-42.png)

Avec `git status` on peut voir que notre script est "untracked", on va l'ajouter dans la liste de ce qui doit être ajouté au dépôt avec `git add`

![add](/images/2026-01-27-18-49-36.png)

On va maintenant le commit avec `git commit -m "feat: ajout du script de sauvegarde utilisateurs"` pour lui ajouter une description de version

![commit](/images/2026-01-27-18-51-25.png)

## Synchronisation avec GitHub

Avant de pousser nos  modifications,on va récupérer les éventuelles modifications des autres avec `git pull` puis envoyer notre commit avec `git push`

![push](/images/2026-01-27-18-56-39.png)

## Ajout de plusieurs scripts

On va ajouter plusieurs scripts avec code, add, commit

Script de monitoring réseau :

```bash
#!/bin/bash
# Script de monitoring réseau

echo "=== Monitoring Réseau ==="

echo "--- Interfaces réseau ---"
ip addr show

echo "--- Connexions actives ---"
ss -tuln

echo "--- Test de connectivité ---"
ping -c 3 8.8.8.8
```

![monitoring](/images/2026-01-27-18-59-05.png)

Script de nettoyage système :

```bash
#!/bin/bash
# Script de nettoyage système

echo "=== Nettoyage du système ==="

echo "Nettoyage des paquets inutiles..."
# sudo apt autoremove -y

echo "Nettoyage du cache..."
# sudo apt clean

echo "Nettoyage des logs anciens..."
# sudo journalctl --vacuum-time=7d

echo "Nettoyage terminé !"
```

![cleanup](/images/2026-01-27-19-09-33.png)

Fichier de configuration :

```bash
# Configuration des scripts TechSecure

# Sauvegarde
BACKUP_RETENTION=7
BACKUP_DIR=/backup

# Monitoring
CHECK_INTERVAL=300
LOG_LEVEL=INFO

# Nettoyage
AUTO_CLEANUP=true
```

![conf](/images/2026-01-27-19-09-53.png)

On peut maintenant regarder les logs, pull et les push

![push](/images/2026-01-27-19-10-45.png)

## Modification de fichiers existants

On va modifier le README pour documenter l'ajout de scripts

![readme](/images/2026-01-27-19-22-20.png)

![commit](/images/2026-01-27-19-23-17.png)

On va modifier le script backup et ajouter

```bash
# Nettoyage des sauvegardes de plus de 7 jours
echo "Nettoyage des anciennes sauvegardes..."
# find $BACKUP_DIR -name "users_*.tar.gz" -mtime +7 -delete
```

![commit](/images/2026-01-27-19-26-07.png)

On finit pas un pull et un push !

![push](/images/2026-01-27-19-27-24.png)

## Récupération du travail des autres

Avec git pull pour récupérer, puis log pour connaître les nouveaux commits, lire avec cat etc

![cat](/images/2026-01-27-19-32-50.png)

## Bonnes pratiques

On va créer un fichier git ignore pour que Github ignore certaines informations sensibles

```bash
# Fichiers à ignorer
*.log
*.tmp
*.swp
backup/
.env
passwords.txt
```

![gitignore](/images/2026-01-27-19-34-49.png)

On va faire un fichier `test.log`

![test](/images/2026-01-27-19-39-39.png)

![log](/images/2026-01-27-19-41-49.png)

On peut voir que le fichier gitignore est bien présent et qu'on a pas le `test.log`

![github](/images/2026-01-27-19-38-17.png)

## Synthèse et réflexion

> Question 1 : Git vs GitHub Expliquez la différence entre Git et GitHub. Pourquoi utilise-t-on GitHub en entreprise ?

Git est le logiciel installé sur le PC pour gérer les versions, alors que GitHub est le site web qui héberge les projets. En entreprise, on utilise GitHub pour centraliser le code et permettre à toute l'équipe de collaborer sur les mêmes fichiers.

> Question 2 : Cycle de travail Décrivez les étapes pour contribuer à un projet : de la modification d'un fichier jusqu'à son envoi sur GitHub.

Je modifie mon fichier, on fait un `git add` pour préparer la sauvegarde, ensuite un `git commit` pour valider la version localement, et on finit par un `git push` pour envoyer le tout sur GitHub.

> Question 3 : Pull avant Push Pourquoi est-il important de faire git pull avant git push quand on travaille en équipe ?

Il faut toujours faire un pull avant pour récupérer le travail des collaborateurs. Ça évite les conflits et ça permet d'être sûr qu'on travaille sur la dernière version à jour avant d'envoyer nos modifs.

> Question 4 : Messages de commit Donnez 3 exemples de bons messages de commit et 3 exemples de mauvais messages.

- Bons : "Ajout du script de backup", "Correction du bug d'affichage", "Mise à jour du README".

- Mauvais : "Modif", "Oups", "Update"
