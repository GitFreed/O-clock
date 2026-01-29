@echo off
setlocal

REM =========================================================
REM Script: info_systeme.bat
REM Objectif: Afficher des informations systeme de base.
REM =========================================================

REM Couleur: fond noir (0) et texte vert clair (A)
color 0A

REM Titre
 echo ==============================================
 echo      INFORMATIONS SYSTEME (BATCH)
 echo ==============================================

REM Nom de l'ordinateur et utilisateur
 echo Ordinateur : %COMPUTERNAME%
 echo Utilisateur: %USERNAME%

REM Date et heure
 echo Date       : %DATE%
 echo Heure      : %TIME%

REM Infos CPU / RAM / OS avec WMIC
 echo.
 echo --- Processeur ---
 wmic cpu get Name

 echo --- Memoire totale ---
 wmic computersystem get TotalPhysicalMemory

 echo --- Systeme d'exploitation ---
 wmic os get Caption, Version

 echo.
 pause
endlocal
