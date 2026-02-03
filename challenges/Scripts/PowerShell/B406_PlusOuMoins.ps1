<#
.SYNOPSIS
    Jeu du Plus ou Moins (Version 3.4 - Ultimate Edition)

.DESCRIPTION
    Version finale avec bonus :
    - Sons et Animations ASCII
    - Chronomètre (Time Attack)
    - Statistiques avancées (Taux de victoire, Moyenne)
    - Indice intelligent au 7ème tour

    - 3.4 : Correctifs de syntaxe et respect des conventions PowerShell.
.AUTHOR
    Freed

.DATE
    03/02/2026
#>

# --- CONFIGURATION ---
Clear-Host
$FichierScores = "scores.csv"

# Fonction Renommée pour plaire à VS Code (Verbe 'Invoke' approuvé)
function Invoke-Sound ($Type) {
    if ($IsWindows) {
        switch ($Type) {
            "Plus"  { [console]::Beep(400, 150) }
            "Moins" { [console]::Beep(1000, 150) }
            "Win"   { 
                [console]::Beep(523, 100); [console]::Beep(659, 100); 
                [console]::Beep(784, 100); [console]::Beep(1046, 300) 
            }
            "Lose"  { [console]::Beep(200, 400) }
        }
    }
}

# Fonction ASCII ART Victoire
function Show-VictoryArt {
    Write-Host "                                                            
        ▄▄▄   ▄▄▄   ▄▄▄▄▄   ▄▄▄  ▄▄▄   ▄▄▄▄  ▄▄▄  ▄▄▄▄ ▄▄▄▄▄ ▄▄▄    ▄▄▄    ▄▄ 
        ███   ███ ▄███████▄ ███  ███   ▀███  ███  ███▀  ███  ████▄  ███    ██ 
        ▀███▄███▀ ███   ███ ███  ███    ███  ███  ███   ███  ███▀██▄███    ██ 
          ▀███▀   ███▄▄▄███ ███▄▄███    ███▄▄███▄▄███   ███  ███  ▀████    ▀▀ 
           ███     ▀█████▀  ▀██████▀     ▀████▀████▀   ▄███▄ ███    ███    ██ 
                                                                                                                     
    " -ForegroundColor Yellow
}

while ($true) {
    
    # --- TITRE ---
    Clear-Host
    Write-Host "==========================================" -ForegroundColor Magenta
    Write-Host "      JEU DU PLUS OU MOINS (v3.4)         " -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor Magenta
    Write-Host ""

    # --- MENU ---
    Write-Host "QUE VEUX-TU FAIRE ?" -ForegroundColor Yellow
    Write-Host "1. Jouer contre l'Ordinateur (Solo)" -ForegroundColor Green
    Write-Host "2. Jouer contre un Pote ⚔️ (Duel)" -ForegroundColor Cyan
    Write-Host "3. Voir les Statistiques 🏆" -ForegroundColor Yellow
    Write-Host "4. Quitter" -ForegroundColor Gray
    Write-Host ""
    
    $ChoixMenu = Read-Host "Ton choix (1-4)"
    
    if ($ChoixMenu -eq "4") { Write-Host "Bye ! (◡_◡)" -ForegroundColor Magenta; break }
    
    # --- STATISTIQUES ---
    if ($ChoixMenu -eq "3") {
        Clear-Host
        Write-Host "--- STATISTIQUES ---" -ForegroundColor Yellow
        if (Test-Path $FichierScores) {
            $Data = Import-Csv $FichierScores
            $TotalGames = $Data.Count
            
            # Correction compatibilité
            $Victoires = $Data | Where-Object { $_.Resultat -eq "Gagné" -or [string]::IsNullOrWhiteSpace($_.Resultat) }
            $NbVictoires = $Victoires.Count
            
            $TauxVictoire = if ($TotalGames -gt 0) { [math]::Round(($NbVictoires / $TotalGames) * 100, 1) } else { 0 }
            
            $MoyenneEssais = if ($NbVictoires -gt 0) { 
                ($Victoires | Measure-Object -Property Essais -Average).Average 
            } else { 0 }

            Write-Host "Parties jouées : $TotalGames"
            Write-Host "Taux victoire  : $TauxVictoire %" -ForegroundColor Green
            Write-Host "Moyenne essais : $([math]::Round($MoyenneEssais, 1))" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "--- TOP 5 ---" -ForegroundColor Yellow
            $Victoires | Sort-Object {[int]$_.Essais} | Select-Object -First 5 | Format-Table -AutoSize
        } else {
            Write-Host "Aucune donnée." -ForegroundColor Gray
        }
        Pause
        continue
    }

    if ($ChoixMenu -ne "1" -and $ChoixMenu -ne "2") { continue }

    # --- SETUP PARTIE ---
    if ($ChoixMenu -eq "1") {
        Clear-Host
        Write-Host "CHOIX DIFFICULTÉ :" -ForegroundColor Yellow
        Write-Host "1. Noob           (1-50  | 15 vies | 120s)" -ForegroundColor Green
        Write-Host "2. Normal         (1-100 | 10 vies |  90s)" -ForegroundColor Yellow
        Write-Host "3. Ultra-Violence (1-200 |  8 vies |  60s)" -ForegroundColor Red
        
        $ChoixDiff = Read-Host "Ton choix"
        switch ($ChoixDiff) {
            "1" { $MaxN = 51; $MaxT = 15; $MaxSec = 120; $Niv = "NOOB" }
            "2" { $MaxN = 101; $MaxT = 10; $MaxSec = 90; $Niv = "NORMAL" }
            "3" { $MaxN = 201; $MaxT = 8; $MaxSec = 60; $Niv = "ULTRA-VIOLENCE" }
            Default { $MaxN = 101; $MaxT = 10; $MaxSec = 90; $Niv = "NORMAL" }
        }
        $Secret = Get-Random -Min 1 -Max $MaxN
        $MsgIntro = "Trouve entre 1 et $($MaxN - 1) en moins de $MaxSec secondes !"

    } else {
        # MODE DUEL
        Clear-Host
        Write-Host "--- MODE PVP ---" -ForegroundColor Cyan
        $MaxN = 101; $MaxT = 10; $MaxSec = 999; $Niv = "DUEL"
        $Secret = 0
        while ($Secret -lt 1 -or $Secret -gt 100) { try { $Secret = [int](Read-Host "JOUEUR 1 > Secret (1-100)") } catch {} }
        Clear-Host; Write-Host "Verrouillé." -ForegroundColor Gray
        $MsgIntro = "Joueur 2, c'est à toi !"
    }

    # --- JEU ---
    Write-Host "`n$MsgIntro" -ForegroundColor Yellow
    Write-Host "Niveau : $Niv | Vies : $MaxT | Temps : ${MaxSec}s`n" -ForegroundColor Cyan

    $Essais = 0
    $Victoire = $false
    $Debut = Get-Date

    while ($true) {
        # Chrono
        $TempsEcoule = (Get-Date) - $Debut
        if ($TempsEcoule.TotalSeconds -ge $MaxSec) {
            Invoke-Sound "Lose"
            Write-Host "`nTEMPS ÉCOULÉ ! (X_X)" -ForegroundColor Red
            Write-Host "C'était $Secret." -ForegroundColor Gray
            break
        }

        $Essais++

        # Indice
        if ($Essais -eq 7) {
            Write-Host "INDICE : $(if ($Secret % 2 -eq 0) {'PAIR'} else {'IMPAIR'}) !" -ForegroundColor Magenta
        }

        try {
            $Restant = [math]::Round($MaxSec - $TempsEcoule.TotalSeconds)
            $Saisie = Read-Host "[Tour $Essais/$MaxT | ${Restant}s] Nombre"
            if ([string]::IsNullOrWhiteSpace($Saisie)) { throw }
            $Nb = [int]$Saisie
            if ($Nb -lt 1 -or $Nb -ge $MaxN) { throw }
        } catch {
            Write-Host "Invalide !" -ForegroundColor Red; $Essais--; continue
        }

        if ($Nb -eq $Secret) {
            Invoke-Sound "Win"
            Show-VictoryArt
            Write-Host "BRAVO ! Trouvé en $Essais essais ! (•_•)" -ForegroundColor Cyan
            $Victoire = $true
            break 
        } elseif ($Essais -ge $MaxT) {
            Invoke-Sound "Lose"
            Write-Host "PERDU ! C'était $Secret (X_X)" -ForegroundColor Red
            break
        } elseif ($Nb -lt $Secret) {
            Invoke-Sound "Plus"
            Write-Host "C'est PLUS !" -ForegroundColor Blue
        } else {
            Invoke-Sound "Moins"
            Write-Host "C'est MOINS !" -ForegroundColor Green
        }
    }

    # --- SAUVEGARDE ---
    $Nom = Read-Host "Pseudo (Vide pour ignorer)"
    if (-not [string]::IsNullOrWhiteSpace($Nom)) {
        $Resultat = if ($Victoire) { "Gagné" } else { "Perdu" }
        $NewScore = [PSCustomObject]@{
            Date = Get-Date -Format "yyyy-MM-dd HH:mm"
            Joueur = $Nom; Niveau = $Niv; Essais = $Essais; Resultat = $Resultat
        }
        $NewScore | Export-Csv -Path $FichierScores -Append -NoTypeInformation -Encoding UTF8 -Force
        Write-Host "Sauvegardé !" -ForegroundColor Green
    }
    Write-Host ""; Pause
}