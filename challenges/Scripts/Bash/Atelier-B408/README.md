# 🛠️ SysAdmin Toolbox

Une suite d'outils Bash pour l'administration système automatisée, développée dans le cadre de l'atelier Scripting.

## 📋 Prérequis

- OS : Linux (Ubuntu/Debian recommandé)
- Droits : Root / Sudo nécessaires pour la plupart des scripts.
- Dépendances : `curl`, `openssh-server` (optionnel pour le test), `jq` (pour le JSON).

## 🚀 Installation

### 1. Cloner ou copier tous les scripts dans un dossier

### 2. Rendre les scripts exécutables

```bash
chmod +x *.sh
```

### 3. Lancer le menu principal

```bash
sudo ./sysadmin-tools.sh
```

## 🧰 Liste des Outils

### 1. Sauvegarde (`backup.sh`)

- **But :** Archive un dossier donné.
- **Fonctionnalités :** Logs, vérification espace disque, rotation (garde les 7 derniers).
- **Usage :** `./backup.sh <dossier_source>`

### 2. Monitoring (`monitor.sh`)

- **But :** Surveille la santé du serveur.
- **Fonctionnalités :** CPU, RAM, Disque, Top Processus, Alertes couleurs, Rapport fichier.
- **Usage :** `./monitor.sh [report]`

### 3. Gestion Utilisateurs (`create-users.sh`)

- **But :** Importation de masse depuis CSV.
- **Fonctionnalités :** Création comptes, groupes, mots de passe aléatoires, suppression.
- **Usage :** `./create-users.sh <fichier.csv> [--delete]`

### 4. Nettoyeur (`cleanup.sh`)

- **But :** Libère de l'espace disque.
- **Cibles :** Cache APT, /tmp, logs > 30 jours, corbeilles.
- **Sécurité :** Mode "Dry-Run" (simulation) par défaut.
- **Usage :** `./cleanup.sh [--force]`

### 5. Services Checker (`check-services.sh`)

- **But :** Haute disponibilité des services (SSH, Apache, etc.).
- **Fonctionnalités :** Auto-restart, export JSON, mode Watch temps réel.
- **Usage :** `./check-services.sh [--watch]`

## ⚙️ Fichiers de Configuration

- `users.csv` : Liste des employés (Format: Prenom,Nom,Departement,Job).
- `services.conf` : Liste des noms de services à surveiller.

---
**Auteur :** Freed
**Version :** 1.0
