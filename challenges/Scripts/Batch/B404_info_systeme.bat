@echo off

@REM ========================================
@REM Script : info_systeme.bat
@REM Description : Affiche les données utilisateurs
@REM Auteur : Freed
@REM Date : 29-01-2026
@REM ========================================

@REM Un titre coloré
color 02
echo === Script d'informations systeme ===
echo =====================================

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