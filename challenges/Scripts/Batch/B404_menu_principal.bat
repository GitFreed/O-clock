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
echo 6. Nombre Mystere (Python)
echo 7. Quitter
echo.
echo ========================================

@REM Set pour créer la variable, /p invite au prompt

set /p Choix=Entrez votre choix (1-7) : 

@REM Gestion des choix, goto renvois sur l'étiquette en question

if "%Choix%"=="1" goto InfoBat
if "%Choix%"=="2" goto InfoPS
if "%Choix%"=="3" goto SaveBat
if "%Choix%"=="4" goto SavePS
if "%Choix%"=="5" goto MonitorPS
if "%Choix%"=="6" goto GamePy
if "%Choix%"=="7" exit

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

:GamePy
cls
echo Lancement du jeu Python...
python "..\Python\B403_NbreMystere.py"
pause
goto Menu