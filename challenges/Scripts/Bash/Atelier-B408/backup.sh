#!/bin/bash

# --- CONFIGURATION ---
SOURCE_DIR=$1
DEST_DIR="/backup"
LOG_FILE="/var/log/backup.log"
DATE_FORMAT=$(date +"%Y%m%d_%H%M%S")
NOM_ARCHIVE="backup_${DATE_FORMAT}.tar.gz"
CHEMIN_FINAL="${DEST_DIR}/${NOM_ARCHIVE}"

# Fonction pour écrire dans le log ET à l'écran
log_msg() {
    local MESSAGE=$1
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $MESSAGE" | tee -a "$LOG_FILE"
}

# 1. Vérification Root (nécessaire pour écrire dans /backup et /var/log)
if [ "$(id -u)" -ne 0 ]; then
    echo "❌ Ce script doit être lancé avec sudo."
    exit 1
fi

# 2. Vérification argument
if [ -z "$SOURCE_DIR" ]; then
    echo "Usage: $0 <dossier_a_sauvegarder>"
    exit 1
fi

# 3. Vérification existence source
if [ ! -d "$SOURCE_DIR" ]; then
    log_msg "ERREUR: Le dossier source '$SOURCE_DIR' n'existe pas."
    exit 1
fi

# 4. Création destination si absente
if [ ! -d "$DEST_DIR" ]; then
    mkdir -p "$DEST_DIR"
    log_msg "Création du dossier $DEST_DIR."
fi

# 5. Vérification Espace Disque (Un peu technique)
# On estime la taille du dossier source (du -s)
TAILLE_SOURCE=$(du -s "$SOURCE_DIR" | cut -f1)
# On regarde l'espace dispo sur la destination (df)
ESPACE_DISPO=$(df "$DEST_DIR" | tail -1 | awk '{print $4}')

if [ "$TAILLE_SOURCE" -gt "$ESPACE_DISPO" ]; then
    log_msg "ERREUR: Pas assez d'espace disque (Besoin: ${TAILLE_SOURCE}K, Dispo: ${ESPACE_DISPO}K)"
    exit 1
fi

# 6. Création de l'archive
log_msg "Début de la sauvegarde de $SOURCE_DIR vers $CHEMIN_FINAL..."

# 2> /dev/null cache les erreurs mineures (fichiers modifiés pendant la lecture)
tar -czf "$CHEMIN_FINAL" "$SOURCE_DIR" 2> /dev/null

if [ $? -eq 0 ]; then
    TAILLE_ARCHIVE=$(du -h "$CHEMIN_FINAL" | cut -f1)
    log_msg "SUCCÈS: Sauvegarde terminée. Taille: $TAILLE_ARCHIVE"
else
    log_msg "ÉCHEC: Erreur lors de la création de l'archive tar."
    exit 1
fi

# --- 7. ROTATION DES SAUVEGARDES ---
log_msg "Vérification de la rotation (Max 7 fichiers)..."

# On liste les archives dans /backup, triées par temps (ls -t = plus récent en haut), on prend à partir du 8ème
# ls -tp : t=time, p=ajoute / aux dossiers (pour les filtrer avec grep -v /)
A_SUPPRIMER=$(ls -tp "$DEST_DIR" | grep -v / | tail -n +8)

if [ -n "$A_SUPPRIMER" ]; then
    cd "$DEST_DIR" # On se place dedans pour supprimer
    for f in $A_SUPPRIMER; do
        log_msg "ROTATION: Suppression de l'ancienne sauvegarde $f"
        rm "$f"
    done
else
    log_msg "Rotation non nécessaire (Moins de 7 sauvegardes)."
fi

echo "✅ Opération terminée."
