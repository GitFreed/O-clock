<#############################################
.SYNOPSIS
Affiche des informations systeme.

.DESCRIPTION
Affiche le poste, l'utilisateur, la date/heure, le CPU,
la RAM totale et la version Windows avec une mise en forme
plus lisible qu'en Batch.
#############################################>

# Couleurs par section pour faciliter la lecture
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "     INFORMATIONS SYSTEME (POWERSHELL)" -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan

$computer = $env:COMPUTERNAME
$user = $env:USERNAME
$now = Get-Date

$cpu = Get-CimInstance -ClassName Win32_Processor | Select-Object -First 1
$os = Get-CimInstance -ClassName Win32_OperatingSystem
$memTotalGB = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)

Write-Host "Ordinateur : $computer" -ForegroundColor Green
Write-Host "Utilisateur: $user" -ForegroundColor Green
Write-Host "Date       : $($now.ToString('yyyy-MM-dd'))" -ForegroundColor Yellow
Write-Host "Heure      : $($now.ToString('HH:mm:ss'))" -ForegroundColor Yellow

Write-Host "" 
Write-Host "--- Processeur ---" -ForegroundColor Magenta
Write-Host $cpu.Name

Write-Host "--- Memoire totale ---" -ForegroundColor Magenta
Write-Host "$memTotalGB GB"

Write-Host "--- Systeme d'exploitation ---" -ForegroundColor Magenta
Write-Host "$($os.Caption) ($($os.Version))"
