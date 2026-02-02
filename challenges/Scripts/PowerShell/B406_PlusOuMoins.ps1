# Challenge : Jeu du Plus ou Moins (Version Fun)
# Auteur : Freed
# Reprise de la base du même jeu créé précédemment en Python
# Vers 2.1 - Niveaux de difficulté

Clear-Host
$Rejouer = "oui"
$Historique = @() 

while ($Rejouer -eq "oui") {
    
    # --- TITRE ---
    Clear-Host
    Write-Host "==========================================" -ForegroundColor Magenta
    Write-Host "      JEU DU PLUS OU MOINS (v2.1)         " -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor Magenta
    Write-Host ""

    # --- MENU DIFFICULTÉ ---
    Write-Host "CHOISIS TON DESTIN LARBIN :" -ForegroundColor Yellow
    Write-Host "1. Facile    (1 à 50  | 15 vies) - Mode Noob" -ForegroundColor Green
    Write-Host "2. Moyen     (1 à 100 | 10 vies) - Mode Normal" -ForegroundColor Yellow
    Write-Host "3. Difficile (1 à 200 |  8 vies) - Mode Ultra-violence ☠️" -ForegroundColor Red
    Write-Host ""

    $ChoixValide = $false
    while (-not $ChoixValide) {
        $Choix = Read-Host "Ton choix (1/2/3)"
        switch ($Choix) {
            "1" { 
                $MaxNombre = 51; $MaxTentatives = 15; $NomNiveau = "FACILE"
                Write-Host "Pff... petit joueur !" -ForegroundColor Gray
                $ChoixValide = $true 
            }
            "2" { 
                $MaxNombre = 101; $MaxTentatives = 10; $NomNiveau = "MOYEN"
                Write-Host "Ok, classique." -ForegroundColor Gray
                $ChoixValide = $true 
            }
            "3" { 
                $MaxNombre = 201; $MaxTentatives = 8; $NomNiveau = "DIFFICILE"
                Write-Host "Bonne chance, t'en auras besoin..." -ForegroundColor Red
                $ChoixValide = $true 
            }
            Default { Write-Host "1, 2 ou 3... c'est pas compliqué pourtant !" -ForegroundColor Red }
        }
    }
    
    Write-Host ""
    Write-Host "RÈGLES : Trouve le nombre entre 1 et $($MaxNombre - 1) ! (o㇃o)" -ForegroundColor Yellow
    Write-Host "Niveau : $NomNiveau | Vies : $MaxTentatives" -ForegroundColor Cyan
    Write-Host ""

    $NombreSecret = Get-Random -Minimum 1 -Maximum $MaxNombre
    $Essais = 0

    while ($true) {
        $Essais++
        
        try {
            $Saisie = Read-Host "[Essai $Essais / $MaxTentatives] Alors ? (⚆᭹⚆) "
            
            if ([string]::IsNullOrWhiteSpace($Saisie)) { throw "Vide" }
            $Nombre = [int]$Saisie

            if ($Nombre -lt 1 -or $Nombre -ge $MaxNombre) {
                Write-Host "Hep ! Entre 1 et $($MaxNombre - 1) stp ! (o_O)" -ForegroundColor Red
                $Essais-- 
                continue
            }
        }
        catch {
            Write-Host "Un nombre valide stp..." -ForegroundColor Red
            $Essais-- 
            continue
        }

        # --- LOGIQUE ---
        if ($Nombre -eq $NombreSecret) {
            Write-Host "Pas mal, t'as trouvé en $Essais essais ! (•_•)" -ForegroundColor Cyan
            $Historique += $Essais
            break 
        }
        elseif ($Essais -ge $MaxTentatives) {
            Write-Host "PERDU ! Le nombre était $NombreSecret... (X_X)" -ForegroundColor Red
            break
        }
        elseif ($Nombre -lt $NombreSecret) {
            Write-Host "C'est plus ! (Reste $($MaxTentatives - $Essais) vies)" -ForegroundColor Blue
        }
        else {
            Write-Host "C'est moins ! (Reste $($MaxTentatives - $Essais) vies)" -ForegroundColor Green
        }
    }

    # --- STATS ---
    Write-Host "------------------------------------------" -ForegroundColor Gray
    if ($Historique.Count -gt 0) {
        $MeilleurScore = $Historique | Measure-Object -Minimum
        Write-Host "🏆 Meilleur score : $($MeilleurScore.Minimum) essais" -ForegroundColor Yellow
    }
    Write-Host "------------------------------------------" -ForegroundColor Gray

    Write-Host ""
    $Rejouer = Read-Host "Une petite dernière ? (oui/non) "
}

Write-Host "Dégonflé ! (◡_◡)" -ForegroundColor Magenta