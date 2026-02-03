#!/bin/bash

# On récupère les deux arguments (Source en $1, Cible en $2)
SOURCE=$1
CIBLE=$2

# Etape 0 : Sécurité - On vérifie que l'utilisateur a bien mis 2 arguments
# -z vérifie si la variable est vide
if [ -z "$SOURCE" ] || [ -z "$CIBLE" ]; then
    echo "Erreur : Il manque des arguments."
    echo "Usage : $0 <dossier_source> <dossier_cible>"
    exit 1
fi

# Etape 1 : On vérifie que le dossier SOURCE existe vraiment
# -d permet de tester si c'est un "directory" (répertoire)
if [ ! -d "$SOURCE" ]; then
    echo "Erreur : Le dossier source '$SOURCE' n'existe pas !"
    exit 1
fi

# Etape 2 : On vérifie si la CIBLE existe, sinon on la crée
if [ -d "$CIBLE" ]; then
    echo "Le dossier cible existe déjà."
else
    echo "Le dossier cible n'existe pas. Création en cours..."
    mkdir -p "$CIBLE" # -p permet de créer les parents si besoin (ex: dossier/sous-dossier)
fi

# Etape 3 : La copie
# cp -r signifie "récursif" (prend les fichiers ET les sous-dossiers)
echo "Copie des fichiers de '$SOURCE' vers '$CIBLE'..."
cp -r "$SOURCE"/* "$CIBLE"

echo "Opération terminée avec succès !"
