@echo off

@REM ========================================
@REM Script : backup_simple.bat
@REM Description : Sauvegarde automatiquement les fichiers d'un dossier
@REM Auteur : Freed
@REM Date : 29-01-2026
@REM ========================================




@REM Définit une source (ex: Documents de l'utilisateur)
@REM Définit une destination (ex: C:\Backup)
@REM Crée un nom de dossier avec la date et l'heure
@REM Vérifie que le dossier source existe
@REM Crée le dossier de destination
@REM Copie tous les fichiers de la source vers la destination (avec sous-dossiers)
@REM Affiche un message de succès ou d'erreur selon le résultat
@REM Change la couleur selon le succès/échec