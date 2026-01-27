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
