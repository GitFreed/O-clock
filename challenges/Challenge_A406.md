# Atelier A406 26/11/2025

## Pitch de l’exercice 🧑‍🏫

![1](/images/2025-11-26-09-20-40.png)

![2](/images/2025-11-26-09-21-27.png)

![3](/images/2025-11-26-09-21-53.png)

---

## 1. Récap

- Créer 2 nouvelles promos GS et un utilisateur dans chaque
- Créer leurs dossiers partagés et les configurer pour chaque promo, quotas de 30Go, fichiers .divx interdits
- Ajouter une GPO Verrou NUM pour tous + Politique MDP 30 jours
- Ajouter une GPO Fond d'écran différent pour chaque Promo
- Désactiver la connexion des étudiants Zinc et Basilic à partir de 17h jusqu’à 8h00 (dans l'AD)
- Bonus : Installer un Navigateur via GPO (.msi)
- Bonus extreme : mise en place de profils itinérants et installation de VSCode / / Bonus perso : Installer Clink Terminal

## 2. Nouvelles promos

Création de l'utilisateur et ajout à son GS

![GS](/images/2025-11-26-09-52-40.png)

Ajout des promos au GS Promos général

![promos](/images/2025-11-26-09-53-44.png)

## 3. Dossiers partagés et règles

Création des dossiers partagés des promos et pour les fonds d'écran et programmes à installer je vais créer un dossier caché Adminfile$

![partage dossier](/images/2025-11-26-09-58-46.png)

![partages](/images/2025-11-26-10-09-22.png)

Création d'un Quota 30 Go dans le gestionnaire de ressources du serveur de fichiers

![Modèle](/images/2025-11-26-10-03-47.png)

![Quotas](/images/2025-11-26-10-08-06.png)

Mappage des nouveaux Dossiers en Lecteurs dans la GPO Drives avec Ciblage des GS concernés

![mappage](/images/2025-11-26-10-15-35.png)

Filtre : Interdire les fichiers DIVX (nostalgie)

![divx](/images/2025-11-26-10-34-10.png)

![filtres](/images/2025-11-26-10-37-51.png)

## 4. GPO Verrou NUM et MDP

- Pour la GPO MDP, sur les promos *Correction : elle ne fonctionne pas dans une UO, il faut la mettre à la racine pour dans la Default Policies*

Config Ordi > Strat > Paramètres Windows > Paramètres de sécurité > Stratégies de compte > Stratégie de mot de passe

![MDP](/images/2025-11-26-11-28-08.png)

De nos jours l'ANSSI recommande plutôt :

Un MDP fort : 15+ caractères avec majuscules, minuscules, chiffres, caractères spéciaux. Une Rotation moins fréquente : changement s'il y a une suspicion de piratage ou alors très rarement (ex: tous les 6 mois ou 1 an). La MFA (Authentification Multi-Facteurs) : C'est la vraie sécurité aujourd'hui. Un mot de passe volé ne sert à rien sans le téléphone/2FA de l'utilisateur.

- Pour la GPO Verrou Numérique, on va l'appliquer à tous les utilisateurs, directement sur l'ordinateur.

Config Ordi > Pref > Paramètres Windows > Registre : Nouvel élément de registre

\HKEY_USERS\.DEFAULT\Control Panel\Keyboard : modifier avec la valeur 2 la ligne InitialKeyboardIndicators

![vernum](/images/2025-11-26-11-13-20.png)

- On va profiter de cette règle Générale pour empêcher les Utilisateurs de modifier le futur Wallpaper :

Config Util > Strat > Modèles d'admin > Panneau de configuration > Personnalisation > Empêcher de modifier l'arrière plan du bureau

- Et bloquer le Windows Update de nos VM :

Config Util > Strat > Modèles d'admin > Système > Mise à jour automatiques de Windows

Voilà ce que ça donne dans l'arborescence des GP

![GPOs](/images/2025-11-26-11-32-34.png)

## 5. Fonds d'écran

Pour chaque promo on va créer une image personnalisée avec le nom de cette dernière dans un coin

On va ajouter la GPO Bureau pour chaque promo avec son image personnalisée

![walpp](/images/2025-11-26-11-30-36.png)

![GPOs](/images/2025-11-26-11-33-05.png)

- Test pour Alice Martin de la Promo Basilic, Drives OK, Filtre DIVX OK, Wallpaper perso OK.

![test](/images/2025-11-26-12-43-46.png)

## 6. Limite horaires de connexion

On peut créer des plages horaire dans le profil de chaque utilisateur (on peut sélectionner tout un groupe avec Ctrl+A par ex pour aller plus vite)

![horaires](/images/2025-11-26-11-47-14.png)

Attention, un utilisateur qui se connecte à 16h55 pourra continuer de travailler après l'horaire définit, il faut faire une GPO "Force Logoff" appliquée aux 2 promos concernées

Config Ordi > Strat > Paramètres Windows > Paramètres de sécurité > Stratégies locales > Options de sécurité : Serveur réseau : déconnecter les clients à l'expiration des horaires d'accès

![logoff](/images/2025-11-26-11-54-14.png)

## 7. Bonus : Installer Firefox par GPO

>📚 **Ressources** :
>
> Logiciel .msi par GPO - ITconnect : <https://www.it-connect.fr/comment-deployer-un-logiciel-au-format-msi-par-gpo/>

Pour installer un programme par GPO, on télécharge l'intall Firefox.msi, on le met dans le dossier Adminfile$

On va dans la GPO : Confi ordi > Strat > Paramètres du logiciel > Installation de logiciel

![GPO](/images/2025-11-26-14-42-08.png)

On autorise les ordinateurs du domaine a accéder au dossier Adminfile$

![admin](/images/2025-11-26-14-40-34.png)

On doit placer la GPO dans le domaine et pas dans une Unité d'Organisation

![GPO](/images/2025-11-26-14-55-02.png)

Un gpupdate ou un reboot pour l'activer

![Gpupdate](/images/2025-11-26-14-55-21.png)

C'est bon !

![FirefoxOK](/images/2025-11-26-14-58-40.png)

## 8. Bonus extreme

### Profils Itinérants

>📚 **Ressources** :
>
> Profils itinérants - ITconnect : <https://www.it-connect.fr/active-directory-creer-des-profils-itinerants-pour-ses-utilisateurs/>
>
> Profils itinérants - RDRit : <https://rdr-it.com/configurer-profils-itinerants-environnement-ad/>
Création d'un groupe de sécurité  "GS_Roaming_profil_users" contenant nos promos

![GS Roaming](/images/2025-11-26-13-41-09.png)

Création du dossier de partage pour les profils itinérants dans le dossier Shares : "Profil" avec un $ pour le masquer

![Dossier](/images/2025-11-26-13-37-15.png)

Partage Avancé du dossier aux Utilisateurs Authentifiés seulement, et gestions des Autorisations dans Sécurité, ajout du groupe GS_Roaming

![Autorisations](/images/2025-11-26-13-35-52.png)

Création d'une GPO pour que les Admin aient accès aux dossiers de roaming

Config ordi > Strat > Modèles d’administration > Système > Profils utilisateur

![admin](/images/2025-11-26-13-48-16.png)

Ajout du Profil itinérant par utilisateur dans l'AD, pour chaque utilisateur le chemin sera : \\WS2025\Profil$\%username%

![profil](/images/2025-11-26-13-52-11.png)

Je déco/reco mon Utilisateur (Alice Martin) et je peux voir que le dossier itinérant s'est bien créé!

![roamingok](/images/2025-11-26-14-02-59.png)

Mon admin à bien accès aux dossiers Roaming des différents Utilisateurs

![admin](/images/2025-11-26-14-18-31.png)

### VScode

>📚 **Ressources** :
>
> Deployment VScode : <https://github.com/letsdoautomation/group-policy/tree/main/Deploy%20Visual%20Studio%20Code>
>
> Installer un .EXE par GPO - ITconnect : <https://www.it-connect.fr/comment-deployer-un-logiciel-au-format-exe-par-gpo/>

- VScode

On va créer un script pour l'installer, avec le fichier .exe dans notre dossier \\WS2025\Adminfile$\

![script](/images/2025-11-26-19-25-10.png)

Création de la GPO pour lancer le script

Config ordi > Strats > Paramètres Windows > Scripts (démarrage/arrêt)

![GPO](/images/2025-11-26-19-27-05.png)

J'autorise également les scripts locaux dans Powershell

Config ordi > Strats > Modèles d'admin > Composants Windows > Microsoft Powershell

![GPO](/images/2025-11-26-19-28-56.png)

Après 3h d'essai de multiples tentatives de scripts via le dossier partagé, de scripts dans la GPO, de scripts Winget ou autres.... ça ne fonctionne pas. La machine des utilisateurs à planté, un Snapshot d'avant l'atelier pour la récupérer à fait bug tout ce que j'avais mis en place sûrement à cause des dossiers de roaming.

![fail](/images/2025-11-26-19-07-51.png)

Je les ai effacés, refait un gpupdate, redémarré, tout est rentré dans l'ordre.

Par contre toujours pas de VScode. Vu le log du script il semble pourtant bien installé mais impossible de mettre la main dessus :

![log](/images/2025-11-26-19-13-44.png)

Test avec un script bat

![bat](/images/2025-11-26-23-35-55.png)

Toujours pas...

*Correction : Déployer VScode via 2 GPO <https://github.com/letsdoautomation/group-policy/tree/main/Deploy%20Visual%20Studio%20Code>*

- GPO > Util > Pref > Win > Fichier : Ajout : Mettre à jour

source : \\WS2025\Adminfile$\VSCodeUserSetup-x64-1.106.3.exe

destination : C:\deployment\VSCode\VSCodeUserSetup-x64-1.106.3.exe

ciblage : Clé de registre existe, Option : N'est pas. Chemin : Software\Microsoft\Windows\CurrentVersion\Uninstall\{771FD6B0-FA20-440A-A002-3B3BAC16DC50}_is1

C'est une vérification du registre pour voir si VScode est installé ou pas.

- GPO > Util > Pref > Win > Registre : Ajout : Mettre à jour

Chemin : Software\Microsoft\Windows\CurrentVersion\RunOnce

Nom : InstallVSCode

Données de valeur : %CommonAppdataDir%\deployment\VSCode\VSCodeUserSetup-x64-1.106.3.exe /VERYSILENT /NORESTART /SUPPRESSMSGBOXES /MERGETASKS=!runcode,desktopicon

Ciblage : IDEM

OK!!!

![OK](/images/2025-11-27-17-53-36.png)