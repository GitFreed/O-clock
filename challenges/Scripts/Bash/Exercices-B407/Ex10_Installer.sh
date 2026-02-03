#!/bin/bash

# --- CONFIGURATION ---
LISTE_PAQUETS=$1
RAPPORT="rapport_installation.txt"

# Couleurs
VERT='\033[0;32m'
ROUGE='\033[0;31m'
JAUNE='\033[1;33m'
BLEU='\033[0;36m'
NC='\033[0m'

# 1. Vérification Root (Obligatoire pour apt install)
if [ "$(id -u)" -ne 0 ]; then
    echo -e "${ROUGE}❌ Erreur : Lance ce script avec sudo !${NC}"
    exit 1
fi

# 2. Vérification du fichier liste
if [ -z "$LISTE_PAQUETS" ] || [ ! -f "$LISTE_PAQUETS" ]; then
    echo "Usage : sudo $0 <fichier_liste.txt>"
    exit 1
fi

# Initialisation
# wc -l compte les lignes. < permet de ne pas afficher le nom du fichier.
TOTAL=$(wc -l < "$LISTE_PAQUETS")
ACTUEL=0
SUCCES=0
ERREURS=0

# On écrase le vieux rapport
echo "--- RAPPORT D'INSTALLATION $(date) ---" > "$RAPPORT"

clear
echo -e "${BLEU}=== 📦 AUTOMATISATION D'INSTALLATION ===${NC}"
echo "Lecture de la liste : $LISTE_PAQUETS ($TOTAL paquets trouvés)"
echo ""

# 3. BOUCLE DE LECTURE
while IFS= read -r PAQUET; do
    # On ignore les lignes vides
    if [ -z "$PAQUET" ]; then continue; fi
    
    ((ACTUEL++))
    
    # Affichage de la progression [1/5]
    echo -ne "${BLEU}[$ACTUEL/$TOTAL]${NC} Vérification de '${JAUNE}$PAQUET${NC}'... "

    # 4. VÉRIFICATION (dpkg -s)
    # &> /dev/null cache la sortie (on veut juste savoir si ça réussit ou pas)
    if dpkg -s "$PAQUET" &> /dev/null; then
        echo -e "${VERT}✅ Déjà installé.${NC}"
        echo "$PAQUET : DÉJÀ INSTALLÉ" >> "$RAPPORT"
    else
        echo -e "${ROUGE}❌ Non installé.${NC}"
        
        # 5. PROPOSITION D'INSTALLATION
        # < /dev/tty force la lecture clavier même à l'intérieur d'une boucle while
        read -p "      > Voulez-vous l'installer maintenant ? (o/N) " REP < /dev/tty
        
        if [[ "$REP" =~ ^[oO]$ ]]; then
            echo "      📥 Installation en cours..."
            
            # apt-get install -y : Répond oui à tout automatiquement
            if apt-get install -y "$PAQUET" &> /dev/null; then
                echo -e "      ${VERT}✅ Installation réussie !${NC}"
                echo "$PAQUET : INSTALLÉ AVEC SUCCÈS" >> "$RAPPORT"
                ((SUCCES++))
            else
                echo -e "      ${ROUGE}💥 Échec de l'installation (Nom incorrect ?).${NC}"
                echo "$PAQUET : ERREUR INSTALLATION" >> "$RAPPORT"
                ((ERREURS++))
            fi
        else
            echo "      ⏭️  Ignoré."
            echo "$PAQUET : IGNORÉ PAR L'UTILISATEUR" >> "$RAPPORT"
        fi
    fi

done < "$LISTE_PAQUETS"

# 6. RÉSUMÉ FINAL
echo ""
echo "------------------------------------------------"
echo -e "TERMINÉ ! ${VERT}$SUCCES installés${NC} | ${ROUGE}$ERREURS erreurs${NC}"
echo "📝 Rapport complet disponible dans : $RAPPORT"
echo "------------------------------------------------"
