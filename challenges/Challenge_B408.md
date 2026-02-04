# Challenge B408 04/02/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2026-02-04-10-51-35.png)

**Atelier B408** : <https://github.com/O-clock-Aldebaran/SB04E08-Atelier-Bash/blob/main/README.mdD>

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

Les scripts créés seront tous disponibles dans ce [dossier](./Scripts/Bash/Atelier-B408/)

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
    VALEUR=${VALEUR%.*} 

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
    df -h | grep -vE '^Filesystem|tmpfs|cdrom|loop|udev' | while read line; do
        PERC=$(echo $line | awk '{print $5}' | tr -d '%')
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

# --- 4. GESTION DU MODE RAPPORT OU ÉCRAN ---

# Si l'argument $1 est "report", on envoie tout dans un fichier
if [ "$1" == "report" ]; then
    FICHIER_LOG="/var/log/monitor_${DATE_LOG}.txt"
    
    # On doit enlever les codes couleurs pour le fichier texte (sinon c'est illisible)
    # sed 's/\x1b\[[0-9;]*m//g' est une formule magique pour nettoyer les couleurs
    generer_rapport | sed 's/\x1b\[[0-9;]*m//g' > "$FICHIER_LOG"
    
    echo "✅ Rapport sauvegardé dans : $FICHIER_LOG"
else
    # Sinon, on affiche juste à l'écran avec les couleurs
    generer_rapport
fi
```
