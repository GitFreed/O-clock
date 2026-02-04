#!/bin/bash

# --- CONFIGURATION ---
CONFIG_FILE="services.conf"
JSON_REPORT="services_report.json"
AUTO_RESTART=true  # Met à "false" si tu ne veux pas qu'il touche à tes services

# Couleurs
VERT='\033[0;32m'
ROUGE='\033[0;31m'
JAUNE='\033[1;33m'
NC='\033[0m'

# Vérification Root (nécessaire pour redémarrer les services)
if [ "$(id -u)" -ne 0 ]; then
    echo "❌ Ce script doit être lancé avec sudo."
    exit 1
fi

if [ ! -f "$CONFIG_FILE" ]; then
    echo "❌ Erreur : Fichier de configuration $CONFIG_FILE introuvable."
    exit 1
fi

# --- FONCTION PRINCIPALE ---
check_services() {
    # On commence le tableau JSON
    echo "[" > "$JSON_REPORT"
    
    TOTAL=0
    ACTIFS=0
    INACTIFS=0

    echo -e "--- 🏥 ÉTAT DES SERVICES ($(date '+%H:%M:%S')) ---"
    printf "%-15s | %-15s | %-15s | %-10s\n" "SERVICE" "ÉTAT" "DÉMARRAGE" "ACTION"
    echo "---------------------------------------------------------------"

    # Lecture du fichier ligne par ligne
    while read -r SERVICE || [ -n "$SERVICE" ]; do
        if [ -z "$SERVICE" ]; then continue; fi
        ((TOTAL++))

        # 1. Récupération des états (active/inactive et enabled/disabled)
        STATUS=$(systemctl is-active "$SERVICE" 2>/dev/null)
        ENABLED=$(systemctl is-enabled "$SERVICE" 2>/dev/null)

        # 2. Analyse et Actions
        if [ "$STATUS" == "active" ]; then
            ((ACTIFS++))
            COLOR_STATUS=$VERT
            MSG_ACTION="-"
        else
            ((INACTIFS++))
            COLOR_STATUS=$ROUGE
            STATUS="inactive" # On normalise le texte
            
            # 3. AUTO-RESTART (Le médecin tente une réanimation)
            if [ "$AUTO_RESTART" = true ]; then
                # On essaie de redémarrer silencieusement
                systemctl restart "$SERVICE" 2>/dev/null
                
                # On vérifie immédiatement si ça a marché
                if systemctl is-active "$SERVICE" -q; then
                    MSG_ACTION="${VERT}Redémarré !${NC}"
                    STATUS="recovered"
                else
                    MSG_ACTION="${ROUGE}Échec${NC}"
                fi
            else
                MSG_ACTION="${JAUNE}Alerte !${NC}"
            fi
        fi

        # Affichage Ligne
        printf "%-15s | ${COLOR_STATUS}%-15s${NC} | %-15s | %b\n" "$SERVICE" "$STATUS" "$ENABLED" "$MSG_ACTION"

        # Ajout au rapport JSON (Construction manuelle ligne par ligne)
        echo "  { \"service\": \"$SERVICE\", \"status\": \"$STATUS\", \"enabled\": \"$ENABLED\" }," >> "$JSON_REPORT"

    done < "$CONFIG_FILE"

    echo "---------------------------------------------------------------"
    echo -e "RÉSUMÉ : ${VERT}$ACTIFS actifs${NC} / ${ROUGE}$INACTIFS inactifs${NC}"
    
    # Nettoyage JSON : on retire la virgule finale et on ferme le tableau
    sed -i '$ s/,$//' "$JSON_REPORT"
    echo "]" >> "$JSON_REPORT"
}

# --- GESTION DU MODE MONITORING (--watch) ---
if [ "$1" == "--watch" ]; then
    echo "👀 Mode Monitoring activé (Ctrl+C pour quitter)"
    sleep 1
    
    # trap intercepte le Ctrl+C pour quitter proprement
    trap "echo ' Arrêt du monitoring.'; exit 0" SIGINT

    while true; do
        clear
        check_services
        echo ""
        echo "Prochaine vérification dans 30s..."
        sleep 30
    done
else
    # Mode normal (une seule fois)
    check_services
    echo "📄 Rapport JSON généré : $JSON_REPORT"
fi
