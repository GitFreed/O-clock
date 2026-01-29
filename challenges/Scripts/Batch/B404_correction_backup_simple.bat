@echo off
setlocal

REM =========================================================
REM Script: backup_simple.bat
REM Objectif: Sauvegarde simple d'un dossier utilisateur.
REM =========================================================

REM Definir la source et la destination
set "SOURCE=%USERPROFILE%\Documents"
set "DEST=C:\Backup"

REM Generer un horodatage stable (YYYYMMDD_HHMMSS)
for /f "tokens=2 delims==" %%I in ('wmic os get LocalDateTime /value ^| find "="') do set "DT=%%I"
set "STAMP=%DT:~0,8%_%DT:~8,6%"
set "BACKUP_DIR=%DEST%\backup_%STAMP%"

REM Verifier la source
if not exist "%SOURCE%" (
    color 0C
    echo [ERREUR] Dossier source introuvable: %SOURCE%
    goto :end
)

REM Creer le dossier de destination
if not exist "%DEST%" (
    mkdir "%DEST%" >nul 2>&1
)

mkdir "%BACKUP_DIR%" >nul 2>&1

REM Copier les fichiers et sous-dossiers
xcopy "%SOURCE%" "%BACKUP_DIR%" /E /I /Y >nul
if errorlevel 1 (
    color 0C
    echo [ERREUR] La sauvegarde a echoue.
) else (
    color 0A
    echo [OK] Sauvegarde terminee: %BACKUP_DIR%
)

:end
pause
endlocal
