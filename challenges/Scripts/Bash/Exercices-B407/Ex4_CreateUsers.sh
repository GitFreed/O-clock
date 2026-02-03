#!/bin/bash

# 1. Sécurité : Vérifier que l'on est root (Sudo)
# id -u renvoie l'ID de l'utilisateur. 0 est toujours l'ID de root.
if [ "$(id -u)" -ne 0 ]; then
    echo "❌ Erreur : Ce script doit être lancé avec sudo !"
    exit 1
fi

FICHIER_CSV=$1

# 2. Vérifier si on a bien fourni un fichier en argument
if [ -z "$FICHIER_CSV" ]; then
    echo "Usage : sudo $0 <fichier_utilisateurs.csv>"
    exit 1
fi

# 3. Boucle de lecture du fichier CSV
# IFS=',' définit le séparateur (utile si ton csv est "nom,prenom"). Ici par défaut c'est la ligne.
# read -r permet de lire ligne par ligne.
while IFS=, read -r USERNAME; do

    # Nettoyage : On enlève les espaces vides éventuels autour du nom
    USERNAME=$(echo "$USERNAME" | xargs)

    # On saute les lignes vides
    if [ -z "$USERNAME" ]; then
        continue
    fi

    # 4. Vérifier si l'utilisateur existe déjà
    # id "$User" renvoie vrai si l'user existe, faux sinon.
    # &>/dev/null permet de cacher la sortie technique (on veut juste le code de retour)
    if id "$USERNAME" &>/dev/null; then
        echo "⚠️  L'utilisateur '$USERNAME' existe déjà. On passe."
    else
        # 5. Générer un mot de passe aléatoire
        # openssl génère des octets aléatoires, base64 les rend lisibles
        PASSWORD=$(openssl rand -base64 12)

        # 6. Création de l'utilisateur
        # -m : Créer le répertoire personnel (/home/utilisateur)
        # -s : Définir le shell par défaut (/bin/bash)
        useradd -m -s /bin/bash "$USERNAME"

        # 7. Attribution du mot de passe
        # L'option chpasswd permet de changer le mot de passe en une ligne sans interaction
        echo "$USERNAME:$PASSWORD" | chpasswd

        # Optionnel : Forcer l'utilisateur à changer son mdp à la première connexion
        passwd -e "$USERNAME" > /dev/null

        echo "✅ Utilisateur '$USERNAME' créé."
        echo "   📂 Home : /home/$USERNAME"
        echo "   🔑 Mot de passe : $PASSWORD"
        echo "--------------------------------------"
    fi

done < "$FICHIER_CSV"
