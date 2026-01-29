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

```
