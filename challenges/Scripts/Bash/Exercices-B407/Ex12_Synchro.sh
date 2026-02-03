#!/bin/bash

# --- CONFIGURATION ---
SOURCE=$1
DEST=$2
LOG_FILE="backup.log"

# Couleurs (Visibles !)
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
VERT='\033[0;32m'
ROUGE='\033[0;31m'
NC='\033[0m'

# 1. VÉRIFICATION DES ARGUMENTS
if [ -z "$SOURCE" ] || [ -z "$DEST" ]; then
    echo -e "${ROUGE}Usage : $0 <source> <destination>${NC}"
    exit 1
fi

# 2. VÉRIFICATION EXISTENCE SOURCE
if [ ! -d "$SOURCE" ]; then
    echo -e "${ROUGE}❌ Erreur : Le dossier source '$SOURCE' n'existe pas.${NC}"
    exit 1
fi

# 3. CRÉATION DESTINATION SI BESOIN
if [ ! -d "$DEST" ]; then
    echo -e "${MAGENTA}⚠️  Le dossier destination n'existe pas. Création...${NC}"
    mkdir -p "$DEST"
fi

# 4. VÉRIFICATION ESPACE DISQUE (Sécurité)
# du -s : taille sommaire / cut -f1 : récupère le chiffre
TAILLE_SOURCE=$(du -s "$SOURCE" | cut -f1)
# df --output=avail : espace dispo / tail -1 : dernière ligne
ESPACE_DISPO=$(df "$DEST" | tail -1 | awk '{print $4}')

if [ "$TAILLE_SOURCE" -gt "$ESPACE_DISPO" ]; then
    echo -e "${ROUGE}❌ Erreur : Pas assez d'espace disque sur la destination !${NC}"
    echo "Besoin : $TAILLE_SOURCE Ko | Dispo : $ESPACE_DISPO Ko"
    exit 1
fi

clear
echo -e "${CYAN}=== 🔄 SYNCHRONISATEUR DE FICHIERS ===${NC}"
echo -e "Source : ${VERT}$SOURCE${NC}"
echo -e "Dest   : ${VERT}$DEST${NC}"
echo ""

# 5. DEMANDE OPTION BONUS (DELETE)
read -p "🗑️  BONUS : Voulez-vous supprimer dans la destination les fichiers qui n'existent plus dans la source ? (o/N) " REP_DEL

OPTIONS="-avh --progress --stats"

if [[ "$REP_DEL" =~ ^[oO]$ ]]; then
    echo -e "${MAGENTA}👉 Mode MIROIR activé (--delete)${NC}"
    OPTIONS="$OPTIONS --delete"
else
    echo -e "${CYAN}👉 Mode INCREMENTAL (On garde tout)${NC}"
fi

echo ""
echo "⏳ Démarrage de la synchronisation..."
echo "-------------------------------------"

# 6. LANCEMENT DE RSYNC
# -a : Archive (garde les permissions, dates, droits...)
# -v : Verbose (parle beaucoup)
# -h : Human readable (tailles en Mo/Go)
# --progress : Barre de progression
# --stats : Affiche le résumé à la fin
rsync $OPTIONS "$SOURCE/" "$DEST/" 2>> "$LOG_FILE"

# Vérification du succès
if [ $? -eq 0 ]; then
    echo "-------------------------------------"
    echo -e "${VERT}✅ Synchronisation terminée avec succès !${NC}"
    echo "📝 Logs écrits dans $LOG_FILE"
else
    echo -e "${ROUGE}❌ Une erreur est survenue (Voir $LOG_FILE)${NC}"
fi
