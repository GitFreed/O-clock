# Challenge B408 04/02/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2026-02-04-10-51-35.png)

---

![conseils](/images/2026-02-04-10-52-20.png)

### Commandes importantes

- `tar` - Créer des archives
- `df`, `du` - Espace disque
- `free` - Mémoire
- `top`, `ps` - Processus
- `systemctl` - Gestion des services
- `useradd`, `groupadd` - Gestion des utilisateurs
- `find` - Recherche de fichiers
- `awk`, `sed`, `cut` - Manipulation de texte

### Documentation

- `man bash` - Manuel Bash complet
- `help` - Aide sur les commandes intégrées
- <https://fr.wikibooks.org/wiki/Programmation_Bash>

---

**Atelier B408** : <https://github.com/O-clock-Aldebaran/SB04E08-Atelier-Bash/blob/main/README.md>

**Les scripts créés seront tous disponibles dans ce [dossier](./Scripts/Bash/Atelier-B408/)**

**Fichier [README](./Scripts/Bash/Atelier-B408/README.md)**

---

## Partie 1 : Script de sauvegarde automatisée

![1](/images/2026-02-04-11-03-19.png)

### 1.1 & 1.2 Sauvegarde + Sécurité

```sh
#!/bin/bash

# --- CONFIGURATION ---
SOURCE_DIR=$1
DEST_DIR="/backup"
LOG_FILE="/var/log/backup.log"
DATE_FORMAT=$(date +"%Y%m%d_%H%M%S")
NOM_ARCHIVE="backup_${DATE_FORMAT}.tar.gz"
CHEMIN_FINAL="${DEST_DIR}/${NOM_ARCHIVE}"

# Fonction pour écrire dans le log ET à l'écran
log_msg() {
    local MESSAGE=$1
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $MESSAGE" | tee -a "$LOG_FILE"
}

# 1. Vérification Root (nécessaire pour écrire dans /backup et /var/log)
if [ "$(id -u)" -ne 0 ]; then
    echo "❌ Ce script doit être lancé avec sudo."
    exit 1
fi

# 2. Vérification argument
if [ -z "$SOURCE_DIR" ]; then
    echo "Usage: $0 <dossier_a_sauvegarder>"
    exit 1
fi

# 3. Vérification existence source
if [ ! -d "$SOURCE_DIR" ]; then
    log_msg "ERREUR: Le dossier source '$SOURCE_DIR' n'existe pas."
    exit 1
fi

# 4. Création destination si absente
if [ ! -d "$DEST_DIR" ]; then
    mkdir -p "$DEST_DIR"
    log_msg "Création du dossier $DEST_DIR."
fi

# 5. Vérification Espace Disque
# On estime la taille du dossier source (du -s)
TAILLE_SOURCE=$(du -s "$SOURCE_DIR" | cut -f1)
# On regarde l'espace dispo sur la destination (df)
ESPACE_DISPO=$(df "$DEST_DIR" | tail -1 | awk '{print $4}')

if [ "$TAILLE_SOURCE" -gt "$ESPACE_DISPO" ]; then
    log_msg "ERREUR: Pas assez d'espace disque (Besoin: ${TAILLE_SOURCE}K, Dispo: ${ESPACE_DISPO}K)"
    exit 1
fi

# 6. Création de l'archive
log_msg "Début de la sauvegarde de $SOURCE_DIR vers $CHEMIN_FINAL..."

# 2> /dev/null cache les erreurs mineures (fichiers modifiés pendant la lecture)
tar -czf "$CHEMIN_FINAL" "$SOURCE_DIR" 2> /dev/null

if [ $? -eq 0 ]; then
    TAILLE_ARCHIVE=$(du -h "$CHEMIN_FINAL" | cut -f1)
    log_msg "SUCCÈS: Sauvegarde terminée. Taille: $TAILLE_ARCHIVE"
else
    log_msg "ÉCHEC: Erreur lors de la création de l'archive tar."
    exit 1
fi
```

### 1.3 la Rotation

```sh
# --- 7. ROTATION DES SAUVEGARDES ---
log_msg "Vérification de la rotation (Max 7 fichiers)..."

# On liste les archives dans /backup, triées par temps (ls -t = plus récent en haut), on prend à partir du 8ème
# ls -tp : t=time, p=ajoute / aux dossiers (pour les filtrer avec grep -v /)
A_SUPPRIMER=$(ls -tp "$DEST_DIR" | grep -v / | tail -n +8)

if [ -n "$A_SUPPRIMER" ]; then
    cd "$DEST_DIR" # On se place dedans pour supprimer
    for f in $A_SUPPRIMER; do
        log_msg "ROTATION: Suppression de l'ancienne sauvegarde $f"
        rm "$f"
    done
else
    log_msg "Rotation non nécessaire (Moins de 7 sauvegardes)."
fi

echo "✅ Opération terminée."
```

### 1.4 le Test

![test1](/images/2026-02-04-11-53-18.png)

Si on crée plus de 7 backup, la plus ancienne est supprimée

![test1](/images/2026-02-04-11-55-24.png)

---

## Partie 2 : Moniteur de ressources système

![2](/images/2026-02-04-12-08-38.png)

```sh
#!/bin/bash

# --- 1. FONCTION COULEUR (C'est la partie "Intelligente") ---
# Cette fonction prend un nombre ($1) et affiche la couleur qui va avec
# Vert < 70% | Jaune 70-85% | Rouge > 85%
get_color() {
    local VALEUR=$1
    # On enlève les décimales pour comparer des entiers (Bash aime pas les virgules)
    # 1. tr ',' '.' : remplace virgule par point (2,2 -> 2.2)
    # 2. cut -d'.' -f1 : garde tout ce qu'il y a avant le point (2.2 -> 2)
    VALEUR=$(echo "$VALEUR" | tr ',' '.' | cut -d'.' -f1)

    # Sécurité : Si VALEUR est vide (erreur de lecture), on met 0
    if [ -z "$VALEUR" ]; then VALEUR=0; fi

    if [ "$VALEUR" -lt 70 ]; then
        echo -e "\033[0;32m" # Vert
    elif [ "$VALEUR" -lt 85 ]; then
        echo -e "\033[1;33m" # Jaune
    else
        echo -e "\033[0;31m" # Rouge
    fi
}
RESET='\033[0m' # Pour remettre la couleur normale

# --- 2. COLLECTE DES DONNÉES (Les Maths) ---
echo "Analyse du système en cours..."

# HOSTNAME & DATE
HOST=$(hostname)
DATE=$(date "+%Y-%m-%d %H:%M:%S")
DATE_LOG=$(date "+%Y%m%d") # Format pour le nom du fichier log

# UPTIME (Depuis quand est-il allumé ?)
UPTIME=$(uptime -p)

# CPU (Le plus dur à extraire proprement)
# top -bn1 : lance top une fois en mode batch
# grep "Cpu(s)" : prend la ligne CPU
# awk ... : additionne l'utilisateur ($2) et le système ($4) pour avoir le total utilisé
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}' | cut -d. -f1)

# RAM (Mémoire)
# free -m : affiche en Mo
TOTAL_RAM=$(free -m | grep Mem | awk '{print $2}')
USED_RAM=$(free -m | grep Mem | awk '{print $3}')
# Calcul du pourcentage : (Utilisé * 100) / Total
PERCENT_RAM=$(( USED_RAM * 100 / TOTAL_RAM ))

# NOMBRE DE PROCESSUS
PROCESS_COUNT=$(ps aux | wc -l)

# --- 3. PRÉPARATION DE L'AFFICHAGE ---
# On stocke tout l'affichage dans une fonction pour pouvoir l'utiliser
# soit à l'écran, soit dans un fichier plus tard.

generer_rapport() {
    echo "=========================================="
    echo "   MONITEUR SYSTÈME : $HOST"
    echo "   Date : $DATE"
    echo "=========================================="
    echo ""
    echo "🔹 [GÉNÉRAL]"
    echo "   Uptime    : $UPTIME"
    echo "   Processus : $PROCESS_COUNT en cours"
    echo ""
    
    # On appelle notre fonction couleur $(get_color $VAR) juste avant d'afficher la variable
    COLOR_CPU=$(get_color "$CPU_USAGE")
    echo -e "🔹 [CPU] Usage : ${COLOR_CPU}${CPU_USAGE}%${RESET}"

    COLOR_RAM=$(get_color "$PERCENT_RAM")
    echo -e "🔹 [RAM] Usage : ${COLOR_RAM}${USED_RAM}/${TOTAL_RAM} Mo (${PERCENT_RAM}%)${RESET}"
    
    echo ""
    echo "🔹 [DISQUES] (Utilisation > 80% en ROUGE)"
    # On lit df ligne par ligne pour colorier celles qui sont pleines
    # grep -v "Utilis" : Ignore la ligne d'en-tête qui contient le mot "Utilisé" (ou "Use" en anglais)
    df -h | grep -vE '^Filesystem|tmpfs|cdrom|loop|udev|Utilis|Use' | while read line; do
        
        # On récupère le pourcentage (souvent 5ème colonne)
        PERC=$(echo $line | awk '{print $5}' | tr -d '%')
        
        # Astuce : Parfois sous Linux FR, df met un espace insécable ou change de colonne.
        # Si PERC n'est pas un nombre, on force 0 pour éviter l'erreur.
        if ! [[ "$PERC" =~ ^[0-9]+$ ]]; then PERC=0; fi

        if [ "$PERC" -ge 85 ]; then
            echo -e "${RED}$line${RESET}" 
        else
            echo "$line"
        fi
    done

    echo ""
    echo "🔹 [TOP 5 PROCESSUS GOURMANDS]"
    echo "--- PAR CPU ---"
    ps -eo comm,%cpu --sort=-%cpu | head -n 6
    echo ""
    echo "--- PAR RAM ---"
    ps -eo comm,%mem --sort=-%mem | head -n 6
}

# --- 4. GESTION DU MODE RAPPORT ---

# 1. On affiche d'abord le rapport à l'écran
generer_rapport

echo ""
echo "----------------------------------------------------"

# 2. On propose la sauvegarde
# read -p : pose la question
read -p "📝 Voulez-vous sauvegarder ce rapport dans un fichier log ? (o/N) " REP

# Si la réponse est o ou O (Oui)
if [[ "$REP" =~ ^[oO]$ ]]; then
    
    # PETITE SÉCURITÉ : Vérifier qu'on est root (car /var/log est protégé)
    if [ "$(id -u)" -ne 0 ]; then
        echo -e "\033[0;31m❌ Erreur : Vous n'êtes pas root !\033[0m"
        echo "   Impossible d'écrire dans /var/log."
        echo "   Relancez le script avec : sudo $0"
    else
        FICHIER_LOG="/var/log/monitor_${DATE_LOG}.txt"
        
        echo "Sauvegarde en cours..."
        
        # On relance la fonction, on nettoie les couleurs (sed), et on écrit dans le fichier
        generer_rapport | sed 's/\x1b\[[0-9;]*m//g' > "$FICHIER_LOG"
        
        echo -e "\033[0;32m✅ Rapport sauvegardé avec succès : $FICHIER_LOG\033[0m"
    fi
else
    echo "Pas de sauvegarde. Au revoir !"
fi
```

![2](/images/2026-02-04-12-33-18.png)

Le Log créé

![log2](/images/2026-02-04-12-34-22.png)

---

## Partie 3 : Gestionnaire d'utilisateurs en masse

![3](/images/2026-02-04-12-35-04.png)

```sh
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
```

![3](/images/2026-02-04-12-40-21.png)

Le log

![log3](/images/2026-02-04-12-41-17.png)

La suppression

![3](/images/2026-02-04-12-49-52.png)

---

## Partie 4 : Nettoyeur de système automatique

![4](/images/2026-02-04-13-06-46.png)

```sh
#!/bin/bash

# --- CONFIGURATION ---
LOG_FILE="/var/log/cleanup.log"
DAYS_TMP=7
DAYS_LOG=30
DRY_RUN=true  # Par défaut, on ne supprime RIEN (Sécurité)

# Couleurs
VERT='\033[0;32m'
ROUGE='\033[0;31m'
JAUNE='\033[1;33m'
BLEU='\033[0;34m'
NC='\033[0m'

# 1. Vérification Root
if [ "$(id -u)" -ne 0 ]; then
    echo "❌ Ce script doit être lancé avec sudo."
    exit 1
fi

# 2. Gestion des Arguments (--force ou -f)
for arg in "$@"; do
    if [[ "$arg" == "--force" ]] || [[ "$arg" == "-f" ]]; then
        DRY_RUN=false
    fi
done

# Fonction de log centralisée
log_action() {
    local MSG=$1
    echo -e "$MSG"
    # On enlève les couleurs pour le fichier log
    echo "$MSG" | sed 's/\x1b\[[0-9;]*m//g' >> "$LOG_FILE"
}

# Fonction de nettoyage générique (C'est le cœur du script)
clean_dir() {
    local DIR=$1
    local PATTERN=$2
    local DAYS=$3
    local DESC=$4

    echo -e "${BLEU}--- Analyse : $DESC ---${NC}"
    
    # On cherche les fichiers correspondants
    # Si PATTERN est "*", on cherche tout, sinon on filtre par nom
    if [ "$PATTERN" == "*" ]; then
        FILES=$(find "$DIR" -type f -mtime +$DAYS 2>/dev/null)
    else
        FILES=$(find "$DIR" -type f -name "$PATTERN" -mtime +$DAYS 2>/dev/null)
    fi

    # On compte les fichiers trouvés
    COUNT=$(echo "$FILES" | wc -w)

    if [ -z "$FILES" ]; then
        log_action "✅ Rien à nettoyer dans $DESC."
        return
    fi

    # MODE SIMULATION (DRY-RUN)
    if [ "$DRY_RUN" = true ]; then
        echo -e "${JAUNE}[SIMULATION]${NC} Fichiers qui seraient supprimés ($COUNT) :"
        echo "$FILES" | head -n 5
        if [ "$COUNT" -gt 5 ]; then echo "... et $((COUNT - 5)) autres."; fi
    
    # MODE RÉEL (FORCE)
    else
        log_action "🗑️  Suppression de $COUNT fichiers dans $DESC..."
        
        # On lit la liste et on supprime
        echo "$FILES" | xargs rm -f
        log_action "${VERT}Nettoyage terminé pour $DESC.${NC}"
    fi
}

# --- DÉBUT DU SCRIPT ---

# Initialisation du log
echo "--- NETTOYAGE DU $(date) ---" >> "$LOG_FILE"

# Mesure de l'espace AVANT
SPACE_BEFORE=$(df / --output=avail | tail -1)

if [ "$DRY_RUN" = true ]; then
    echo -e "${JAUNE}⚠️  MODE SIMULATION (DRY-RUN) ACTIVÉ ⚠️${NC}"
    echo "Utilisez 'sudo $0 --force' pour exécuter réellement."
else
    echo -e "${ROUGE}🚨 MODE FORCE ACTIVÉ : SUPPRESSION RÉELLE ! 🚨${NC}"
    # Demande de confirmation ultime
    read -p "Êtes-vous sûr de vouloir continuer ? (o/N) " REP
    if [[ ! "$REP" =~ ^[oO]$ ]]; then
        echo "Annulé."
        exit 0
    fi
fi

echo ""

# 1. Nettoyage /tmp (> 7 jours)
clean_dir "/tmp" "*" "$DAYS_TMP" "Fichiers temporaires (/tmp)"

# 2. Nettoyage Logs compressés (> 30 jours)
clean_dir "/var/log" "*.gz" "$DAYS_LOG" "Vieux logs compressés (.gz)"

# 3. Cache APT (Paquets téléchargés)
echo -e "${BLEU}--- Analyse : Cache APT ---${NC}"
TAILLE_APT=$(du -sh /var/cache/apt/archives 2>/dev/null | cut -f1)

if [ "$DRY_RUN" = true ]; then
    echo -e "${JAUNE}[SIMULATION]${NC} 'apt-get clean' libérerait environ : $TAILLE_APT"
else
    log_action "Exécution de apt-get clean..."
    apt-get clean
    log_action "${VERT}Cache APT vidé ($TAILLE_APT libérés).${NC}"
fi

# 4. Corbeille Utilisateurs (Risqué mais demandé)
# On vide les dossiers .local/share/Trash de tous les users dans /home
echo -e "${BLEU}--- Analyse : Corbeilles Utilisateurs ---${NC}"
TRASH_DIRS=$(ls -d /home/*/.local/share/Trash/files 2>/dev/null)

if [ -n "$TRASH_DIRS" ]; then
    if [ "$DRY_RUN" = true ]; then
        echo -e "${JAUNE}[SIMULATION]${NC} Contenu des corbeilles détecté :"
        du -sh $TRASH_DIRS 2>/dev/null
    else
        log_action "Vidage des corbeilles..."
        rm -rf /home/*/.local/share/Trash/files/* 2>/dev/null
        rm -rf /home/*/.local/share/Trash/info/* 2>/dev/null
        log_action "${VERT}Corbeilles vidées.${NC}"
    fi
else
    echo "✅ Corbeilles déjà vides ou inaccessibles."
fi

# --- RAPPORT FINAL ---
echo ""
echo "------------------------------------------------"

# Mesure de l'espace APRÈS
SPACE_AFTER=$(df / --output=avail | tail -1)
GAIN=$((SPACE_AFTER - SPACE_BEFORE))

# Conversion en Mo pour être lisible
GAIN_MO=$((GAIN / 1024))

if [ "$DRY_RUN" = true ]; then
    echo "Espace disque actuel : $((SPACE_BEFORE / 1024)) Mo"
    echo "Ceci était une simulation. Rien n'a été effacé."
else
    echo -e "🎉 TERMINÉ ! Espace libéré : ${VERT}${GAIN_MO} Mo${NC}"
    echo "📝 Détails dans : $LOG_FILE"
fi
```

Simulation

![4](/images/2026-02-04-13-29-22.png)

Suppression

![4](/images/2026-02-04-13-29-50.png)

Le Log

![4log](/images/2026-02-04-13-36-45.png)

---

## Partie 5 : Vérificateur de santé des services

![5](/images/2026-02-04-12-50-50.png)

```sh
#!/bin/bash

# --- CONFIGURATION ---
CONFIG_FILE="services.conf"
JSON_REPORT="services_report.json"
AUTO_RESTART=true  # Met à "false" si tu ne veux pas qu'il touche à tes services

# Couleurs
VERT='\033[0;32m'
ROUGE='\033[0;31m'
JAUNE='\033[1;33m'
NC='\033[0m'

# Vérification Root (nécessaire pour redémarrer les services)
if [ "$(id -u)" -ne 0 ]; then
    echo "❌ Ce script doit être lancé avec sudo."
    exit 1
fi

if [ ! -f "$CONFIG_FILE" ]; then
    echo "❌ Erreur : Fichier de configuration $CONFIG_FILE introuvable."
    exit 1
fi

# --- FONCTION PRINCIPALE ---
check_services() {
    # On commence le tableau JSON
    echo "[" > "$JSON_REPORT"
    
    TOTAL=0
    ACTIFS=0
    INACTIFS=0

    echo -e "--- 🏥 ÉTAT DES SERVICES ($(date '+%H:%M:%S')) ---"
    printf "%-15s | %-15s | %-15s | %-10s\n" "SERVICE" "ÉTAT" "DÉMARRAGE" "ACTION"
    echo "---------------------------------------------------------------"

    # Lecture du fichier ligne par ligne
    while read -r SERVICE || [ -n "$SERVICE" ]; do
        if [ -z "$SERVICE" ]; then continue; fi
        ((TOTAL++))

        # 1. Récupération des états (active/inactive et enabled/disabled)
        STATUS=$(systemctl is-active "$SERVICE" 2>/dev/null)
        ENABLED=$(systemctl is-enabled "$SERVICE" 2>/dev/null)

        # 2. Analyse et Actions
        if [ "$STATUS" == "active" ]; then
            ((ACTIFS++))
            COLOR_STATUS=$VERT
            MSG_ACTION="-"
        else
            ((INACTIFS++))
            COLOR_STATUS=$ROUGE
            STATUS="inactive" # On normalise le texte
            
            # 3. AUTO-RESTART (Le médecin tente une réanimation)
            if [ "$AUTO_RESTART" = true ]; then
                # On essaie de redémarrer silencieusement
                systemctl restart "$SERVICE" 2>/dev/null
                
                # On vérifie immédiatement si ça a marché
                if systemctl is-active "$SERVICE" -q; then
                    MSG_ACTION="${VERT}Redémarré !${NC}"
                    STATUS="recovered"
                else
                    MSG_ACTION="${ROUGE}Échec${NC}"
                fi
            else
                MSG_ACTION="${JAUNE}Alerte !${NC}"
            fi
        fi

        # Affichage Ligne
        printf "%-15s | ${COLOR_STATUS}%-15s${NC} | %-15s | %b\n" "$SERVICE" "$STATUS" "$ENABLED" "$MSG_ACTION"

        # Ajout au rapport JSON (Construction manuelle ligne par ligne)
        echo "  { \"service\": \"$SERVICE\", \"status\": \"$STATUS\", \"enabled\": \"$ENABLED\" }," >> "$JSON_REPORT"

    done < "$CONFIG_FILE"

    echo "---------------------------------------------------------------"
    echo -e "RÉSUMÉ : ${VERT}$ACTIFS actifs${NC} / ${ROUGE}$INACTIFS inactifs${NC}"
    
    # Nettoyage JSON : on retire la virgule finale et on ferme le tableau
    sed -i '$ s/,$//' "$JSON_REPORT"
    echo "]" >> "$JSON_REPORT"
}

# --- GESTION DU MODE MONITORING (--watch) ---
if [ "$1" == "--watch" ]; then
    echo "👀 Mode Monitoring activé (Ctrl+C pour quitter)"
    sleep 1
    
    # trap intercepte le Ctrl+C pour quitter proprement
    trap "echo ' Arrêt du monitoring.'; exit 0" SIGINT

    while true; do
        clear
        check_services
        echo ""
        echo "Prochaine vérification dans 30s..."
        sleep 30
    done
else
    # Mode normal (une seule fois)
    check_services
    echo "📄 Rapport JSON généré : $JSON_REPORT"
fi
```

![5](/images/2026-02-04-13-50-27.png)

En mode --watch et en stoppant cron à côté

![5](/images/2026-02-04-13-51-39.png)

Le Log JSON

![5](/images/2026-02-04-13-57-37.png)

---

## Partie 6 : Outil centralisé de gestion

![6](/images/2026-02-04-14-07-16.png)

```sh
#!/bin/bash

# --- CONFIGURATION ---
VERSION="1.0"
AUTEUR="Freed (SysAdmin)"
LOG_FILE="/var/log/sysadmin-tools.log"
SCRIPTS=("backup.sh" "monitor.sh" "create-users.sh" "cleanup.sh" "check-services.sh")

# Couleurs
CYAN='\033[0;36m'
VERT='\033[0;32m'
ROUGE='\033[0;31m'
JAUNE='\033[1;33m'
NC='\033[0m'

# 1. VÉRIFICATION ROOT (Pour que tout fonctionne sans mot de passe)
if [ "$(id -u)" -ne 0 ]; then
    echo -e "${ROUGE}❌ Lancez ce menu avec sudo pour avoir tous les droits !${NC}"
    exit 1
fi

# 2. VÉRIFICATION DE LA PRÉSENCE DES SCRIPTS
echo "🔍 Vérification des outils..."
for script in "${SCRIPTS[@]}"; do
    if [ ! -f "./$script" ]; then
        echo -e "${ROUGE}❌ Erreur : Le script $script est manquant !${NC}"
        exit 1
    fi
    # On s'assure qu'ils sont exécutables
    chmod +x "./$script"
done

# Fonction de log
log_usage() {
    local ACTION=$1
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] USER=$SUDO_USER ACTION=$ACTION" >> "$LOG_FILE"
}

# Fonction pour attendre avant de revenir au menu
pause() {
    echo ""
    read -p "Appuyez sur [Entrée] pour revenir au menu..."
}

# --- BOUCLE PRINCIPALE (MENU) ---
while true; do
    clear
    echo -e "${CYAN}==============================================${NC}"
    echo -e "${CYAN}   🚀 SYSADMIN TOOLBOX v$VERSION - $AUTEUR    ${NC}"
    echo -e "${CYAN}==============================================${NC}"
    echo "1. 💾 Sauvegarde de répertoire (Backup)"
    echo "2. 📊 Monitoring Système (Ressources)"
    echo "3. 👥 Création d'utilisateurs (Mass import)"
    echo "4. 🧹 Nettoyage Système (Cleanup)"
    echo "5. 🏥 Santé des Services (Check)"
    echo "6. ❓ Aide / Documentation"
    echo "7. 🚪 Quitter"
    echo -e "${CYAN}==============================================${NC}"
    
    read -p "Votre choix : " CHOIX

    case $CHOIX in
        1)
            echo -e "\n--- SAUVEGARDE ---"
            read -p "Chemin du dossier à sauvegarder : " DOSSIER
            log_usage "Lancement Backup sur $DOSSIER"
            ./backup.sh "$DOSSIER"
            pause
            ;;
        2)
            echo -e "\n--- MONITORING ---"
            read -p "Générer un rapport fichier ? (o/N) : " REP
            log_usage "Lancement Monitoring"
            if [[ "$REP" =~ ^[oO]$ ]]; then
                ./monitor.sh report
            else
                ./monitor.sh
            fi
            pause
            ;;
        3)
            echo -e "\n--- UTILISATEURS ---"
            read -p "Fichier CSV (ex: users.csv) : " CSV
            read -p "Mode Suppression ? (o/N) : " DEL
            
            ARGS="$CSV"
            if [[ "$DEL" =~ ^[oO]$ ]]; then ARGS="$CSV --delete"; fi
            
            log_usage "Gestion Utilisateurs ($ARGS)"
            ./create-users.sh $ARGS
            pause
            ;;
        4)
            echo -e "\n--- NETTOYAGE ---"
            read -p "⚠️  Mode FORCE (suppression réelle) ? (o/N) : " FORCE
            if [[ "$FORCE" =~ ^[oO]$ ]]; then
                log_usage "Nettoyage FORCE"
                ./cleanup.sh --force
            else
                log_usage "Nettoyage Simulation"
                ./cleanup.sh
            fi
            pause
            ;;
        5)
            echo -e "\n--- SERVICES ---"
            read -p "Mode surveillance continue (Watch) ? (o/N) : " WATCH
            if [[ "$WATCH" =~ ^[oO]$ ]]; then
                log_usage "Check Services (Watch Mode)"
                ./check-services.sh --watch
            else
                log_usage "Check Services (Simple)"
                ./check-services.sh
            fi
            pause
            ;;
        6)
            clear
            echo -e "${JAUNE}--- 📚 DOCUMENTATION ---${NC}"
            echo "1. backup.sh : Crée une archive .tar.gz dans /backup avec rotation (7 max)."
            echo "2. monitor.sh : Affiche CPU/RAM/Disque et alerte si surcharge."
            echo "3. create-users.sh : Crée/Supprime des users depuis un CSV et génère des mots de passe."
            echo "4. cleanup.sh : Vide /tmp, cache APT et vieux logs. (Utiliser --force)."
            echo "5. check-services.sh : Vérifie SSH, Cron, etc. et tente de les redémarrer."
            pause
            ;;
        7)
            echo "Au revoir !"
            exit 0
            ;;
        *)
            echo "❌ Choix invalide."
            sleep 1
            ;;
    esac
done
```

![6](/images/2026-02-04-14-05-59.png)
