# Challenge : Jeu du Plus ou Moins (Version Fun)
# Auteur : Freed
# Reprise de la base du même jeu créé précédemment en Python
# Vers 2.0 - Fonctionnalités avancées (Scores & Limites)

Clear-Host
$Rejouer = "oui"
$Historique = @() # Création d'une liste vide pour stocker les scores

while ($Rejouer -eq "oui") {
    
    Clear-Host
    Write-Host "==========================================" -ForegroundColor Magenta
    Write-Host "      JEU DU PLUS OU MOINS (v2.0)         " -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor Magenta
    Write-Host ""
    
    Write-Host "RÈGLES : Eh toi là ! Tu dois me retrouver un nombre entre 1 et 100 ! (o㇃o)" -ForegroundColor Yellow
    Write-Host "ATTENTION : T'as que 10 essais sinon t'es viré !" -ForegroundColor Red
    Write-Host ""

    $NombreSecret = Get-Random -Minimum 1 -Maximum 101
    $Essais = 0
    $MaxTentatives = 10

    while ($true) {
        $Essais++
        
        try {
            # Affichage du compteur avec vies restantes
            $Saisie = Read-Host "[Essai $Essais / $MaxTentatives] Alors ? (⚆᭹⚆) "
            
            if ([string]::IsNullOrWhiteSpace($Saisie)) { throw "Vide" }
            $Nombre = [int]$Saisie

            if ($Nombre -lt 1 -or $Nombre -gt 100) {
                Write-Host "Hep hep hep ! Entre 1 et 100 j'ai dit ! (o_O)" -ForegroundColor Red
                $Essais-- 
                continue
            }
        }
        catch {
            Write-Host "Heu... j'ai dit un nombre valide..." -ForegroundColor Red
            $Essais-- 
            continue
        }

        # --- LOGIQUE DU JEU ---
        if ($Nombre -eq $NombreSecret) {
            # VICTOIRE
            Write-Host "Pas mal larbin, t'as trouvé le nombre mystère en $Essais essais ! (•_•)" -ForegroundColor Cyan
            $Historique += $Essais # On ajoute le score à l'historique
            break 
        }
        elseif ($Essais -ge $MaxTentatives) {
            # DEFAITE (Si on atteint 10 essais sans trouver)
            Write-Host "PERDU ! T'es nul, le nombre était $NombreSecret... (X_X)" -ForegroundColor Red
            break
        }
        elseif ($Nombre -lt $NombreSecret) {
            Write-Host "C'est plus ! (Reste $($MaxTentatives - $Essais) vies)" -ForegroundColor Blue
        }
        else {
            Write-Host "C'est moins ! (Reste $($MaxTentatives - $Essais) vies)" -ForegroundColor Green
        }
    }

    # --- FIN DE PARTIE & STATS ---
    Write-Host "------------------------------------------" -ForegroundColor Gray
    if ($Historique.Count -gt 0) {
        # On trie les scores du plus petit au plus grand et on prend le premier
        $MeilleurScore = $Historique | Measure-Object -Minimum
        Write-Host "🏆 Ton meilleur score pour l'instant : $($MeilleurScore.Minimum) essais" -ForegroundColor Yellow
    }
    else {
        Write-Host "Pas encore de victoire... Au boulot ! (¬_¬)" -ForegroundColor Gray
    }
    Write-Host "------------------------------------------" -ForegroundColor Gray

    Write-Host ""
    $Rejouer = Read-Host "Une petite dernière ? (oui/non) "
}

Write-Host "Dégonflé ! (◡_◡)" -ForegroundColor Magenta