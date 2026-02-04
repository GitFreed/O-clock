#!/bin/bash

# --- 1. FONCTION COULEUR (C'est la partie "Intelligente") ---
# Cette fonction prend un nombre ($1) et affiche la couleur qui va avec
# Vert < 70% | Jaune 70-85% | Rouge > 85%
get_color() {
    local VALEUR=$1
    # On enlève les décimales pour comparer des entiers (Bash aime pas les virgules)
    # 1. tr ',' '.' : remplace virgule par point (2,2 -> 2.2)
    # 2. cut -d'.' -f1 : garde tout ce qu'il y a avant le point (2.2 -> 2)
    VALEUR=$(echo "$VALEUR" | tr ',' '.' | cut -d'.' -f1)

# Sécurité : Si VALEUR est vide (erreur de lecture), on met 0
    if [ -z "$VALEUR" ]; then VALEUR=0; fi

    if [ "$VALEUR" -lt 70 ]; then
        echo -e "\033[0;32m" # Vert
    elif [ "$VALEUR" -lt 85 ]; then
        echo -e "\033[1;33m" # Jaune
    else
        echo -e "\033[0;31m" # Rouge
    fi
}
RESET='\033[0m' # Pour remettre la couleur normale

# --- 2. COLLECTE DES DONNÉES (Les Maths) ---
echo "Analyse du système en cours..."

# HOSTNAME & DATE
HOST=$(hostname)
DATE=$(date "+%Y-%m-%d %H:%M:%S")
DATE_LOG=$(date "+%Y%m%d") # Format pour le nom du fichier log

# UPTIME (Depuis quand est-il allumé ?)
UPTIME=$(uptime -p)

# CPU (Le plus dur à extraire proprement)
# top -bn1 : lance top une fois en mode batch
# grep "Cpu(s)" : prend la ligne CPU
# awk ... : additionne l'utilisateur ($2) et le système ($4) pour avoir le total utilisé
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}' | cut -d. -f1)

# RAM (Mémoire)
# free -m : affiche en Mo
TOTAL_RAM=$(free -m | grep Mem | awk '{print $2}')
USED_RAM=$(free -m | grep Mem | awk '{print $3}')
# Calcul du pourcentage : (Utilisé * 100) / Total
PERCENT_RAM=$(( USED_RAM * 100 / TOTAL_RAM ))

# NOMBRE DE PROCESSUS
PROCESS_COUNT=$(ps aux | wc -l)

# --- 3. PRÉPARATION DE L'AFFICHAGE ---
# On stocke tout l'affichage dans une fonction pour pouvoir l'utiliser
# soit à l'écran, soit dans un fichier plus tard.

generer_rapport() {
    echo "=========================================="
    echo "   MONITEUR SYSTÈME : $HOST"
    echo "   Date : $DATE"
    echo "=========================================="
    echo ""
    echo "🔹 [GÉNÉRAL]"
    echo "   Uptime    : $UPTIME"
    echo "   Processus : $PROCESS_COUNT en cours"
    echo ""
    
    # On appelle notre fonction couleur $(get_color $VAR) juste avant d'afficher la variable
    COLOR_CPU=$(get_color "$CPU_USAGE")
    echo -e "🔹 [CPU] Usage : ${COLOR_CPU}${CPU_USAGE}%${RESET}"

    COLOR_RAM=$(get_color "$PERCENT_RAM")
    echo -e "🔹 [RAM] Usage : ${COLOR_RAM}${USED_RAM}/${TOTAL_RAM} Mo (${PERCENT_RAM}%)${RESET}"
    
    echo ""
    echo "🔹 [DISQUES] (Utilisation > 80% en ROUGE)"
    # On lit df ligne par ligne pour colorier celles qui sont pleines
    # grep -v "Utilis" : Ignore la ligne d'en-tête qui contient le mot "Utilisé" (ou "Use" en anglais)
    df -h | grep -vE '^Filesystem|tmpfs|cdrom|loop|udev|Utilis|Use' | while read line; do
        
        # On récupère le pourcentage (souvent 5ème colonne)
        PERC=$(echo $line | awk '{print $5}' | tr -d '%')
        
        # Astuce : Parfois sous Linux FR, df met un espace insécable ou change de colonne.
        # Si PERC n'est pas un nombre, on force 0 pour éviter l'erreur.
        if ! [[ "$PERC" =~ ^[0-9]+$ ]]; then PERC=0; fi

        if [ "$PERC" -ge 85 ]; then
            echo -e "${RED}$line${RESET}" 
        else
            echo "$line"
        fi
    done

    echo ""
    echo "🔹 [TOP 5 PROCESSUS GOURMANDS]"
    echo "--- PAR CPU ---"
    ps -eo comm,%cpu --sort=-%cpu | head -n 6
    echo ""
    echo "--- PAR RAM ---"
    ps -eo comm,%mem --sort=-%mem | head -n 6
}

# --- 4. GESTION DU MODE RAPPORT OU ÉCRAN ---

# 1. On affiche d'abord le rapport à l'écran
generer_rapport

echo ""
echo "----------------------------------------------------"

# 2. On propose la sauvegarde
# read -p : pose la question
read -p "📝 Voulez-vous sauvegarder ce rapport dans un fichier log ? (o/N) " REP

# Si la réponse est o ou O (Oui)
if [[ "$REP" =~ ^[oO]$ ]]; then
    
    # PETITE SÉCURITÉ : Vérifier qu'on est root (car /var/log est protégé)
    if [ "$(id -u)" -ne 0 ]; then
        echo -e "\033[0;31m❌ Erreur : Vous n'êtes pas root !\033[0m"
        echo "   Impossible d'écrire dans /var/log."
        echo "   Relancez le script avec : sudo $0"
    else
        FICHIER_LOG="/var/log/monitor_${DATE_LOG}.txt"
        
        echo "Sauvegarde en cours..."
        
        # On relance la fonction, on nettoie les couleurs (sed), et on écrit dans le fichier
        generer_rapport | sed 's/\x1b\[[0-9;]*m//g' > "$FICHIER_LOG"
        
        echo -e "\033[0;32m✅ Rapport sauvegardé avec succès : $FICHIER_LOG\033[0m"
    fi
else
    echo "Pas de sauvegarde. Au revoir !"
fi
