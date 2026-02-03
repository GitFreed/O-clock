#!/bin/bash

# --- CONFIGURATION ---
# Liste des services à surveiller (Tu peux en ajouter d'autres ici)
SERVICES=("ssh" "cron" "apache2")

# Vérification Root (Obligatoire pour démarrer/arrêter des services)
if [ "$(id -u)" -ne 0 ]; then
    echo "❌ Erreur : Ce script a besoin des droits admin (sudo)."
    exit 1
fi

# Fonction pour afficher l'état des services (Tableau Corrigé)
show_status() {
    echo ""
    echo "--- 🔌 ÉTAT DES SERVICES ---"
    printf "%-15s | %-15s | %-15s\n" "SERVICE" "ÉTAT ACTUEL" "AU DÉMARRAGE"
    echo "------------------------------------------------------"
    
    for s in "${SERVICES[@]}"; do
        # 1. On récupère l'état (active/inactive/failed)
        STATUS=$(systemctl is-active "$s" 2>/dev/null)
        # Si c'est vide, alors le service n'existe pas
        if [ -z "$STATUS" ]; then STATUS="Introuvable"; fi

        # 2. On récupère la config au démarrage (enabled/disabled)
        BOOT=$(systemctl is-enabled "$s" 2>/dev/null)
        # Si c'est vide, on met un tiret
        if [ -z "$BOOT" ]; then BOOT="-"; fi

        # Affichage formaté
        printf "%-15s | %-15s | %-15s\n" "$s" "$STATUS" "$BOOT"
    done
    echo "------------------------------------------------------"
    echo ""
}

# --- BOUCLE PRINCIPALE ---
while true; do
    # 1. On affiche l'état actuel
    show_status

    # 2. Menu d'actions
    echo "--- MENU ---"
    echo "1. Démarrer un service"
    echo "2. Arrêter un service"
    echo "3. Redémarrer un service"
    echo "4. Quitter"
    
    read -p "Ton choix : " CHOIX

    if [ "$CHOIX" -eq 4 ]; then
        echo "Au revoir !"
        break
    fi

    # 3. Choix du service
    echo ""
    read -p "Nom du service concerné (ex: ssh) : " NOM_SERVICE

    # 4. Exécution de l'action
    case $CHOIX in
        1)
            echo "🚀 Démarrage de $NOM_SERVICE..."
            systemctl start "$NOM_SERVICE"
            ;;
        2)
            echo "🛑 Arrêt de $NOM_SERVICE..."
            systemctl stop "$NOM_SERVICE"
            ;;
        3)
            echo "🔄 Redémarrage de $NOM_SERVICE..."
            systemctl restart "$NOM_SERVICE"
            ;;
        *)
            echo "Choix invalide."
            ;;
    esac

    # Vérification du code de retour de la dernière commande ($?)
    if [ $? -eq 0 ]; then
        echo "✅ Opération réussie !"
    else
        echo "❌ Erreur lors de l'opération (Le service existe-t-il ?)."
    fi
    
    # Petite pause pour laisser le temps de lire
    sleep 2
done

