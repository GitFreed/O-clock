#!/bin/bash

LOG_FILE=$1

# 1. Vérification de l'argument
if [ -z "$LOG_FILE" ]; then
    echo "Usage : $0 <fichier_log>"
    exit 1
fi

# 2. Vérification que le fichier existe
if [ ! -f "$LOG_FILE" ]; then
    echo "Erreur : Le fichier '$LOG_FILE' n'existe pas."
    exit 1
fi

echo "📊 TOP 10 des adresses IP dans $LOG_FILE :"
echo "-------------------------------------------"
echo "  Qte  |  Adresse IP"
echo "-------------------------------------------"

# 3. LE PIPELINE MAGIQUE 🧙‍♂️
# awk '{print $1}' : Ne garde que la 1ère colonne (l'IP dans les logs Apache)
# sort             : Trie les IP (nécessaire pour que uniq fonctionne)
# uniq -c          : Compte les doublons consécutifs (-c = count)
# sort -nr         : Trie le résultat par nombre (-n) décroissant/Reverse (-r)
# head -n 10       : Ne garde que les 10 premiers

cat "$LOG_FILE" | awk '{print $1}' | sort | uniq -c | sort -nr | head -n 10
