<#############################################
.SYNOPSIS
Monitoring systeme en temps reel.

.DESCRIPTION
Affiche CPU, memoire, disque et top 5 CPU en boucle
avec des couleurs selon des seuils.
#############################################>

function Get-SystemMetrics {
    # CPU en % via compteur de performance
    $cpu = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples[0].CookedValue

    # Memoire
    $os = Get-CimInstance -ClassName Win32_OperatingSystem
    $totalMemGB = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)
    $freeMemGB = [math]::Round($os.FreePhysicalMemory / 1MB, 2)
    $usedMemGB = [math]::Round($totalMemGB - $freeMemGB, 2)
    $memPercent = [math]::Round(($usedMemGB / $totalMemGB) * 100, 0)

    # Disque C:
    $disk = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DeviceID='C:'"
    $diskTotalGB = [math]::Round($disk.Size / 1GB, 2)
    $diskFreeGB = [math]::Round($disk.FreeSpace / 1GB, 2)
    $diskUsedGB = [math]::Round($diskTotalGB - $diskFreeGB, 2)
    $diskPercent = [math]::Round(($diskUsedGB / $diskTotalGB) * 100, 0)

    return [pscustomobject]@{
        CpuPercent = [math]::Round($cpu, 0)
        MemPercent = $memPercent
        MemUsedGB = $usedMemGB
        MemTotalGB = $totalMemGB
        DiskPercent = $diskPercent
        DiskUsedGB = $diskUsedGB
        DiskTotalGB = $diskTotalGB
    }
}

function Write-ColoredValue {
    param(
        [string]$Label,
        [double]$Value,
        [string]$Suffix = ''
    )

    $color = 'Green'
    if ($Value -ge 50 -and $Value -lt 80) { $color = 'Yellow' }
    if ($Value -ge 80) { $color = 'Red' }

    Write-Host ("{0}: {1}{2}" -f $Label, $Value, $Suffix) -ForegroundColor $color
}

while ($true) {
    Clear-Host
    $now = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    Write-Host "MONITORING SYSTEME - $now" -ForegroundColor Cyan
    Write-Host "----------------------------------------------" -ForegroundColor Cyan

    $m = Get-SystemMetrics

    Write-ColoredValue -Label 'CPU' -Value $m.CpuPercent -Suffix '%'
    Write-ColoredValue -Label 'Memoire' -Value $m.MemPercent -Suffix "% ($($m.MemUsedGB) / $($m.MemTotalGB) GB)"
    Write-ColoredValue -Label 'Disque C:' -Value $m.DiskPercent -Suffix "% ($($m.DiskUsedGB) / $($m.DiskTotalGB) GB)"

    Write-Host "" 
    Write-Host "Top 5 processus CPU" -ForegroundColor Magenta
    Get-Process | Sort-Object CPU -Descending | Select-Object -First 5 Name, CPU | Format-Table -AutoSize

    Start-Sleep -Seconds 5
}
