# Atelier A411 03/12/2025

## Pitch de l’exercice 🧑‍🏫

⌨️ Challenge : Faire fonctionner GIMP en RDS : remoteapp

[Cours A411.](/RESUME.md#️-a411-rds-remote-desktop-services)

---

## 1. Télécharger et Installer GIMP sur le server local

![Download](/images/2025-12-03-15-53-52.png)

![Install](/images/2025-12-03-15-52-53.png)

## 2. Ajouter GIMP au RDS RemoteApp

Dans le Service Bureau à Distance > Collection > QuickSessionCollection > Programme RemoteApp > Tâche > Publier des programmes Remote App

![Remoteapp](/images/2025-12-03-15-46-07.png)

On peut sélectionner les programmes qui sont installés en local pour les publier dans le remoteApp

![ajout](/images/2025-12-03-15-59-30.png)

## 3. Test depuis un compte Utilisateur

On se connecte sur un Utilisateur et on accède au portail RDweb ou il faut s'authentifier

![rdweb](/images/2025-12-03-16-19-23.png)

GIMP apparaît bien dans la liste

![remotedeskapp](/images/2025-12-03-16-14-03.png)

On doit télécharger le lien et lorsqu'on le lance il faut à nouveau s'authentifier

![lien](/images/2025-12-03-16-20-40.png)

GIMP lancé en remote app

![OK](/images/2025-12-03-16-23-42.png)

Depuis le server je peux voir l'utilisateur connecté via le Gestionnaire des tâches

![gestionnaire](/images/2025-12-03-16-26-51.png)
