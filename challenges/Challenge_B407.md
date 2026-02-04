# Challenge B407 03/02/2026

## Pitch de l’exercice 🧑‍🏫

Nous allons faire une série d'exercices pour créer une suite d'outils Admin en Bash

Challenge B407 : <https://github.com/O-clock-Aldebaran/SB04E07-Bash-GitFreed>

[Cours B407.](/RESUME.md#-b407-scripting--bash)

> 📚 **Ressources** :
>
> - Guide Bash : <https://fr.wikibooks.org/wiki/Programmation_Bash>
> - Conditions : <https://buzut.net/maitriser-les-conditions-en-bash/>
> - Explainshell : <https://explainshell.com/> (pour comprendre les commandes)
> - ShellCheck : <https://www.shellcheck.net/> (vérifier la qualité du code)

![ressources](/images/2026-02-03-15-46-32.png)

---

Les scripts créés seront tous disponibles dans ce [dossier](/challenges/Scripts/Bash/Exercices-B407/)

---

## Exercice 1 - Copie

![ex1](/images/2026-02-03-14-09-15.png)

```sh
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
```

Toujours penser à `chmod +x` notre script pour le rendre exécutable

![ex1](/images/2026-02-03-14-09-48.png)

---

## Exercice 2 - Sauvegarde

![ex2](/images/2026-02-03-14-11-39.png)

```sh
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
```

![ex2](/images/2026-02-03-14-40-45.png)

---

## Exercice 3 - Jeu Plus ou Moins

![ex3](/images/2026-02-03-14-43-35.png)

On reprend le principe du jeu déjà fait en batch, python, powershell, avec les boucles

```sh
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
    # -p permet d'afficher le message sur la même ligne comme Read-Host "message" en powershell
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
```

![ex3](/images/2026-02-03-14-56-27.png)

---

## Exercice 4 - Ajout Utilisateurs

![ex4](/images/2026-02-03-15-00-15.png)

```sh
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
```

On va créer un fichier CSV `utilisateurs.csv` pour tester avec 3 utilisateurs : alice, bob, charlie.

![ex4](/images/2026-02-03-15-12-46.png)

---

## Exercice 5 - Monitoring

![ex5](/images/2026-02-03-15-16-50.png)

```sh
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
```

On va créer un fichier de logs `access.log` pour tester

![ex5](/images/2026-02-03-15-24-09.png)

### Exercice 5 - Bonus

La commande `lastb` liste les mauvaises connexions. Ce n'est pas un fichier texte classique, c'est une commande binaire qui lit `/var/log/btmp`

```sh
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
```

![ex5b](/images/2026-02-03-15-27-26.png)

---

## Exercice 6 - Gestionnaire de services

![ex6](/images/2026-02-03-23-34-26.png)

```sh
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
```

![ex6](/images/2026-02-03-23-49-12.png)

## Exercice 7 - Nettoyeur de logs

![ex7](/images/2026-02-03-23-49-49.png)

```sh
#!/bin/bash

# --- CONFIGURATION ---
JOURS=$1
LOG_DIR="/var/log"
OP_LOG="nettoyage.log"

# 1. Vérification : Root
if [ "$(id -u)" -ne 0 ]; then
    echo "❌ Erreur : Il faut être root pour nettoyer /var/log (sudo)."
    exit 1
fi

# 2. Vérification : Argument nombre de jours
# La regex ^[0-9]+$ vérifie que c'est bien un nombre entier
if [[ -z "$JOURS" ]] || ! [[ "$JOURS" =~ ^[0-9]+$ ]]; then
    echo "Usage : sudo $0 <nombre_de_jours>"
    echo "Exemple : sudo $0 7 (Supprime les logs vieux de plus de 7 jours)"
    exit 1
fi

echo "🔍 Recherche des fichiers .log et .gz de plus de $JOURS jours dans $LOG_DIR..."

# 3. RECHERCHE DES FICHIERS
# find cherche dans /var/log
# -type f : seulement les fichiers (pas les dossiers)
# \( ... \) : groupe les conditions de nom (log OU gz)
# -mtime +$JOURS : modifiés il y a PLUS de X jours
LISTE_FICHIERS=$(find "$LOG_DIR" -type f \( -name "*.log" -o -name "*.gz" \) -mtime +$JOURS 2>/dev/null)

# Si la liste est vide, on s'arrête
if [ -z "$LISTE_FICHIERS" ]; then
    echo "✅ Aucun vieux fichier à supprimer."
    exit 0
fi

# 4. CALCUL DE LA TAILLE ET AFFICHAGE
# On passe la liste à 'du' (Disk Usage) pour voir la taille
# -c : affiche le total à la fin
# -h : format humain (Mo, Go...)
echo ""
echo "--- FICHIERS À SUPPRIMER ---"
echo "$LISTE_FICHIERS" | xargs -d '\n' du -ch
echo "----------------------------"

# On récupère juste la dernière ligne (le total) pour l'affichage final
TOTAL_SIZE=$(echo "$LISTE_FICHIERS" | xargs -d '\n' du -ch | tail -n 1 | cut -f1)

# 5. DEMANDE DE CONFIRMATION
read -p "⚠️  ATTENTION : Voulez-vous supprimer ces fichiers ? (y/N) " REP

if [[ "$REP" == "y" || "$REP" == "Y" ]]; then
    echo "🗑️  Suppression en cours..."
    
    # 6. SUPPRESSION ET JOURNALISATION
    echo "--- Nettoyage du $(date) ---" >> "$OP_LOG"
    
    # On lit la liste ligne par ligne pour supprimer et logger
    while IFS= read -r file; do
        rm "$file"
        echo "Supprimé : $file" >> "$OP_LOG"
    done <<< "$LISTE_FICHIERS"

    echo "✅ Nettoyage terminé !"
    echo "💾 Espace libéré : $TOTAL_SIZE"
    echo "📝 Détails enregistrés dans $OP_LOG"
else
    echo "❌ Opération annulée."
fi
```

On va choisir de clean les logs plus vieux que 7 jours

![ex7](/images/2026-02-03-23-52-58.png)

![ex7](/images/2026-02-03-23-53-25.png)

## Exercice 8 - Analyseur d'espace disque

![ex8](/images/2026-02-03-23-54-13.png)

```sh
#!/bin/bash

# --- CONFIGURATION ---
RAPPORT="rapport_disque.txt"
SEUIL_ALERTE=80

# Couleurs
ROUGE='\033[0;31m'
VERT='\033[0;32m'
JAUNE='\033[1;33m'
NC='\033[0m' # No Color

# Vérification Root (Pour pouvoir lire tous les dossiers de /home)
if [ "$(id -u)" -ne 0 ]; then
    echo "❌ Il faut être root pour scanner tout /home (sudo)."
    exit 1
fi

clear
echo -e "${JAUNE}=== 💾 ANALYSE DE L'ESPACE DISQUE ===${NC}"
echo ""

# --- PARTIE 1 : LES PARTITIONS (df) ---
echo -e "${JAUNE}1. État des partitions :${NC}"
printf "%-20s %-10s %-10s %-10s %-6s %-15s\n" "Système" "Taille" "Utilisé" "Dispo" "Uti%" "Monté sur"
echo "---------------------------------------------------------------------------"

# On lit la sortie de df -h ligne par ligne (en ignorant les loop/tmpfs pour y voir clair)
# grep -vE permet d'exclure les systèmes de fichiers virtuels "inutiles" (loop, tmpfs, udev)
df -h | grep -vE '^Filesystem|tmpfs|cdrom|loop|udev' | while read line; do
    
    # On extrait le pourcentage (5ème colonne) et on enlève le signe %
    PERCENT=$(echo $line | awk '{print $5}' | tr -d '%')
    
    # Condition de couleur
    if [[ "$PERCENT" =~ ^[0-9]+$ ]] && [ "$PERCENT" -ge $SEUIL_ALERTE ]; then
        # Si > 80%, on affiche toute la ligne en ROUGE
        echo -e "${ROUGE}$line${NC}"
    else
        # Sinon en VERT (ou normal)
        echo -e "${VERT}$line${NC}"
    fi
done

echo ""
echo "---------------------------------------------------------------------------"

# --- PARTIE 2 : LES GROS DOSSIERS (du) ---
echo -e "${JAUNE}2. Top 10 des plus gros dossiers dans /home :${NC}"
echo "(Calcul en cours... patience)"
echo ""

# du -h : taille lisible (Ko, Mo, Go)
# --max-depth=2 : on ne descend pas trop profond pour garder ça lisible
# 2>/dev/null : on cache les erreurs "Permission denied"
# sort -rh : trier (sort) en inverse (r) et en lisant les unités humaines (h)
# head -n 10 : garder les 10 premiers

LISTE_GROS=$(du -h /home 2>/dev/null | sort -rh | head -n 10)
echo "$LISTE_GROS"

echo ""
echo "---------------------------------------------------------------------------"

# --- PARTIE 3 : EXPORT ---
read -p "Voulez-vous exporter ce rapport dans '$RAPPORT' ? (o/N) " REP

if [[ "$REP" == "o" || "$REP" == "O" ]]; then
    echo "Création du rapport..."
    {
        echo "=== RAPPORT DISQUE $(date) ==="
        echo ""
        echo "[PARTITIONS]"
        df -h | grep -vE '^Filesystem|tmpfs|cdrom|loop|udev'
        echo ""
        echo "[TOP 10 HOME]"
        # On doit relancer la commande pour l'écrire dans le fichier
        du -h /home 2>/dev/null | sort -rh | head -n 10
    } > "$RAPPORT"
    
    echo "✅ Rapport sauvegardé dans $RAPPORT"
else
    echo "Pas d'export. Fin du script."
fi
```

![ex8](/images/2026-02-03-23-56-55.png)

Le rapport

![ex8](/images/2026-02-03-23-57-11.png)

## Exercice 9 - Vérificateur de connexion réseau

![ex9](/images/2026-02-03-23-59-30.png)

```sh
#!/bin/bash

# --- CONFIGURATION ---
# Liste des cibles (On peut mettre des IP ou des noms de domaine)
SERVEURS=("google.com" "github.com" "cloudflare.com" "stackoverflow.com" "freedexplore.com" "introuvable.bidon")
RAPPORT="resultats_reseau.txt"

# Couleurs pour faire joli
VERT='\033[0;32m'
ROUGE='\033[0;31m'
JAUNE='\033[1;33m'
NC='\033[0m' # No Color

# Initialisation du fichier de rapport (On écrase l'ancien)
echo "--- RAPPORT RÉSEAU $(date) ---" > "$RAPPORT"
printf "%-20s | %-12s | %-10s\n" "SERVEUR" "ÉTAT" "LATENCE" >> "$RAPPORT"

# Compteurs
TOTAL=${#SERVEURS[@]}
SUCCESS=0

clear
echo -e "${JAUNE}=== 📡 TEST DE CONNECTIVITÉ ===${NC}"
echo "--------------------------------------------------"
printf "%-20s | %-12s | %-10s\n" "SERVEUR" "ÉTAT" "LATENCE"
echo "--------------------------------------------------"

# Boucle sur chaque serveur
for s in "${SERVEURS[@]}"; do
    
    # --- LE PING ---
    # -c 1 : Envoie UN SEUL paquet (sinon ping ne s'arrête jamais sous Linux)
    # -W 1 : Attend MAX 1 seconde la réponse (W = Wait)
    # 2>&1 : Redirige les erreurs vers la sortie standard pour tout traiter
    RESULTAT=$(ping -c 1 -W 1 "$s" 2>&1)

    # Vérification du code de retour ($? est égal à 0 si ça a marché)
    if [ $? -eq 0 ]; then
        
        # Extraction de la latence (le temps en ms)
        # On cherche "time=" et on coupe ce qui dépasse
        TIME=$(echo "$RESULTAT" | grep "time=" | awk -F 'time=' '{print $2}' | awk '{print $1}')
        
        # Indicateur de qualité (Couleur selon la vitesse)
        # On enlève les décimales pour comparer des nombres entiers avec Bash
        VAL_ENTIERE=$(echo "$TIME" | cut -d. -f1)
        
        if [ "$VAL_ENTIERE" -lt 50 ]; then
            COULEUR_LAT=$VERT  # Super rapide
        elif [ "$VAL_ENTIERE" -lt 150 ]; then
            COULEUR_LAT=$JAUNE # Moyen
        else
            COULEUR_LAT=$ROUGE # Lent
        fi

        # Affichage Écran
        printf "%-20s | ${VERT}%-12s${NC} | ${COULEUR_LAT}%-8s ms${NC}\n" "$s" "EN LIGNE" "$TIME"
        
        # Écriture Fichier (Sans couleurs)
        printf "%-20s | %-12s | %-8s ms\n" "$s" "EN LIGNE" "$TIME" >> "$RAPPORT"
        
        ((SUCCESS++)) # On incrémente le compteur de succès
        
    else
        # Si le ping a échoué
        printf "%-20s | ${ROUGE}%-12s${NC} | %-10s\n" "$s" "HORS LIGNE" "-"
        printf "%-20s | %-12s | %-10s\n" "$s" "HORS LIGNE" "-" >> "$RAPPORT"
    fi
done

echo "--------------------------------------------------"
echo ""
echo -e "RÉSUMÉ : ${VERT}$SUCCESS${NC} / $TOTAL serveurs accessibles."
echo "📄 Rapport complet sauvegardé dans : $RAPPORT"

# Ajout du résumé dans le fichier texte
echo "" >> "$RAPPORT"
echo "RÉSUMÉ : $SUCCESS / $TOTAL serveurs accessibles." >> "$RAPPORT"
```

![ex9](/images/2026-02-04-00-04-02.png)

## Exercice 10 - Installateur de paquets

![ex10](/images/2026-02-04-00-04-43.png)

```sh
#!/bin/bash

# --- CONFIGURATION ---
LISTE_PAQUETS=$1
RAPPORT="rapport_installation.txt"

# Couleurs
VERT='\033[0;32m'
ROUGE='\033[0;31m'
JAUNE='\033[1;33m'
BLEU='\033[0;36m'
NC='\033[0m'

# 1. Vérification Root (Obligatoire pour apt install)
if [ "$(id -u)" -ne 0 ]; then
    echo -e "${ROUGE}❌ Erreur : Lance ce script avec sudo !${NC}"
    exit 1
fi

# 2. Vérification du fichier liste
if [ -z "$LISTE_PAQUETS" ] || [ ! -f "$LISTE_PAQUETS" ]; then
    echo "Usage : sudo $0 <fichier_liste.txt>"
    exit 1
fi

# Initialisation
# wc -l compte les lignes. < permet de ne pas afficher le nom du fichier.
TOTAL=$(wc -l < "$LISTE_PAQUETS")
ACTUEL=0
SUCCES=0
ERREURS=0

# On écrase le vieux rapport
echo "--- RAPPORT D'INSTALLATION $(date) ---" > "$RAPPORT"

clear
echo -e "${BLEU}=== 📦 AUTOMATISATION D'INSTALLATION ===${NC}"
echo "Lecture de la liste : $LISTE_PAQUETS ($TOTAL paquets trouvés)"
echo ""

# 3. BOUCLE DE LECTURE
while IFS= read -r PAQUET; do
    # On ignore les lignes vides
    if [ -z "$PAQUET" ]; then continue; fi
    
    ((ACTUEL++))
    
    # Affichage de la progression [1/5]
    echo -ne "${BLEU}[$ACTUEL/$TOTAL]${NC} Vérification de '${JAUNE}$PAQUET${NC}'... "

    # 4. VÉRIFICATION (dpkg -s)
    # &> /dev/null cache la sortie (on veut juste savoir si ça réussit ou pas)
    if dpkg -s "$PAQUET" &> /dev/null; then
        echo -e "${VERT}✅ Déjà installé.${NC}"
        echo "$PAQUET : DÉJÀ INSTALLÉ" >> "$RAPPORT"
    else
        echo -e "${ROUGE}❌ Non installé.${NC}"
        
        # 5. PROPOSITION D'INSTALLATION
        # < /dev/tty force la lecture clavier même à l'intérieur d'une boucle while
        read -p "      > Voulez-vous l'installer maintenant ? (o/N) " REP < /dev/tty
        
        if [[ "$REP" =~ ^[oO]$ ]]; then
            echo "      📥 Installation en cours..."
            
            # apt-get install -y : Répond oui à tout automatiquement
            if apt-get install -y "$PAQUET" &> /dev/null; then
                echo -e "      ${VERT}✅ Installation réussie !${NC}"
                echo "$PAQUET : INSTALLÉ AVEC SUCCÈS" >> "$RAPPORT"
                ((SUCCES++))
            else
                echo -e "      ${ROUGE}💥 Échec de l'installation (Nom incorrect ?).${NC}"
                echo "$PAQUET : ERREUR INSTALLATION" >> "$RAPPORT"
                ((ERREURS++))
            fi
        else
            echo "      ⏭️  Ignoré."
            echo "$PAQUET : IGNORÉ PAR L'UTILISATEUR" >> "$RAPPORT"
        fi
    fi

done < "$LISTE_PAQUETS"

# 6. RÉSUMÉ FINAL
echo ""
echo "------------------------------------------------"
echo -e "TERMINÉ ! ${VERT}$SUCCES installés${NC} | ${ROUGE}$ERREURS erreurs${NC}"
echo "📝 Rapport complet disponible dans : $RAPPORT"
echo "------------------------------------------------"
```

![ex10](/images/2026-02-04-00-07-28.png)

Le rapport

![ex10](/images/2026-02-04-00-12-49.png)

## Exercice 11 - Générateur de rapports système

![ex11](/images/2026-02-04-00-08-27.png)

```sh
#!/bin/bash

# --- CONFIGURATION ---
FICHIER_HTML="rapport_systeme.html"
TITRE="Rapport Système - $(hostname)"
DATE=$(date "+%d/%m/%Y à %H:%M")

# Couleurs (Plus de bleu foncé !)
CYAN='\033[0;36m'
VERT='\033[0;32m'
ROUGE='\033[0;31m'
JAUNE='\033[1;33m'
NC='\033[0m'

echo -e "${CYAN}=== 📊 GÉNÉRATION DU RAPPORT SYSTÈME ===${NC}"
echo "Collecte des informations en cours..."

# --- COLLECTE DES DONNÉES ---
# 1. Info Système
OS_INFO=$(grep PRETTY_NAME /etc/os-release | cut -d'"' -f2)
KERNEL=$(uname -r)
UPTIME=$(uptime -p)

# 2. CPU & RAM
# On récupère le Load Average (charge système)
LOAD=$(cat /proc/loadavg | awk '{print $1, $2, $3}')
# Mémoire libre et totale
RAM_INFO=$(free -h | grep Mem)

# 3. Espace Disque (On filtre les systèmes de fichiers virtuels)
DISK_INFO=$(df -h | grep -vE '^Filesystem|tmpfs|cdrom|loop|udev')

# 4. Services (On prend juste les 10 premiers pour pas faire un rapport de 3km)
SERVICES_COUNT=$(systemctl list-units --type=service --state=running --no-pager | grep "loaded active" | wc -l)
SERVICES_LIST=$(systemctl list-units --type=service --state=running --no-pager | head -n 15)

# 5. Dernières connexions
LAST_LOGINS=$(last | head -n 5)

# --- GÉNÉRATION HTML ---
# On utilise "cat <<EOF" pour écrire un gros bloc de texte d'un coup
cat <<EOF > "$FICHIER_HTML"
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>$TITRE</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #1e1e1e; color: #d4d4d4; padding: 20px; }
        h1 { color: #4ec9b0; border-bottom: 2px solid #4ec9b0; padding-bottom: 10px; }
        h2 { color: #569cd6; margin-top: 30px; }
        .card { background-color: #252526; padding: 15px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.3); }
        .info-box { background-color: #333; padding: 10px; border-radius: 4px; font-family: monospace; white-space: pre-wrap; }
        .highlight { color: #ce9178; font-weight: bold; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; }
        th, td { text-align: left; padding: 8px; border-bottom: 1px solid #444; }
        th { background-color: #3e3e42; }
        .footer { margin-top: 40px; font-size: 0.8em; color: #888; text-align: center; }
    </style>
</head>
<body>
    <h1>🖥️ $TITRE</h1>
    <p>Généré le <span class="highlight">$DATE</span></p>

    <div class="card">
        <h2>ℹ️ Informations Générales</h2>
        <ul>
            <li><strong>Système OS :</strong> $OS_INFO</li>
            <li><strong>Noyau (Kernel) :</strong> $KERNEL</li>
            <li><strong>Temps d'activité :</strong> $UPTIME</li>
        </ul>
    </div>

    <div class="card">
        <h2>🧠 CPU & Mémoire</h2>
        <p><strong>Charge CPU (1min, 5min, 15min) :</strong> $LOAD</p>
        <div class="info-box">
Type      Total    Utilisé  Libre
Mem: $(echo $RAM_INFO | awk '{print $2 "    " $3 "    " $4}')
        </div>
    </div>

    <div class="card">
        <h2>💾 Espace Disque</h2>
        <div class="info-box">
$DISK_INFO
        </div>
    </div>

    <div class="card">
        <h2>⚙️ Services en cours ($SERVICES_COUNT actifs)</h2>
        <div class="info-box">
$SERVICES_LIST
... (Liste tronquée)
        </div>
    </div>

    <div class="card">
        <h2>bust_in_silhouette Dernières Connexions</h2>
        <div class="info-box">
$LAST_LOGINS
        </div>
    </div>

    <div class="footer">
        Rapport généré automatiquement par script Bash.
    </div>
</body>
</html>
EOF

echo -e "${VERT}✅ Rapport généré avec succès : $FICHIER_HTML${NC}"

# --- OUVERTURE AUTOMATIQUE ---
echo "Tentative d'ouverture dans le navigateur..."

# On teste quel outil est dispo pour ouvrir le fichier
if command -v xdg-open &> /dev/null; then
    xdg-open "$FICHIER_HTML" >/dev/null 2>&1
elif command -v wslview &> /dev/null; then
    wslview "$FICHIER_HTML" # Pour ceux qui sont sous WSL
elif command -v firefox &> /dev/null; then
    firefox "$FICHIER_HTML"
else
    echo -e "${JAUNE}⚠️  Impossible d'ouvrir le navigateur automatiquement.${NC}"
    echo "👉 Tu peux ouvrir le fichier manuellement : $(pwd)/$FICHIER_HTML"
fi
```

![ex11](/images/2026-02-04-00-17-19.png)

![ex11](/images/2026-02-04-00-17-52.png)

## Exercice 12 : Synchroniseur de fichiers

![ex12](/images/2026-02-04-00-09-32.png)

```sh
#!/bin/bash

# --- CONFIGURATION ---
SOURCE=$1
DEST=$2
LOG_FILE="backup.log"

# Couleurs (Visibles !)
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
VERT='\033[0;32m'
ROUGE='\033[0;31m'
NC='\033[0m'

# 1. VÉRIFICATION DES ARGUMENTS
if [ -z "$SOURCE" ] || [ -z "$DEST" ]; then
    echo -e "${ROUGE}Usage : $0 <source> <destination>${NC}"
    exit 1
fi

# 2. VÉRIFICATION EXISTENCE SOURCE
if [ ! -d "$SOURCE" ]; then
    echo -e "${ROUGE}❌ Erreur : Le dossier source '$SOURCE' n'existe pas.${NC}"
    exit 1
fi

# 3. CRÉATION DESTINATION SI BESOIN
if [ ! -d "$DEST" ]; then
    echo -e "${MAGENTA}⚠️  Le dossier destination n'existe pas. Création...${NC}"
    mkdir -p "$DEST"
fi

# 4. VÉRIFICATION ESPACE DISQUE (Sécurité)
# du -s : taille sommaire / cut -f1 : récupère le chiffre
TAILLE_SOURCE=$(du -s "$SOURCE" | cut -f1)
# df --output=avail : espace dispo / tail -1 : dernière ligne
ESPACE_DISPO=$(df "$DEST" | tail -1 | awk '{print $4}')

if [ "$TAILLE_SOURCE" -gt "$ESPACE_DISPO" ]; then
    echo -e "${ROUGE}❌ Erreur : Pas assez d'espace disque sur la destination !${NC}"
    echo "Besoin : $TAILLE_SOURCE Ko | Dispo : $ESPACE_DISPO Ko"
    exit 1
fi

clear
echo -e "${CYAN}=== 🔄 SYNCHRONISATEUR DE FICHIERS ===${NC}"
echo -e "Source : ${VERT}$SOURCE${NC}"
echo -e "Dest   : ${VERT}$DEST${NC}"
echo ""

# 5. DEMANDE OPTION BONUS (DELETE)
read -p "🗑️  BONUS : Voulez-vous supprimer dans la destination les fichiers qui n'existent plus dans la source ? (o/N) " REP_DEL

OPTIONS="-avh --progress --stats"

if [[ "$REP_DEL" =~ ^[oO]$ ]]; then
    echo -e "${MAGENTA}👉 Mode MIROIR activé (--delete)${NC}"
    OPTIONS="$OPTIONS --delete"
else
    echo -e "${CYAN}👉 Mode INCREMENTAL (On garde tout)${NC}"
fi

echo ""
echo "⏳ Démarrage de la synchronisation..."
echo "-------------------------------------"

# 6. LANCEMENT DE RSYNC
# -a : Archive (garde les permissions, dates, droits...)
# -v : Verbose (parle beaucoup)
# -h : Human readable (tailles en Mo/Go)
# --progress : Barre de progression
# --stats : Affiche le résumé à la fin
rsync $OPTIONS "$SOURCE/" "$DEST/" 2>> "$LOG_FILE"

# Vérification du succès
if [ $? -eq 0 ]; then
    echo "-------------------------------------"
    echo -e "${VERT}✅ Synchronisation terminée avec succès !${NC}"
    echo "📝 Logs écrits dans $LOG_FILE"
else
    echo -e "${ROUGE}❌ Une erreur est survenue (Voir $LOG_FILE)${NC}"
fi
```

![ex12](/images/2026-02-04-00-24-13.png)

![ex12](/images/2026-02-04-00-24-30.png)

![ex12](/images/2026-02-04-00-25-36.png)

## Exercice Bonus : le Menu

```sh
#!/bin/bash

# Couleurs
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
VERT='\033[0;32m'
ROUGE='\033[0;31m'
JAUNE='\033[1;33m'
NC='\033[0m'

# On rend tout exécutable d'un coup
chmod +x Ex*.sh 2>/dev/null

pause(){
    echo ""
    echo -e "${MAGENTA}Appuyez sur [Entrée] pour revenir au menu...${NC}"
    read
}

while true; do
    clear
    echo -e "${CYAN}====================================================${NC}"
    echo -e "${MAGENTA}         🚀  SYSADMIN TOOLBOX - ULTIMATE  🚀        ${NC}"
    echo -e "${CYAN}====================================================${NC}"
    echo ""
    echo -e "${JAUNE}--- BASIQUES ---${NC}"
    echo -e " 1. Copie de fichiers (Ex1)"
    echo -e " 2. Sauvegarde Archive (Ex2)"
    echo -e " 3. Jeu Plus ou Moins (Ex3)"
    echo -e " 4. Créer Utilisateurs (Ex4) ${ROUGE}(Sudo)${NC}"
    echo -e " 5. Monitoring Logs (Ex5)"
    echo ""
    echo -e "${JAUNE}--- SYSTÈME & MAINTENANCE ---${NC}"
    echo -e " 6. Gestion Services (Ex6) ${ROUGE}(Sudo)${NC}"
    echo -e " 7. Nettoyeur Logs (Ex7) ${ROUGE}(Sudo)${NC}"
    echo -e " 8. Analyse Disque (Ex8) ${ROUGE}(Sudo)${NC}"
    echo -e " 9. Test Réseau (Ex9)"
    echo ""
    echo -e "${JAUNE}--- AUTOMATISATION ---${NC}"
    echo -e "10. Installateur Paquets (Ex10) ${ROUGE}(Sudo)${NC}"
    echo -e "11. Rapport HTML (Ex11)"
    echo -e "12. Synchronisateur RSYNC (Ex12)"
    echo ""
    echo -e "${ROUGE} Q. Quitter${NC}"
    echo ""
    
    read -p "Votre choix : " CHOIX

    case $CHOIX in
        1)
            echo -e "\n--- COPIE ---"
            read -p "Source : " S; read -p "Dest : " D
            ./Ex1_Copy.sh "$S" "$D"; pause ;;
        2)
            echo -e "\n--- ARCHIVE ---"
            read -p "Dossier : " D
            ./Ex2_Backup.sh "$D"; pause ;;
        3)  ./Ex3_PlusOuMoins.sh; pause ;;
        4)
            echo -e "\n--- USERS ---"
            read -p "Fichier CSV : " F
            sudo ./Ex4_CreateUsers.sh "$F"; pause ;;
        5)
            echo -e "\n--- LOGS ---"
            read -p "Fichier Log : " L
            ./Ex5_Monitor.sh "$L"; pause ;;
        6)  sudo ./Ex6_Services.sh; pause ;;
        7)
            echo -e "\n--- CLEANER ---"
            read -p "Jours max : " J
            sudo ./Ex7_Cleaner.sh "$J"; pause ;;
        8)  sudo ./Ex8_DiskSpace.sh; pause ;;
        9)  ./Ex9_NetworkCheck.sh; pause ;;
        10)
            echo -e "\n--- INSTALL ---"
            read -p "Liste paquets : " L
            sudo ./Ex10_Installer.sh "$L"; pause ;;
        11) ./Ex11_Report.sh; pause ;;
        12)
            echo -e "\n--- SYNCHRO ---"
            read -p "Source : " S; read -p "Dest : " D
            ./Ex12_Synchro.sh "$S" "$D"; pause ;;
        [qQ])
            echo -e "${MAGENTA}Bye bye SysAdmin ! 👋${NC}"
            break ;;
        *)
            echo "Choix invalide..."
            sleep 1 ;;
    esac
done
```

![menu](/images/2026-02-04-00-27-15.png)
