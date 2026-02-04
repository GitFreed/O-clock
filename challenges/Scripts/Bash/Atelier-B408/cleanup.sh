#!/bin/bash

# --- CONFIGURATION ---
LOG_FILE="/var/log/cleanup.log"
DAYS_TMP=7
DAYS_LOG=30
DRY_RUN=true  # Par défaut, on ne supprime RIEN (Sécurité)

# Couleurs
VERT='\033[0;32m'
ROUGE='\033[0;31m'
JAUNE='\033[1;33m'
BLEU='\033[0;34m'
NC='\033[0m'

# 1. Vérification Root
if [ "$(id -u)" -ne 0 ]; then
    echo "❌ Ce script doit être lancé avec sudo."
    exit 1
fi

# 2. Gestion des Arguments (--force ou -f)
for arg in "$@"; do
    if [[ "$arg" == "--force" ]] || [[ "$arg" == "-f" ]]; then
        DRY_RUN=false
    fi
done

# Fonction de log centralisée
log_action() {
    local MSG=$1
    echo -e "$MSG"
    # On enlève les couleurs pour le fichier log
    echo "$MSG" | sed 's/\x1b\[[0-9;]*m//g' >> "$LOG_FILE"
}

# Fonction de nettoyage générique (C'est le cœur du script)
clean_dir() {
    local DIR=$1
    local PATTERN=$2
    local DAYS=$3
    local DESC=$4

    echo -e "${BLEU}--- Analyse : $DESC ---${NC}"
    
    # On cherche les fichiers correspondants
    # Si PATTERN est "*", on cherche tout, sinon on filtre par nom
    if [ "$PATTERN" == "*" ]; then
        FILES=$(find "$DIR" -type f -mtime +$DAYS 2>/dev/null)
    else
        FILES=$(find "$DIR" -type f -name "$PATTERN" -mtime +$DAYS 2>/dev/null)
    fi

    # On compte les fichiers trouvés
    COUNT=$(echo "$FILES" | wc -w)

    if [ -z "$FILES" ]; then
        log_action "✅ Rien à nettoyer dans $DESC."
        return
    fi

    # MODE SIMULATION (DRY-RUN)
    if [ "$DRY_RUN" = true ]; then
        echo -e "${JAUNE}[SIMULATION]${NC} Fichiers qui seraient supprimés ($COUNT) :"
        echo "$FILES" | head -n 5
        if [ "$COUNT" -gt 5 ]; then echo "... et $((COUNT - 5)) autres."; fi
    
    # MODE RÉEL (FORCE)
    else
        log_action "🗑️  Suppression de $COUNT fichiers dans $DESC..."
        
        # On lit la liste et on supprime
        echo "$FILES" | xargs rm -f
        log_action "${VERT}Nettoyage terminé pour $DESC.${NC}"
    fi
}

# --- DÉBUT DU SCRIPT ---

# Initialisation du log
echo "--- NETTOYAGE DU $(date) ---" >> "$LOG_FILE"

# Mesure de l'espace AVANT
SPACE_BEFORE=$(df / --output=avail | tail -1)

if [ "$DRY_RUN" = true ]; then
    echo -e "${JAUNE}⚠️  MODE SIMULATION (DRY-RUN) ACTIVÉ ⚠️${NC}"
    echo "Utilisez 'sudo $0 --force' pour exécuter réellement."
else
    echo -e "${ROUGE}🚨 MODE FORCE ACTIVÉ : SUPPRESSION RÉELLE ! 🚨${NC}"
    # Demande de confirmation ultime
    read -p "Êtes-vous sûr de vouloir continuer ? (o/N) " REP
    if [[ ! "$REP" =~ ^[oO]$ ]]; then
        echo "Annulé."
        exit 0
    fi
fi

echo ""

# 1. Nettoyage /tmp (> 7 jours)
clean_dir "/tmp" "*" "$DAYS_TMP" "Fichiers temporaires (/tmp)"

# 2. Nettoyage Logs compressés (> 30 jours)
clean_dir "/var/log" "*.gz" "$DAYS_LOG" "Vieux logs compressés (.gz)"

# 3. Cache APT (Paquets téléchargés)
echo -e "${BLEU}--- Analyse : Cache APT ---${NC}"
TAILLE_APT=$(du -sh /var/cache/apt/archives 2>/dev/null | cut -f1)

if [ "$DRY_RUN" = true ]; then
    echo -e "${JAUNE}[SIMULATION]${NC} 'apt-get clean' libérerait environ : $TAILLE_APT"
else
    log_action "Exécution de apt-get clean..."
    apt-get clean
    log_action "${VERT}Cache APT vidé ($TAILLE_APT libérés).${NC}"
fi

# 4. Corbeille Utilisateurs (Risqué mais demandé)
# On vide les dossiers .local/share/Trash de tous les users dans /home
echo -e "${BLEU}--- Analyse : Corbeilles Utilisateurs ---${NC}"
TRASH_DIRS=$(ls -d /home/*/.local/share/Trash/files 2>/dev/null)

if [ -n "$TRASH_DIRS" ]; then
    if [ "$DRY_RUN" = true ]; then
        echo -e "${JAUNE}[SIMULATION]${NC} Contenu des corbeilles détecté :"
        du -sh $TRASH_DIRS 2>/dev/null
    else
        log_action "Vidage des corbeilles..."
        rm -rf /home/*/.local/share/Trash/files/* 2>/dev/null
        rm -rf /home/*/.local/share/Trash/info/* 2>/dev/null
        log_action "${VERT}Corbeilles vidées.${NC}"
    fi
else
    echo "✅ Corbeilles déjà vides ou inaccessibles."
fi

# --- RAPPORT FINAL ---
echo ""
echo "------------------------------------------------"

# Mesure de l'espace APRÈS
SPACE_AFTER=$(df / --output=avail | tail -1)
GAIN=$((SPACE_AFTER - SPACE_BEFORE))

# Conversion en Mo pour être lisible
GAIN_MO=$((GAIN / 1024))

if [ "$DRY_RUN" = true ]; then
    echo "Espace disque actuel : $((SPACE_BEFORE / 1024)) Mo"
    echo "Ceci était une simulation. Rien n'a été effacé."
else
    echo -e "🎉 TERMINÉ ! Espace libéré : ${VERT}${GAIN_MO} Mo${NC}"
    echo "📝 Détails dans : $LOG_FILE"
fi
