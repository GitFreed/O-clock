# ========================================
# Script : monitoring.ps1
# Description : Affiche les données utilisateurs
# Auteur : Freed
# Date : 29-01-2026
# ========================================

# La fonction qui récupère les chiffres
function Get-Metriques {
    # CPU (Moyenne de charge)
    $Cpu = (Get-CimInstance Win32_Processor).LoadPercentage

    # MÉMOIRE (RAM)
    $Os = Get-CimInstance Win32_OperatingSystem
    $TotalRam = $Os.TotalVisibleMemorySize  # En Ko
    $FreeRam = $Os.FreePhysicalMemory       # En Ko
    $UsedRam = $TotalRam - $FreeRam
    
    # Calculs RAM
    $RamPercent = ($UsedRam / $TotalRam) * 100
    $RamGB = $UsedRam / 1MB # Division par 1MB car la source est en Ko (1024 Ko = 1 Mo, etc.)

    # DISQUE C:
    $Disk = Get-PSDrive -Name "C"
    $DiskUsed = $Disk.Used
    $DiskTotal = $Disk.Used + $Disk.Free
    
    # Calculs Disque
    $DiskPercent = ($DiskUsed / $DiskTotal) * 100
    $DiskGB = $DiskUsed / 1GB

    # On met tout ça dans une "boîte" (Objet) pour l'envoyer à l'affichage
    return [PSCustomObject]@{
        CPU_P   = $Cpu
        RAM_P   = $RamPercent
        RAM_GB  = $RamGB
        DISK_P  = $DiskPercent
        DISK_GB = $DiskGB
    }
}

# La fonction qui affiche avec des couleurs
function Show-Metriques ($Donnees) {
    # On nettoie l'écran pour l'effet "temps réel"
    Clear-Host
    
    $Heure = Get-Date -Format "HH:mm:ss"
    Write-Host "=== MONITORING SYSTEME - $Heure ===" -ForegroundColor Cyan
    Write-Host "-------------------------------------"

    # Petite fonction interne pour choisir la couleur
    # Elle regarde le chiffre et écrit la ligne
    function Ecrire-Couleur ($Titre, $Valeur, $Unite) {
        if ($Valeur -lt 50) { $C = "Green" }
        elseif ($Valeur -lt 80) { $C = "Yellow" }
        else { $C = "Red" }
        
        # On arrondit pour faire propre
        $ValArrondi = [math]::Round($Valeur, 1)
        Write-Host "$Titre : $ValArrondi $Unite" -ForegroundColor $C
    }

    # Affichage des 3 jauges via notre fonction couleur
    Ecrire-Couleur "Utilisation CPU " $Donnees.CPU_P "%"
    
    Ecrire-Couleur "Utilisation RAM " $Donnees.RAM_P "%"
    Write-Host "   -> Volume RAM : $([math]::Round($Donnees.RAM_GB, 2)) Go" -ForegroundColor Gray

    Ecrire-Couleur "Utilisation C:  " $Donnees.DISK_P "%"
    Write-Host "   -> Espace pris: $([math]::Round($Donnees.DISK_GB, 2)) Go" -ForegroundColor Gray

    Write-Host "-------------------------------------"
    Write-Host "TOP 5 PROCESSUS (CPU):" -ForegroundColor White
    
    # On récupère et trie les processus
    Get-Process | Sort-Object CPU -Descending | Select-Object -First 5 -Property Id, ProcessName, CPU | Format-Table -AutoSize
    
    Write-Host "(Ctrl+C pour arreter)" -ForegroundColor DarkGray
}

# La boucle infinie
# while ($true) veut dire "Tant que Vrai est Vrai" donc pour toujours
while ($true) {
    # On appelle notre fonction de récupération des infos
    $Infos = Get-Metriques
    
    # On appelle la fonction d'affichage avec des infos
    Show-Metriques -Donnees $Infos
    
    # On fait une sieste de 5 secondes
    Start-Sleep -Seconds 5
}