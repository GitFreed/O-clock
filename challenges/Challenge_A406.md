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
- Bonus : Installer un Navigateur via GPO (.msi) / Bonus perso : Installer Clink Terminal
- Bonus extreme :

## 2. Nouvelles promos

## 3. Dossiers partagés et règles

## 4. GPO Verrou NUM et MDP

dans le registre
Ordinateur\HKEY_CURRENT_USER\Control Panel\Keyboard ==> modifier avec la valeur 2 la ligne InitialKeyboardIndicators
Ordinateur\HKEY_USERS\.DEFAULT\Control Panel\Keyboard ==> modifier avec la valeur 2 la ligne InitialKeyboardIndicators

## 5. Fonds d'écran

Pour les fonds d'écran et programmes à installer je vais créer un dossier caché Admin$

## 6. Limite horaire de connexion

## 7. Bonus

## 8. Bonus extreme
