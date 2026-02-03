#!/bin/bash

# Couleurs (Thème Cyberpunk 🤖)
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
VERT='\033[0;32m'
ROUGE='\033[0;31m'
JAUNE='\033[1;33m'
NC='\033[0m'

# On rend tout exécutable d'un coup
chmod +x Ex*.sh 2>/dev/null

pause(){
    echo ""
    echo -e "${MAGENTA}Appuyez sur [Entrée] pour revenir au menu...${NC}"
    read
}

while true; do
    clear
    echo -e "${CYAN}====================================================${NC}"
    echo -e "${MAGENTA}         🚀  SYSADMIN TOOLBOX - ULTIMATE  🚀        ${NC}"
    echo -e "${CYAN}====================================================${NC}"
    echo ""
    echo -e "${JAUNE}--- BASIQUES ---${NC}"
    echo -e " 1. Copie de fichiers (Ex1)"
    echo -e " 2. Sauvegarde Archive (Ex2)"
    echo -e " 3. Jeu Plus ou Moins (Ex3)"
    echo -e " 4. Créer Utilisateurs (Ex4) ${ROUGE}(Sudo)${NC}"
    echo -e " 5. Monitoring Logs (Ex5)"
    echo ""
    echo -e "${JAUNE}--- SYSTÈME & MAINTENANCE ---${NC}"
    echo -e " 6. Gestion Services (Ex6) ${ROUGE}(Sudo)${NC}"
    echo -e " 7. Nettoyeur Logs (Ex7) ${ROUGE}(Sudo)${NC}"
    echo -e " 8. Analyse Disque (Ex8) ${ROUGE}(Sudo)${NC}"
    echo -e " 9. Test Réseau (Ex9)"
    echo ""
    echo -e "${JAUNE}--- AUTOMATISATION ---${NC}"
    echo -e "10. Installateur Paquets (Ex10) ${ROUGE}(Sudo)${NC}"
    echo -e "11. Rapport HTML (Ex11)"
    echo -e "12. Synchronisateur RSYNC (Ex12)"
    echo ""
    echo -e "${ROUGE} Q. Quitter${NC}"
    echo ""
    
    read -p "Votre choix : " CHOIX

    case $CHOIX in
        1)
            echo -e "\n--- COPIE ---"
            read -p "Source : " S; read -p "Dest : " D
            ./Ex1_Copy.sh "$S" "$D"; pause ;;
        2)
            echo -e "\n--- ARCHIVE ---"
            read -p "Dossier : " D
            ./Ex2_Backup.sh "$D"; pause ;;
        3)  ./Ex3_PlusOuMoins.sh; pause ;;
        4)
            echo -e "\n--- USERS ---"
            read -p "Fichier CSV : " F
            sudo ./Ex4_CreateUsers.sh "$F"; pause ;;
        5)
            echo -e "\n--- LOGS ---"
            read -p "Fichier Log : " L
            ./Ex5_Monitor.sh "$L"; pause ;;
        6)  sudo ./Ex6_Services.sh; pause ;;
        7)
            echo -e "\n--- CLEANER ---"
            read -p "Jours max : " J
            sudo ./Ex7_Cleaner.sh "$J"; pause ;;
        8)  sudo ./Ex8_DiskSpace.sh; pause ;;
        9)  ./Ex9_NetworkCheck.sh; pause ;;
        10)
            echo -e "\n--- INSTALL ---"
            read -p "Liste paquets : " L
            sudo ./Ex10_Installer.sh "$L"; pause ;;
        11) ./Ex11_Report.sh; pause ;;
        12)
            echo -e "\n--- SYNCHRO ---"
            read -p "Source : " S; read -p "Dest : " D
            ./Ex12_Synchro.sh "$S" "$D"; pause ;;
        [qQ])
            echo -e "${MAGENTA}Bye bye SysAdmin ! 👋${NC}"
            break ;;
        *)
            echo "Choix invalide..."
            sleep 1 ;;
    esac
done
