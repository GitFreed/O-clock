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

Mappage des nouveaux Dossiers en Lecteurs dans la GPO Drives

![mappage](/images/2025-11-26-10-15-35.png)

## 4. GPO Verrou NUM et MDP

dans le registre
Ordinateur\HKEY_CURRENT_USER\Control Panel\Keyboard ==> modifier avec la valeur 2 la ligne InitialKeyboardIndicators
Ordinateur\HKEY_USERS\.DEFAULT\Control Panel\Keyboard ==> modifier avec la valeur 2 la ligne InitialKeyboardIndicators

## 5. Fonds d'écran

## 6. Limite horaire de connexion

## 7. Bonus

## 8. Bonus extreme
