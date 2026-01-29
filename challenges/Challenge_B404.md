# Challenge B404 29/01/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2026-01-29-17-08-03.png)

Challenge B404 : <https://github.com/O-clock-Aldebaran/SB04-04-batch-powershell-GitFreed>

[Cours B404.](/RESUME.md#-b404-scripting--batch--powershell)

---

## Script : Informations système

On va créer le même script en Batch et PowerShell pour comparer les deux approches.

![bacth](/images/2026-01-29-17-52-59.png)

[info_systeme.bat](./Scripts/Batch/B404_info_systeme.bat)

```bat
@echo off

@REM ========================================
@REM Script : info_systeme.bat
@REM Description : Affiche les données utilisateurs
@REM Auteur : Freed
@REM Date : 29-01-2026
@REM ========================================

@REM Un titre coloré
color 02
echo =====================================
echo === Script d'informations systeme ===

@REM Le nom de l'ordinateur
echo Ordinateur : %COMPUTERNAME%

@REM Le nom de l'utilisateur
echo Utilisateur : %USERNAME%

@REM La date et l'heure actuelles
echo Date : %TIME% le %DATE%

echo =====================================

@REM La version du système d'exploitation (utilisez wmic)
echo Version du systeme d'exploitation :
powershell -command "(Get-CimInstance Win32_OperatingSystem).Caption"

@REM Des informations sur le processeur (utilisez wmic)
echo Informations du processeur :
powershell -command "(Get-CimInstance Win32_Processor).Name"

@REM La mémoire totale du système (utilisez wmic)
echo Memoire totale du systeme :
powershell -command "(Get-CimInstance Win32_OperatingSystem).TotalVisibleMemorySize"

echo =====================================

@REM Une pause à la fin
pause
```

![batch](/images/2026-01-29-17-52-20.png)

![powershell](/images/2026-01-29-17-53-21.png)

[info_systeme.ps1](./Scripts/PowerShell/B404_info_systeme.ps1)

```ps1
# ========================================
# Script : info_systeme.ps1
# Description : Affiche les données utilisateurs
# Auteur : Freed
# Date : 29-01-2026
# ========================================

# Un titre coloré
Write-Host "=== Script d'informations systeme ===" -ForegroundColor Red
Write-Host "=====================================" -ForegroundColor Blue


# Le nom de l'ordinateur
Write-Host "Ordinateur : $env:COMPUTERNAME"  

# Le nom de l'utilisateur
Write-Host "Utilisateur : $env:USERNAME" 

# La date et l'heure actuelles
Write-Host "Date : $(Get-Date)"

Write-Host "=====================================" -ForegroundColor Blue

# La version du système d'exploitation
Write-Host "Version du systeme d'exploitation : $((Get-CimInstance Win32_OperatingSystem).Caption)" 

# Des informations sur le processeur
Write-Host "Informations du processeur : $env:PROCESSOR_IDENTIFIER"

# La mémoire totale du système
Write-Host "Memoire totale du systeme : $([math]::Round((Get-CimInstance Win32_OperatingSystem).TotalVisibleMemorySize / 1MB, 2)) GB"


Write-Host "=====================================" -ForegroundColor Blue

# Une pause à la fin
pause
```

![powershell](/images/2026-01-29-18-33-18.png)

## Script : Sauvegarde en Batch

![batch](/images/2026-01-29-18-34-01.png)

[backup_simple.bat](./Scripts/Batch/backup_simple.bat)

```bat
@echo off

@REM ========================================
@REM Script : backup_simple.bat
@REM Description : Sauvegarde automatiquement les fichiers d'un dossier
@REM Auteur : Freed
@REM Date : 29-01-2026
@REM ========================================

@REM Définit une source (ex: Documents de l'utilisateur)
set SOURCE=D:\Telechargements\Temp\DossierTest

@REM Vérifie que le dossier source existe
if not exist "%SOURCE%" (
    echo Erreur : Le dossier source n'existe pas !
    color 0C
    goto Fin
)

@REM Définit une destination (ex: C:\Backup)
set DESTINATION=D:\Telechargements\Temp\Backup

@REM Crée un nom de dossier avec la date et l'heure
set DATE_BACKUP=%date:~-4%%date:~3,2%%date:~0,2%
set "DOSSIER_BACKUP=%DESTINATION%\%DATE_BACKUP%"
@REM Crée le dossier de destination
md "%DOSSIER_BACKUP%"

@REM Copie tous les fichiers de la source vers la destination (avec sous-dossiers)
@REM (/E = avec sous-dossiers, /I = considère destination comme un dossier, /Y = écrase sans demander)
xcopy "%SOURCE%" "%DOSSIER_BACKUP%" /E /I /Y

@REM Affiche un message de succès ou d'erreur selon le résultat
@REM Change la couleur selon le succès/échec
if %errorlevel% equ 0 (
    echo Sauvegarde reussie !
    color 0A
) else (
    echo Echec de la sauvegarde !
    color 0C
)

@REM Etiquette Fin pour le goto
:Fin
pause
```

![OK](/images/2026-01-29-19-38-28.png)

![OK](/images/2026-01-29-19-40-05.png)

## Script : Sauvegarde en PowerShell

![powershell](/images/2026-01-29-18-34-42.png)

[backup_avance.ps1](./Scripts/PowerShell/B404_backup_avance.ps1)

```ps1
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
```

![powershell](/images/2026-01-29-23-32-33.png)

![log](/images/2026-01-29-23-34-20.png)

## Menu interactif en Batch

![menu](/images/2026-01-29-23-34-57.png)

[menu_principal.bat](./Scripts/Batch/B404_menu_principal.bat)

```bat
@echo off

@REM ========================================
@REM Script : menu_principal.bat
@REM Description : Un menu qui lance les différents scripts créés.
@REM Auteur : Freed
@REM Date : 29-01-2026
@REM ========================================

Title Menu Principal - Outils Admin

@REM La Boucle Infinie :Menu et goto Menu / cls efface le terminal à chaque fois

:Menu
cls
color 0B
echo ========================================
echo          MENU D'ADMINISTRATION
echo ========================================
echo.
echo 1. Informations Systeme (Batch)
echo 2. Informations Systeme (PowerShell)
echo 3. Sauvegarde Simple (Batch)
echo 4. Sauvegarde Avancee (PowerShell)
echo 5. Nombre Mystere (Python)
echo 6. Quitter
echo.
echo ========================================

@REM Set pour créer la variable, /p invite au prompt

set /p Choix=Entrez votre choix (1-5) : 

@REM Gestion des choix, goto renvois sur l'étiquette en question

if "%Choix%"=="1" goto InfoBat
if "%Choix%"=="2" goto InfoPS
if "%Choix%"=="3" goto SaveBat
if "%Choix%"=="4" goto SavePS
if "%Choix%"=="5" goto GamePy
if "%Choix%"=="6" exit

@REM Si l'utilisateur tape n'importe quoi d'autre

color 0C
echo Choix invalide ! Merci de taper un chiffre entre 1 et 5.
pause
goto Menu

@REM Lancement des scripts

:InfoBat
cls
echo Lancement du script Batch...
call "B404_info_systeme.bat"
pause
goto Menu

:InfoPS
cls
echo Lancement du script PowerShell...
powershell -NoProfile -ExecutionPolicy Bypass -File "..\PowerShell\B404_info_systeme.ps1"
pause
goto Menu

:SaveBat
cls
echo Lancement de la sauvegarde Batch...
call "B404_backup_simple.bat"
pause
goto Menu

:SavePS
cls
echo Lancement de la sauvegarde PowerShell...
powershell -NoProfile -ExecutionPolicy Bypass -File "..\PowerShell\B404_backup_avance.ps1"
pause
goto Menu

:GamePy
cls
echo Lancement du jeu Python...
python "..\Python\B403_NbreMystere.py"
pause
goto Menu
```

![menu](/images/2026-01-29-23-55-39.png)

1

![1](/images/2026-01-29-23-56-20.png)

2

![2](/images/2026-01-29-23-56-46.png)

5

![5](/images/2026-01-29-23-55-53.png)

## Script de monitoring en PowerShell

![monitoring](/images/2026-01-30-00-00-14.png)

[monitoring.ps1](./Scripts/PowerShell/B404_monitoring.ps1)

```ps1

```

![monitoring](/images/2026-01-30-00-09-51.png)
