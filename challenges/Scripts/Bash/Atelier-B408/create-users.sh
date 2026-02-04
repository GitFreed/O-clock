#!/bin/bash

# --- CONFIGURATION ---
FICHIER_CSV=$1
MODE=$2  # Le 2ème argument servira pour l'option --delete
LOG_FILE="/var/log/user-creation.log"
OUTPUT_PASSWORDS="users_created.txt"

# 1. Vérification Root (On touche aux utilisateurs système !)
if [ "$(id -u)" -ne 0 ]; then
    echo "❌ Erreur : Ce script doit être lancé avec sudo."
    exit 1
fi

# 2. Vérification CSV
if [ -z "$FICHIER_CSV" ] || [ ! -f "$FICHIER_CSV" ]; then
    echo "Usage : sudo $0 <fichier.csv> [--delete]"
    exit 1
fi

# Fonction de Log pour écrire partout à la fois
log_msg() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Si le fichier n'existe pas encore, on le crée avec l'en-tête.
# Sinon, on ne fait rien (on gardera les anciens et on ajoutera à la suite)
if [ "$MODE" != "--delete" ] && [ ! -f "$OUTPUT_PASSWORDS" ]; then
    echo "--- LISTE DES UTILISATEURS CRÉÉS ---" > "$OUTPUT_PASSWORDS"
fi

# 3. LECTURE DU CSV (Ligne par ligne)
# IFS=, définit la virgule comme séparateur
# tr -d '\r' supprime les retours à la ligne Windows (au cas où le CSV vient d'Excel)
while IFS=, read -r PRENOM NOM DEPARTEMENT FONCTION; do
    
    # Ignorer les lignes vides ou mal formées
    if [ -z "$PRENOM" ] || [ -z "$NOM" ]; then continue; fi

    # --- NETTOYAGE DES DONNÉES ---
    # On met tout en minuscules pour le login et les groupes
    # ${VAR,,} est un raccourci Bash pour mettre en minuscule (lowercase)
    PRENOM_LOWER=${PRENOM,,}
    NOM_LOWER=${NOM,,}
    DEPT_LOWER=${DEPARTEMENT,,}

    # GÉNÉRATION DU LOGIN : 1ère lettre prénom + nom
    # ${VAR:0:1} prend le 1er caractère
    LOGIN="${PRENOM_LOWER:0:1}${NOM_LOWER}"

    # --- MODE SUPPRESSION ---
    if [ "$MODE" == "--delete" ]; then
        # Vérifie si l'user existe
        if id "$LOGIN" &>/dev/null; then
            # On ajoute < /dev/tty à la fin pour forcer la lecture du clavier
            read -p "🗑️  Supprimer l'utilisateur $LOGIN ($PRENOM $NOM) ? (o/N) " REP < /dev/tty
            if [[ "$REP" =~ ^[oO]$ ]]; then
                userdel -r "$LOGIN" 2>/dev/null
                log_msg "SUPPRESSION: Utilisateur $LOGIN supprimé."
            else
                echo "Ignoré."
            fi
        else
            echo "L'utilisateur $LOGIN n'existe pas."
        fi
        continue # On passe à la ligne suivante du CSV
    fi

    # --- MODE CRÉATION ---

    # 1. Gestion du Groupe (Département)
    # getent group vérifie si le groupe existe
    if ! getent group "$DEPT_LOWER" >/dev/null; then
        groupadd "$DEPT_LOWER"
        log_msg "GROUPE: Création du groupe '$DEPT_LOWER'."
    fi

    # 2. Vérification existence User
    if id "$LOGIN" &>/dev/null; then
        log_msg "ALERTE: L'utilisateur $LOGIN existe déjà. Ignoré."
    else
        # 3. Création de l'utilisateur
        # -m : Crée le /home
        # -g : Groupe principal
        # -c : Commentaire (Nom complet + Fonction)
        # -s : Shell (/bin/bash)
        useradd -m -g "$DEPT_LOWER" -c "$PRENOM $NOM - $FONCTION" -s /bin/bash "$LOGIN"

        if [ $? -eq 0 ]; then
            # 4. Génération Mot de passe
            PASSWORD=$(openssl rand -base64 12)
            echo "$LOGIN:$PASSWORD" | chpasswd
            
            # Forcer le changement au 1er log (optionnel mais recommandé)
            passwd -e "$LOGIN" >/dev/null

            log_msg "SUCCÈS: Utilisateur $LOGIN créé (Groupe: $DEPT_LOWER)."
            
            # Sauvegarde dans le fichier récap
            echo "Login: $LOGIN | Pass: $PASSWORD | Role: $FONCTION" >> "$OUTPUT_PASSWORDS"
        else
            log_msg "ERREUR: Impossible de créer $LOGIN."
        fi
    fi

done < <(tr -d '\r' < "$FICHIER_CSV") # Petite astuce pour nettoyer le fichier CSV à la volée

if [ "$MODE" != "--delete" ]; then
    echo ""
    echo "✅ Terminé ! Les mots de passe sont dans : $OUTPUT_PASSWORDS"
    echo "📜 Les logs sont dans : $LOG_FILE"
fi
