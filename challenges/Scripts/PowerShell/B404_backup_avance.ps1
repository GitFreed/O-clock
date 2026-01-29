# ========================================
# Script : backup_avance.ps1
# Description : Sauvegarde automatiquement les fichiers d'un dossier
# Auteur : Freed
# Date : 29-01-2026
# ========================================

# Définit la source et la destination
$Source = "D:\Telechargements\Temp\DossierTest"
$Destination = "D:\Telechargements\Temp\Backup"
$Date = Get-Date -Format "yyyyMMdd_HHmm"
$DossierBackup = "$Destination\Backup_$Date"


# Crée un fichier de log avec horodatage
# Contient une fonction pour écrire dans le log avec différents niveaux (INFO, SUCCESS, WARNING, ERROR)

$LogFile = "$Destination\Log_Backup_$Date.txt"
# On ajoute une fonction, une nouvelle commande MonLog qui doit utiliser les variables Type et Message
function MonLog ($Type, $Message) {
    #La variable $Ligne contient par exemple : "[20:15:30] [INFO] Sauvegarde réussie"
    $Ligne = "[$(Get-Date -Format 'HH:mm:ss')] [$Type] $Message"
    # Ajoute du contenu dans le fichier dont le chemin est stocké dans la variable $LogFile
    Add-Content -Path $LogFile -Value $Ligne
    # On écrit dans le fichier ET à l'écran en même temps
    Write-Host $Ligne
}

# Vérifie l'existence du dossier source avec gestion d'erreur (try-catch)
# Copie les fichiers en affichant une barre de progression
# Compte le nombre de fichiers copiés
# Calcule et affiche la taille totale sauvegardée
# Gère les erreurs de manière robuste

# try { ... } : PowerShell essaie d'exécuter tout ce qu'il y a dedans.
# catch { ... } : Si une seule ligne plante dans le try (erreur rouge), PowerShell arrête tout immédiatement et saute directement dans le catch.

try {
    # On s'assure que le dossier Backup existe pour le fichier log
    if (-not (Test-Path $DossierBackup)) { New-Item -Path $DossierBackup -ItemType Directory | Out-Null }

    MonLog "INFO" "Démarrage du script..."

    # Vérification de la source (Si pas là -> Erreur immédiate)
    if (-not (Test-Path $Source)) { Write-Error "Le dossier source est introuvable !" -ErrorAction Stop }

    # Création du dossier de destination du jour
    New-Item -Path $DossierBackup -ItemType Directory -Force | Out-Null
    MonLog "INFO" "Dossier destination créé : $DossierBackup"

    # Récupération de la liste des fichiers (pour compter avant de copier)
    $ListeFichiers = Get-ChildItem -Path $Source -File -Recurse
    $TotalFichiers = $ListeFichiers.Count
    
    # Initialisation des compteurs
    $Compteur = 0
    $TailleTotale = 0

    MonLog "INFO" "Début de la copie de $TotalFichiers fichiers..."

    # --- BOUCLE DE COPIE --- for each fichier dans la listefichier, ajoute +1 au compteur
    foreach ($Fichier in $ListeFichiers) {
        $Compteur++
        
        # Gestion de la barre de progression en règle de 3
        $Pourcent = ($Compteur / $TotalFichiers) * 100
        Write-Progress -Activity "Sauvegarde en cours..." -Status "$Compteur / $TotalFichiers" -PercentComplete $Pourcent

        # Calcul du nouveau chemin (pour garder les sous-dossiers)
        # On remplace le début du chemin source par le chemin backup
        $NouveauChemin = $Fichier.FullName.Replace($Source, $DossierBackup)
        
        # On vérifie et crée le sous-dossier parent si besoin
        $DossierParent = Split-Path $NouveauChemin -Parent
        if (-not (Test-Path $DossierParent)) {
            New-Item -Path $DossierParent -ItemType Directory -Force | Out-Null
        }

        # La copie du fichier
        Copy-Item -Path $Fichier.FullName -Destination $NouveauChemin -Force

        # On ajoute la taille au total
        $TailleTotale = $TailleTotale + $Fichier.Length
    }

    # Conversion de la taille en Mo (arrondi à 2 chiffres)
    $TailleMo = [math]::Round($TailleTotale / 1MB, 2)

    MonLog "SUCCESS" "Sauvegarde terminée ! $Compteur fichiers copiés."
    MonLog "INFO" "Taille totale : $TailleMo Mo"

}
catch {
    # Si une erreur arrive n'importe où (le 'throw' ou une erreur système)
    MonLog "ERROR" "Une erreur est survenue : $($_.Exception.Message)"
}

# Affiche le chemin du fichier de log créé
Write-Host "Log disponible ici : $LogFile"