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



# Avec des couleurs différentes pour les sections
# En utilisant les cmdlets PowerShell appropriées
# En formatant les données de manière plus lisible (ex: mémoire en GB)
# Avec un en-tête de documentation (synopsis, description)