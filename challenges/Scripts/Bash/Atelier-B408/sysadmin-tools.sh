#!/bin/bash

# --- CONFIGURATION ---
VERSION="1.0"
AUTEUR="Freed (SysAdmin)"
LOG_FILE="/var/log/sysadmin-tools.log"
SCRIPTS=("backup.sh" "monitor.sh" "create-users.sh" "cleanup.sh" "check-services.sh")

# Couleurs
CYAN='\033[0;36m'
VERT='\033[0;32m'
ROUGE='\033[0;31m'
JAUNE='\033[1;33m'
NC='\033[0m'

# 1. VÉRIFICATION ROOT (Pour que tout fonctionne sans mot de passe)
if [ "$(id -u)" -ne 0 ]; then
    echo -e "${ROUGE}❌ Lancez ce menu avec sudo pour avoir tous les droits !${NC}"
    exit 1
fi

# 2. VÉRIFICATION DE LA PRÉSENCE DES SCRIPTS
echo "🔍 Vérification des outils..."
for script in "${SCRIPTS[@]}"; do
    if [ ! -f "./$script" ]; then
        echo -e "${ROUGE}❌ Erreur : Le script $script est manquant !${NC}"
        exit 1
    fi
    # On s'assure qu'ils sont exécutables
    chmod +x "./$script"
done

# Fonction de log
log_usage() {
    local ACTION=$1
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] USER=$SUDO_USER ACTION=$ACTION" >> "$LOG_FILE"
}

# Fonction pour attendre avant de revenir au menu
pause() {
    echo ""
    read -p "Appuyez sur [Entrée] pour revenir au menu..."
}

# --- BOUCLE PRINCIPALE (MENU) ---
while true; do
    clear
    echo -e "${CYAN}==============================================${NC}"
    echo -e "${CYAN}   🚀 SYSADMIN TOOLBOX v$VERSION - $AUTEUR    ${NC}"
    echo -e "${CYAN}==============================================${NC}"
    echo "1. 💾 Sauvegarde de répertoire (Backup)"
    echo "2. 📊 Monitoring Système (Ressources)"
    echo "3. 👥 Création d'utilisateurs (Mass import)"
    echo "4. 🧹 Nettoyage Système (Cleanup)"
    echo "5. 🏥 Santé des Services (Check)"
    echo "6. ❓ Aide / Documentation"
    echo "7. 🚪 Quitter"
    echo -e "${CYAN}==============================================${NC}"
    
    read -p "Votre choix : " CHOIX

    case $CHOIX in
        1)
            echo -e "\n--- SAUVEGARDE ---"
            read -p "Chemin du dossier à sauvegarder : " DOSSIER
            log_usage "Lancement Backup sur $DOSSIER"
            ./backup.sh "$DOSSIER"
            pause
            ;;
        2)
            echo -e "\n--- MONITORING ---"
            read -p "Générer un rapport fichier ? (o/N) : " REP
            log_usage "Lancement Monitoring"
            if [[ "$REP" =~ ^[oO]$ ]]; then
                ./monitor.sh report
            else
                ./monitor.sh
            fi
            pause
            ;;
        3)
            echo -e "\n--- UTILISATEURS ---"
            read -p "Fichier CSV (ex: users.csv) : " CSV
            read -p "Mode Suppression ? (o/N) : " DEL
            
            ARGS="$CSV"
            if [[ "$DEL" =~ ^[oO]$ ]]; then ARGS="$CSV --delete"; fi
            
            log_usage "Gestion Utilisateurs ($ARGS)"
            ./create-users.sh $ARGS
            pause
            ;;
        4)
            echo -e "\n--- NETTOYAGE ---"
            read -p "⚠️  Mode FORCE (suppression réelle) ? (o/N) : " FORCE
            if [[ "$FORCE" =~ ^[oO]$ ]]; then
                log_usage "Nettoyage FORCE"
                ./cleanup.sh --force
            else
                log_usage "Nettoyage Simulation"
                ./cleanup.sh
            fi
            pause
            ;;
        5)
            echo -e "\n--- SERVICES ---"
            read -p "Mode surveillance continue (Watch) ? (o/N) : " WATCH
            if [[ "$WATCH" =~ ^[oO]$ ]]; then
                log_usage "Check Services (Watch Mode)"
                ./check-services.sh --watch
            else
                log_usage "Check Services (Simple)"
                ./check-services.sh
            fi
            pause
            ;;
        6)
            clear
            echo -e "${JAUNE}--- 📚 DOCUMENTATION ---${NC}"
            echo "1. backup.sh : Crée une archive .tar.gz dans /backup avec rotation (7 max)."
            echo "2. monitor.sh : Affiche CPU/RAM/Disque et alerte si surcharge."
            echo "3. create-users.sh : Crée/Supprime des users depuis un CSV et génère des mots de passe."
            echo "4. cleanup.sh : Vide /tmp, cache APT et vieux logs. (Utiliser --force)."
            echo "5. check-services.sh : Vérifie SSH, Cron, etc. et tente de les redémarrer."
            pause
            ;;
        7)
            echo "Au revoir !"
            exit 0
            ;;
        *)
            echo "❌ Choix invalide."
            sleep 1
            ;;
    esac
done
