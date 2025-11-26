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

- Pour la GPO MDP, qu'on va appliquer aux promos :

Config Ordi > Strat > Paramètres Windows > Paramètres de sécurité > Stratégies de compte > Stratégie de mot de passe

![MDP](/images/2025-11-26-11-28-08.png)

De nos jours l'ANSSI recommande plutôt :

Un MDP fort : 15+ caractères avec majuscules, minuscules, chiffres, caractères spéciaux. Une Rotation moins fréquente : changement s'il y a une suspicion de piratage ou alors très rarement (ex: tous les 6 mois ou 1 an). La MFA (Authentification Multi-Facteurs) : C'est la vraie sécurité aujourd'hui. Un mot de passe volé ne sert à rien sans le téléphone/2FA de l'utilisateur.

- Pour la GPO Verrou Numérique, on va l'appliquer à tous les utilisateurs.

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

## 7. Bonus

>📚 **Ressources** :
>
> Profils itinérants - ITconnect : <https://www.it-connect.fr/active-directory-creer-des-profils-itinerants-pour-ses-utilisateurs/>
>
> Profils itinérants - RDRit : <https://rdr-it.com/configurer-profils-itinerants-environnement-ad/>
>
> Logiciel .msi par GPO - ITconnect : <https://www.it-connect.fr/comment-deployer-un-logiciel-au-format-msi-par-gpo/>



## 8. Bonus extreme
