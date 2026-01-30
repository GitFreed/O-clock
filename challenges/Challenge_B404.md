# Challenge B404 29/01/2026

## Pitch de l’exercice 🧑‍🏫

![Challenge](/images/2026-01-29-17-08-03.png)

**Challenge B404** : <https://github.com/O-clock-Aldebaran/SB04-04-batch-powershell-GitFreed>

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
echo 5. Monitoring (PowerShell)
echo 6. Nettoyage (Batch)
echo 7. Nombre Mystere (Python)
echo 8. Quitter
echo.
echo ========================================

@REM Set pour créer la variable, /p invite au prompt

set /p Choix=Entrez votre choix (1-8) : 

@REM Gestion des choix, goto renvois sur l'étiquette en question

if "%Choix%"=="1" goto InfoBat
if "%Choix%"=="2" goto InfoPS
if "%Choix%"=="3" goto SaveBat
if "%Choix%"=="4" goto SavePS
if "%Choix%"=="5" goto MonitorPS
if "%Choix%"=="6" goto CleanBat
if "%Choix%"=="7" goto GamePy
if "%Choix%"=="8" exit

@REM Si l'utilisateur tape n'importe quoi d'autre

color 0C
echo Choix invalide ! Merci de taper un chiffre entre 1 et 7.
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

:MonitorPS
cls
echo Lancement du Monitoring PowerShell...
powershell -NoProfile -ExecutionPolicy Bypass -File "..\PowerShell\B404_monitoring.ps1"
pause
goto Menu

:CleanBat
cls
echo Lancement du Nettoyage Batch...
call "B404_nettoyage.bat"
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
# ========================================
# Script : monitoring.ps1
# Description : Affiche les données utilisateurs
# Auteur : Freed
# Date : 29-01-2026
# ========================================

# La fonction qui récupère les chiffres
function Get-Metriques {
    # CPU (Moyenne de charge)
    $Cpu = (Get-CimInstance Win32_Processor).LoadPercentage

    # MÉMOIRE (RAM)
    $Os = Get-CimInstance Win32_OperatingSystem
    $TotalRam = $Os.TotalVisibleMemorySize  # En Ko
    $FreeRam = $Os.FreePhysicalMemory       # En Ko
    $UsedRam = $TotalRam - $FreeRam
    
    # Calculs RAM
    $RamPercent = ($UsedRam / $TotalRam) * 100
    $RamGB = $UsedRam / 1MB # Division par 1MB car la source est en Ko (1024 Ko = 1 Mo, etc.)

    # DISQUE C:
    $Disk = Get-PSDrive -Name "C"
    $DiskUsed = $Disk.Used
    $DiskTotal = $Disk.Used + $Disk.Free
    
    # Calculs Disque
    $DiskPercent = ($DiskUsed / $DiskTotal) * 100
    $DiskGB = $DiskUsed / 1GB

    # On met tout ça dans une "boîte" (Objet) pour l'envoyer à l'affichage
    return [PSCustomObject]@{
        CPU_P   = $Cpu
        RAM_P   = $RamPercent
        RAM_GB  = $RamGB
        DISK_P  = $DiskPercent
        DISK_GB = $DiskGB
    }
}

# La fonction qui affiche avec des couleurs
function Show-Metriques ($Donnees) {
    # On nettoie l'écran pour l'effet "temps réel"
    Clear-Host
    
    $Heure = Get-Date -Format "HH:mm:ss"
    Write-Host "=== MONITORING SYSTEME - $Heure ===" -ForegroundColor Cyan
    Write-Host "-------------------------------------"

    # Petite fonction interne pour choisir la couleur
    # Elle regarde le chiffre et écrit la ligne
    function Ecrire-Couleur ($Titre, $Valeur, $Unite) {
        if ($Valeur -lt 50) { $C = "Green" }
        elseif ($Valeur -lt 80) { $C = "Yellow" }
        else { $C = "Red" }
        
        # On arrondit pour faire propre
        $ValArrondi = [math]::Round($Valeur, 1)
        Write-Host "$Titre : $ValArrondi $Unite" -ForegroundColor $C
    }

    # Affichage des 3 jauges via notre fonction couleur
    Ecrire-Couleur "Utilisation CPU " $Donnees.CPU_P "%"
    
    Ecrire-Couleur "Utilisation RAM " $Donnees.RAM_P "%"
    Write-Host "   -> Volume RAM : $([math]::Round($Donnees.RAM_GB, 2)) Go" -ForegroundColor Gray

    Ecrire-Couleur "Utilisation C:  " $Donnees.DISK_P "%"
    Write-Host "   -> Espace pris: $([math]::Round($Donnees.DISK_GB, 2)) Go" -ForegroundColor Gray

    Write-Host "-------------------------------------"
    Write-Host "TOP 5 PROCESSUS (CPU):" -ForegroundColor White
    
    # On récupère et trie les processus
    Get-Process | Sort-Object CPU -Descending | Select-Object -First 5 -Property Id, ProcessName, CPU | Format-Table -AutoSize
    
    Write-Host "(Ctrl+C pour arreter)" -ForegroundColor DarkGray
}

# La boucle infinie
# while ($true) veut dire "Tant que Vrai est Vrai" donc pour toujours
while ($true) {
    # On appelle notre fonction de récupération des infos
    $Infos = Get-Metriques
    
    # On appelle la fonction d'affichage avec des infos
    Show-Metriques -Donnees $Infos
    
    # On fait une sieste de 5 secondes
    Start-Sleep -Seconds 5
}
```

![monitoring](/images/2026-01-30-00-09-51.png)

![monitoring](/images/2026-01-30-00-12-24.png)

## Script de nettoyage en Batch

[nettoyage.bat](./Scripts/Batch/B404_nettoyage.bat)

```bat
@echo off

:: ========================================
:: Script : nettoyage.bat
:: Description : Un menu qui lance les différents scripts créés.
:: Auteur : Freed
:: Date : 29-01-2026
:: ========================================

Title Script de Nettoyage Rapide
color 0C

:: Avertissement !
echo ========================================================
echo                  ATTENTION !
echo ========================================================
echo Ce script va supprimer definitivement les fichiers
echo temporaires (.tmp et .log) de votre ordinateur.
echo.
echo Dossiers cibles :
echo  - %TEMP%
echo  - C:\Windows\Temp
echo ========================================================
echo.

:: Confirmation
:: /I permet d'accepter "O" majuscule ou "o" minuscule
set /p Choix=Etes-vous sur de vouloir continuer ? (O/N) : 
if /I "%Choix%" neq "O" goto Annulation

:: Nettoyage
cls
echo Nettoyage en cours, veuillez patienter...
echo.

:: Suppression dans le dossier TEMP utilisateur
:: /F = Force (efface même les fichiers lecture seule)
:: /Q = Quiet (pas de confirmation à chaque fichier)
del /F /Q "%TEMP%\*.tmp" 2>nul
del /F /Q "%TEMP%\*.log" 2>nul

:: Suppression dans le dossier TEMP système (Besoin Admin)
del /F /Q "C:\Windows\Temp\*.tmp" 2>nul
del /F /Q "C:\Windows\Temp\*.log" 2>nul

:: Résumé
color 0A
echo.
echo ========================================================
echo                 RESUME DES ACTIONS
echo ========================================================
echo [OK] Nettoyage du dossier temporaire Utilisateur
echo [OK] Nettoyage du dossier temporaire Windows
echo.
echo Tout est propre !
goto Fin

:Annulation
echo.
echo Operation annulee par l'utilisateur.
color 0E

:Fin
pause
```

![script](/images/2026-01-30-00-35-37.png)

Cancel

![cancel](/images/2026-01-30-00-35-06.png)

Done

![clean](/images/2026-01-30-00-33-56.png)
