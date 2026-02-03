#!/bin/bash

# 1. Générer le nombre aléatoire
# $RANDOM donne un nombre entre 0 et 32767
# % 100 (Modulo) garde le reste de la division (donc entre 0 et 99)
# + 1 pour décaler le tout entre 1 et 100
SECRET=$(( (RANDOM % 100) + 1 ))

# On initialise la variable à 0 pour être sûr d'entrer dans la boucle
# (car 0 n'est jamais égal au nombre secret qui commence à 1)
GUESS=0

echo "=== JEU DU PLUS OU MOINS ==="
echo "Je pense à un nombre entre 1 et 100. Devine lequel !"

# 2. Boucle TANT QUE (While)
# -ne signifie "Not Equal" (N'est pas égal à)
while [ "$GUESS" -ne "$SECRET" ]; do

    # 3. Demander une saisie à l'utilisateur
    # -p permet d'afficher le message sur la même ligne
    read -p "Votre proposition : " GUESS

    # 4. Comparaisons
    # -lt = Less Than (Plus petit que <)
    # -gt = Greater Than (Plus grand que >)
    if [ "$GUESS" -lt "$SECRET" ]; then
        echo "C'est PLUS !"
    
    elif [ "$GUESS" -gt "$SECRET" ]; then
        echo "C'est MOINS !"
    
    else
        echo "🎉 BRAVO ! Tu as trouvé le nombre $SECRET !"
    fi

done
