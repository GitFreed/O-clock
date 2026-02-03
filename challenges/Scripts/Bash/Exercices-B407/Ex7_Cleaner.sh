#!/bin/bash

# --- CONFIGURATION ---
JOURS=$1
LOG_DIR="/var/log"
OP_LOG="nettoyage.log"

# 1. Vérification : Root
if [ "$(id -u)" -ne 0 ]; then
    echo "❌ Erreur : Il faut être root pour nettoyer /var/log (sudo)."
    exit 1
fi

# 2. Vérification : Argument nombre de jours
# La regex ^[0-9]+$ vérifie que c'est bien un nombre entier
if [[ -z "$JOURS" ]] || ! [[ "$JOURS" =~ ^[0-9]+$ ]]; then
    echo "Usage : sudo $0 <nombre_de_jours>"
    echo "Exemple : sudo $0 7 (Supprime les logs vieux de plus de 7 jours)"
    exit 1
fi

echo "🔍 Recherche des fichiers .log et .gz de plus de $JOURS jours dans $LOG_DIR..."

# 3. RECHERCHE DES FICHIERS
# find cherche dans /var/log
# -type f : seulement les fichiers (pas les dossiers)
# \( ... \) : groupe les conditions de nom (log OU gz)
# -mtime +$JOURS : modifiés il y a PLUS de X jours
LISTE_FICHIERS=$(find "$LOG_DIR" -type f \( -name "*.log" -o -name "*.gz" \) -mtime +$JOURS 2>/dev/null)

# Si la liste est vide, on s'arrête
if [ -z "$LISTE_FICHIERS" ]; then
    echo "✅ Aucun vieux fichier à supprimer."
    exit 0
fi

# 4. CALCUL DE LA TAILLE ET AFFICHAGE
# On passe la liste à 'du' (Disk Usage) pour voir la taille
# -c : affiche le total à la fin
# -h : format humain (Mo, Go...)
echo ""
echo "--- FICHIERS À SUPPRIMER ---"
echo "$LISTE_FICHIERS" | xargs -d '\n' du -ch
echo "----------------------------"

# On récupère juste la dernière ligne (le total) pour l'affichage final
TOTAL_SIZE=$(echo "$LISTE_FICHIERS" | xargs -d '\n' du -ch | tail -n 1 | cut -f1)

# 5. DEMANDE DE CONFIRMATION
read -p "⚠️  ATTENTION : Voulez-vous supprimer ces fichiers ? (y/N) " REP

if [[ "$REP" == "y" || "$REP" == "Y" ]]; then
    echo "🗑️  Suppression en cours..."
    
    # 6. SUPPRESSION ET JOURNALISATION
    echo "--- Nettoyage du $(date) ---" >> "$OP_LOG"
    
    # On lit la liste ligne par ligne pour supprimer et logger
    while IFS= read -r file; do
        rm "$file"
        echo "Supprimé : $file" >> "$OP_LOG"
    done <<< "$LISTE_FICHIERS"

    echo "✅ Nettoyage terminé !"
    echo "💾 Espace libéré : $TOTAL_SIZE"
    echo "📝 Détails enregistrés dans $OP_LOG"
else
    echo "❌ Opération annulée."
fi
