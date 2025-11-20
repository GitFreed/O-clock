# Challenge A401 19/11/2025

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2025-11-20-16-54-33.png)

[Cours A401. Active Directory](https://github.com/GitFreed/O-clock/blob/main/RESUME.md#-a402-active-directory-domain-services-ad-ds)

---

## 1. Installation WS2025 sur Proxmox

Comme hier pour l'installation de la version 2022. Puis on doit :

- Attribuer une IP fixe au serveur
- Renommer notre serveur dans les propriétés Système (ex SERVWIN2025) / reboot
- Ajouter les fonctionnalités d'Active Directory dans Gérer : Roles et Fonctionnalités
- Activer le bureau à Distance
- Promouvoir ce srv en contrôleur de domaine (dans AD DS apparu dans l'onglet de gauche ou sur la notification jaune), ajout d'une nouvelle forêt et de son nom de domaine racine (ex : domain.local).
- Ce contrôleur de domaine sera aussi notre serveur DNS.

![AD DS](/images/2025-11-20-18-08-58.png)

![DONE](/images/2025-11-20-19-07-19.png)

## 2. AD DS Gestion d'utilisateurs

Pour créer 2 utilisateurs, Alice et Bob, on va dans Outils : utilisateurs et ordinateurs Active Directory. Dans le domaine créé on va ajouter une nouvelle Unité d'Organisation. Et y créer 2 Utilisateurs. On peut configurer la gestion de leurs MDP, comme le fait d'en créer un nouveau personnel à leur première connexion.

![UO](/images/2025-11-20-19-13-17.png)

Sur une machine client du même lan, on va ajouter l'adresse du serveur DNS en fixe puis ajouter le domaine dans les propriétés Système : nom de l'ordinateur.

⚠️ Attention de ne pas changer en même temps le nom et le domaine, il faut toujours changer le nom, reboot, puis changer le domaine.

![domain](/images/2025-11-20-19-27-10.png)

Au reboot on peut se connecter aux sessions d'Alice ou Bob dans le nouveau domaine.

![Alice](/images/2025-11-20-19-30-27.png)

Si on veut se connecter à la session locale qui était présente avant on peut toujours en faisant ``NOMDUCLIENT\Nom de l'utilisateur local``

Je peux voir dans le gestionnaire des utilisateurs/ordinateurs le client qui s'est connecté au domaine.

![computer](/images/2025-11-20-19-35-01.png)
