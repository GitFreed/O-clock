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
