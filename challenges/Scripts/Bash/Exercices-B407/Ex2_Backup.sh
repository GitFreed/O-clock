#!/bin/bash

# 1. On récupère le dossier à sauvegarder (argument 1)
DOSSIER_SOURCE=$1

# 2. Vérification : Est-ce qu'on a bien donné un argument ?
if [ -z "$DOSSIER_SOURCE" ]; then
    echo "Erreur : Veuillez indiquer le dossier à sauvegarder."
    echo "Usage : $0 <dossier>"
    exit 1
fi

# 3. Vérification : Est-ce que ce dossier existe ?
if [ ! -d "$DOSSIER_SOURCE" ]; then
    echo "Erreur : Le dossier '$DOSSIER_SOURCE' est introuvable."
    exit 1
fi

# 4. Génération de la date et du nom du fichier
# $(...) permet d'exécuter une commande et de stocker son résultat dans la variable
DATE_ACTUELLE=$(date +%Y-%m-%d)

# On construit le nom : backup_2026-02-03.tar.gz
NOM_ARCHIVE="backup_$DATE_ACTUELLE.tar.gz"

echo "Création de l'archive '$NOM_ARCHIVE' à partir de '$DOSSIER_SOURCE'..."

# 5. La commande magique TAR
# -c : Create (Créer une nouvelle archive)
# -z : Gzip (Compresser pour que ça prenne moins de place)
# -f : File (Indiquer le nom du fichier de sortie)
tar -czf "$NOM_ARCHIVE" "$DOSSIER_SOURCE"

echo "✅ Sauvegarde terminée avec succès !"
