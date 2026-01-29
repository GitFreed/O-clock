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