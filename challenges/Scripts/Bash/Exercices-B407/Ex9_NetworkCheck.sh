#!/bin/bash

# --- CONFIGURATION ---
# Liste des cibles (Tu peux mettre des IP ou des noms de domaine)
SERVEURS=("google.com" "github.com" "cloudflare.com" "stackoverflow.com" "freedexplore.com" "introuvable.bidon")
RAPPORT="resultats_reseau.txt"

# Couleurs pour faire joli
VERT='\033[0;32m'
ROUGE='\033[0;31m'
JAUNE='\033[1;33m'
NC='\033[0m' # No Color

# Initialisation du fichier de rapport (On écrase l'ancien)
echo "--- RAPPORT RÉSEAU $(date) ---" > "$RAPPORT"
printf "%-20s | %-12s | %-10s\n" "SERVEUR" "ÉTAT" "LATENCE" >> "$RAPPORT"

# Compteurs
TOTAL=${#SERVEURS[@]}
SUCCESS=0

clear
echo -e "${JAUNE}=== 📡 TEST DE CONNECTIVITÉ ===${NC}"
echo "--------------------------------------------------"
printf "%-20s | %-12s | %-10s\n" "SERVEUR" "ÉTAT" "LATENCE"
echo "--------------------------------------------------"

# Boucle sur chaque serveur
for s in "${SERVEURS[@]}"; do
    
    # --- LE PING ---
    # -c 1 : Envoie UN SEUL paquet (sinon ping ne s'arrête jamais sous Linux)
    # -W 1 : Attend MAX 1 seconde la réponse (W = Wait)
    # 2>&1 : Redirige les erreurs vers la sortie standard pour tout traiter
    RESULTAT=$(ping -c 1 -W 1 "$s" 2>&1)

    # Vérification du code de retour ($? est égal à 0 si ça a marché)
    if [ $? -eq 0 ]; then
        
        # Extraction de la latence (le temps en ms)
        # On cherche "time=" et on coupe ce qui dépasse
        TIME=$(echo "$RESULTAT" | grep "time=" | awk -F 'time=' '{print $2}' | awk '{print $1}')
        
        # Indicateur de qualité (Couleur selon la vitesse)
        # On enlève les décimales pour comparer des nombres entiers avec Bash
        VAL_ENTIERE=$(echo "$TIME" | cut -d. -f1)
        
        if [ "$VAL_ENTIERE" -lt 50 ]; then
            COULEUR_LAT=$VERT  # Super rapide
        elif [ "$VAL_ENTIERE" -lt 150 ]; then
            COULEUR_LAT=$JAUNE # Moyen
        else
            COULEUR_LAT=$ROUGE # Lent
        fi

        # Affichage Écran
        printf "%-20s | ${VERT}%-12s${NC} | ${COULEUR_LAT}%-8s ms${NC}\n" "$s" "EN LIGNE" "$TIME"
        
        # Écriture Fichier (Sans couleurs)
        printf "%-20s | %-12s | %-8s ms\n" "$s" "EN LIGNE" "$TIME" >> "$RAPPORT"
        
        ((SUCCESS++)) # On incrémente le compteur de succès
        
    else
        # Si le ping a échoué
        printf "%-20s | ${ROUGE}%-12s${NC} | %-10s\n" "$s" "HORS LIGNE" "-"
        printf "%-20s | %-12s | %-10s\n" "$s" "HORS LIGNE" "-" >> "$RAPPORT"
    fi
done

echo "--------------------------------------------------"
echo ""
echo -e "RÉSUMÉ : ${VERT}$SUCCESS${NC} / $TOTAL serveurs accessibles."
echo "📄 Rapport complet sauvegardé dans : $RAPPORT"

# Ajout du résumé dans le fichier texte
echo "" >> "$RAPPORT"
echo "RÉSUMÉ : $SUCCESS / $TOTAL serveurs accessibles." >> "$RAPPORT"
