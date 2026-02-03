#!/bin/bash

# Définition des couleurs pour faire joli
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Petite sécurité : on rend tous les scripts exécutables d'un coup
chmod +x Ex*.sh

# Fonction de pause (pour attendre avant de revenir au menu)
pause(){
    echo ""
    read -p "Appuyez sur [Entrée] pour revenir au menu..."
}

# Boucle infinie du menu
while true; do
    clear
    echo -e "${BLUE}==============================================${NC}"
    echo -e "${YELLOW}        BASH MASTER - MENU PRINCIPAL         ${NC}"
    echo -e "${BLUE}==============================================${NC}"
    echo ""
    echo -e "${GREEN}1.${NC} Copier des fichiers (Ex1)"
    echo -e "${GREEN}2.${NC} Sauvegarde Archive (Ex2)"
    echo -e "${GREEN}3.${NC} Jeu du Plus ou Moins (Ex3)"
    echo -e "${GREEN}4.${NC} Créer Utilisateurs (Ex4) ${RED}(Sudo)${NC}"
    echo -e "${GREEN}5.${NC} Monitoring Logs (Ex5)"
    echo -e "${RED}Q.${NC} Quitter"
    echo ""
    
    read -p "Votre choix : " CHOIX

    case $CHOIX in
        1)
            echo -e "\n--- COPIE DE FICHIERS ---"
            read -p "Dossier Source : " SRC
            read -p "Dossier Cible : " DEST
            ./Ex1_Copy.sh "$SRC" "$DEST"
            pause
            ;;
        2)
            echo -e "\n--- SAUVEGARDE TAR.GZ ---"
            read -p "Dossier à sauvegarder : " DOSSIER
            ./Ex2_Backup.sh "$DOSSIER"
            pause
            ;;
        3)
            # Pas besoin d'arguments pour celui-là
            ./Ex3_PlusOuMoins.sh
            pause
            ;;
        4)
            echo -e "\n--- CRÉATION UTILISATEURS ---"
            read -p "Nom du fichier CSV : " CSV
            # On lance avec sudo car c'est nécessaire pour useradd
            sudo ./Ex4_CreateUsers.sh "$CSV"
            pause
            ;;
        5)
            echo -e "\n--- MONITORING LOGS ---"
            read -p "Fichier de log à analyser : " LOG
            ./Ex5_Monitor.sh "$LOG"
            pause
            ;;
        [qQ])
            echo "Au revoir !"
            break
            ;;
        *)
            echo "Choix invalide..."
            sleep 1
            ;;
    esac
done
