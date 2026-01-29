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