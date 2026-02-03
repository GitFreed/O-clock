#!/bin/bash

# Vérification root car lastb nécessite souvent des droits élevés
if [ "$(id -u)" -ne 0 ]; then
    echo "Il faut être root pour lire lastb (utilise sudo) !"
    exit 1
fi

echo "🚨 TOP 10 des tentatives de connexion échouées (SSH) :"

# lastb : Affiche la liste
# awk '{print $3}' : Prend la 3ème colonne (L'IP)
# ... le reste est identique !
lastb | awk '{print $3}' | sort | uniq -c | sort -nr | head -n 10
