@echo off
setlocal

REM =========================================================
REM Script: menu_principal.bat
REM Objectif: Menu pour lancer les autres scripts.
REM =========================================================

set "SCRIPT_DIR=%~dp0"

:menu
cls
color 0B
 echo ==============================================
 echo            MENU PRINCIPAL
 echo ==============================================
 echo 1. Informations systeme (Batch)
 echo 2. Informations systeme (PowerShell)
 echo 3. Sauvegarde simple (Batch)
 echo 4. Sauvegarde avancee (PowerShell)
 echo 5. Quitter
 echo.
 set /p CHOIX=Votre choix (1-5) : 

if "%CHOIX%"=="1" (
    call "%SCRIPT_DIR%info_systeme.bat"
    goto menu
) else if "%CHOIX%"=="2" (
    powershell -ExecutionPolicy Bypass -File "%SCRIPT_DIR%info_systeme.ps1"
    pause
    goto menu
) else if "%CHOIX%"=="3" (
    call "%SCRIPT_DIR%backup_simple.bat"
    goto menu
) else if "%CHOIX%"=="4" (
    powershell -ExecutionPolicy Bypass -File "%SCRIPT_DIR%backup_avance.ps1"
    pause
    goto menu
) else if "%CHOIX%"=="5" (
    echo Au revoir !
    goto :end
) else (
    color 0C
    echo Choix invalide. Merci de recommencer.
    timeout /t 2 >nul
    goto menu
)

:end
endlocal
