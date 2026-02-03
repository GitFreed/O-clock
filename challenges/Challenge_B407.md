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

Les script créés seront tous disponibles dans ce [dossier](/challenges/Scripts/Bash/Exercices-B407/)

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

## Exercice 6
