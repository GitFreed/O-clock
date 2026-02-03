#!/bin/bash

# --- CONFIGURATION ---
RAPPORT="rapport_disque.txt"
SEUIL_ALERTE=80

# Couleurs
ROUGE='\033[0;31m'
VERT='\033[0;32m'
JAUNE='\033[1;33m'
NC='\033[0m' # No Color

# Vérification Root (Pour pouvoir lire tous les dossiers de /home)
if [ "$(id -u)" -ne 0 ]; then
    echo "❌ Il faut être root pour scanner tout /home (sudo)."
    exit 1
fi

clear
echo -e "${JAUNE}=== 💾 ANALYSE DE L'ESPACE DISQUE ===${NC}"
echo ""

# --- PARTIE 1 : LES PARTITIONS (df) ---
echo -e "${JAUNE}1. État des partitions :${NC}"
printf "%-20s %-10s %-10s %-10s %-6s %-15s\n" "Système" "Taille" "Utilisé" "Dispo" "Uti%" "Monté sur"
echo "---------------------------------------------------------------------------"

# On lit la sortie de df -h ligne par ligne (en ignorant les loop/tmpfs pour y voir clair)
# grep -vE permet d'exclure les systèmes de fichiers virtuels "inutiles" (loop, tmpfs, udev)
df -h | grep -vE '^Filesystem|tmpfs|cdrom|loop|udev' | while read line; do
    
    # On extrait le pourcentage (5ème colonne) et on enlève le signe %
    PERCENT=$(echo $line | awk '{print $5}' | tr -d '%')
    
    # Condition de couleur
    if [[ "$PERCENT" =~ ^[0-9]+$ ]] && [ "$PERCENT" -ge $SEUIL_ALERTE ]; then
        # Si > 80%, on affiche toute la ligne en ROUGE
        echo -e "${ROUGE}$line${NC}"
    else
        # Sinon en VERT (ou normal)
        echo -e "${VERT}$line${NC}"
    fi
done

echo ""
echo "---------------------------------------------------------------------------"

# --- PARTIE 2 : LES GROS DOSSIERS (du) ---
echo -e "${JAUNE}2. Top 10 des plus gros dossiers dans /home :${NC}"
echo "(Calcul en cours... patience)"
echo ""

# du -h : taille lisible (Ko, Mo, Go)
# --max-depth=2 : on ne descend pas trop profond pour garder ça lisible
# 2>/dev/null : on cache les erreurs "Permission denied"
# sort -rh : trier (sort) en inverse (r) et en lisant les unités humaines (h)
# head -n 10 : garder les 10 premiers

LISTE_GROS=$(du -h /home 2>/dev/null | sort -rh | head -n 10)
echo "$LISTE_GROS"

echo ""
echo "---------------------------------------------------------------------------"

# --- PARTIE 3 : EXPORT ---
read -p "Voulez-vous exporter ce rapport dans '$RAPPORT' ? (o/N) " REP

if [[ "$REP" == "o" || "$REP" == "O" ]]; then
    echo "Création du rapport..."
    {
        echo "=== RAPPORT DISQUE $(date) ==="
        echo ""
        echo "[PARTITIONS]"
        df -h | grep -vE '^Filesystem|tmpfs|cdrom|loop|udev'
        echo ""
        echo "[TOP 10 HOME]"
        # On doit relancer la commande pour l'écrire dans le fichier
        du -h /home 2>/dev/null | sort -rh | head -n 10
    } > "$RAPPORT"
    
    echo "✅ Rapport sauvegardé dans $RAPPORT"
else
    echo "Pas d'export. Fin du script."
fi
