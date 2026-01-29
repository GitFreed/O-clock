<#############################################
.SYNOPSIS
Sauvegarde avancee avec journalisation.

.DESCRIPTION
Copie un dossier source vers un dossier de sauvegarde horodate.
Cree un fichier log, affiche une barre de progression et gere
les erreurs avec try/catch.
#############################################>

$ErrorActionPreference = 'Stop'

# Parametres de base
$Source = "$env:USERPROFILE\Documents"
$DestinationRoot = "C:\Backup"

# Horodatage pour dossier et log
$stamp = (Get-Date).ToString('yyyyMMdd_HHmmss')
$BackupDir = Join-Path $DestinationRoot "backup_$stamp"
$LogFile = Join-Path $DestinationRoot "backup_$stamp.log"

function Write-Log {
    param(
        [string]$Level,
        [string]$Message
    )

    $line = "[{0}] [{1}] {2}" -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'), $Level, $Message
    Add-Content -Path $LogFile -Value $line

    switch ($Level) {
        'SUCCESS' { Write-Host $line -ForegroundColor Green }
        'WARNING' { Write-Host $line -ForegroundColor Yellow }
        'ERROR'   { Write-Host $line -ForegroundColor Red }
        default   { Write-Host $line -ForegroundColor Gray }
    }
}

try {
    # Verifier la source
    $SourcePath = (Resolve-Path $Source).Path.TrimEnd('\')
    Write-Log -Level 'INFO' -Message "Source: $SourcePath"

    # Creer le dossier de destination
    if (-not (Test-Path $DestinationRoot)) {
        New-Item -Path $DestinationRoot -ItemType Directory -Force | Out-Null
    }
    New-Item -Path $BackupDir -ItemType Directory -Force | Out-Null

    Write-Log -Level 'INFO' -Message "Destination: $BackupDir"

    # Lister les fichiers a copier
    $files = Get-ChildItem -Path $SourcePath -Recurse -File
    $totalFiles = $files.Count

    if ($totalFiles -eq 0) {
        Write-Log -Level 'WARNING' -Message 'Aucun fichier a copier.'
        exit 0
    }

    $index = 0
    $totalBytes = 0

    foreach ($file in $files) {
        $index++

        # Construire le chemin relatif
        $relative = $file.FullName.Substring($SourcePath.Length).TrimStart('\')
        $destFile = Join-Path $BackupDir $relative
        $destDir = Split-Path $destFile -Parent

        if (-not (Test-Path $destDir)) {
            New-Item -Path $destDir -ItemType Directory -Force | Out-Null
        }

        $percent = [math]::Round(($index / $totalFiles) * 100, 0)
        Write-Progress -Activity 'Sauvegarde en cours' -Status "$index / $totalFiles" -PercentComplete $percent

        Copy-Item -Path $file.FullName -Destination $destFile -Force
        $totalBytes += $file.Length
    }

    $totalGB = [math]::Round($totalBytes / 1GB, 2)
    Write-Log -Level 'SUCCESS' -Message "Fichiers copies: $totalFiles"
    Write-Log -Level 'SUCCESS' -Message "Taille totale: $totalGB GB"
    Write-Log -Level 'SUCCESS' -Message "Log: $LogFile"
}
catch {
    Write-Log -Level 'ERROR' -Message $_.Exception.Message
    Write-Log -Level 'ERROR' -Message 'La sauvegarde a echoue.'
    throw
}
