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
