# Challenge : Jeu du Plus ou Moins (Version Fun)
# Auteur : Freed
# Reprise de la base du même jeu créé précédemment en Python
# Vers 3.0 - Mode 2 Joueurs

Clear-Host
$Rejouer = "oui"
$Historique = @() 

while ($Rejouer -eq "oui") {
    
    # --- TITRE ---
    Clear-Host
    Write-Host "==========================================" -ForegroundColor Magenta
    Write-Host "      JEU DU PLUS OU MOINS (v3.0)         " -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor Magenta
    Write-Host ""

    # --- MENU PRINCIPAL (MODE DE JEU) ---
    Write-Host "A QUI VEUX-TU T'ATTAQUER ?" -ForegroundColor Yellow
    Write-Host "1. Contre l'Ordinateur (Solo)" -ForegroundColor Green
    Write-Host "2. Contre un Pote (Duel)" -ForegroundColor Cyan
    Write-Host ""
    
    $ModeJeu = Read-Host "Ton choix (1 ou 2)"
    while ($ModeJeu -ne "1" -and $ModeJeu -ne "2") {
        $ModeJeu = Read-Host "1 ou 2... Fais un effort (o_O)"
    }

    # --- CONFIGURATION DE LA PARTIE ---
    if ($ModeJeu -eq "1") {
        # --- MODE SOLO (Choix difficulté) ---
        Clear-Host
        Write-Host "CHOISIS TA SOUFFRANCE :" -ForegroundColor Yellow
        Write-Host "1. Noob           (1 à 50  | 15 vies)" -ForegroundColor Green
        Write-Host "2. Normal          (1 à 100 | 10 vies)" -ForegroundColor Yellow
        Write-Host "3. Ultra-Violence (1 à 200 |  8 vies) ☠️" -ForegroundColor Red
        Write-Host ""

        $ChoixDiff = Read-Host "Ton choix (1/2/3)"
        switch ($ChoixDiff) {
            "1" { $MaxNombre = 51; $MaxTentatives = 15; $NomNiveau = "NOOB" }
            "2" { $MaxNombre = 101; $MaxTentatives = 10; $NomNiveau = "MOYEN" }
            "3" { $MaxNombre = 201; $MaxTentatives = 8; $NomNiveau = "ULTRA-VIOLENCE" }
            Default { 
                # Par défaut si mauvais choix -> Moyen
                $MaxNombre = 101; $MaxTentatives = 10; $NomNiveau = "MOYEN (Par défaut)" 
            }
        }
        
        # L'ordi choisit le nombre
        $NombreSecret = Get-Random -Minimum 1 -Maximum $MaxNombre
        $IntroMessage = "RÈGLES : Trouve le nombre entre 1 et $($MaxNombre - 1) !"

    } else {
        # --- MODE DUEL (Joueur 1 choisit) ---
        Clear-Host
        Write-Host "--- MODE DUEL ---" -ForegroundColor Cyan
        Write-Host "JOUEUR 1 : Ne laisse pas le Joueur 2 regarder !" -ForegroundColor Red
        
        # On force un nombre valide entre 1 et 100 pour le duel
        $MaxNombre = 101
        $MaxTentatives = 10
        $NomNiveau = "DUEL (1vs1)"
        $NombreSecret = 0

        while ($NombreSecret -lt 1 -or $NombreSecret -gt 100) {
            try {
                $SaisieJ1 = Read-Host "JOUEUR 1 > Entre le nombre mystère (1-100)"
                $NombreSecret = [int]$SaisieJ1
            } catch {
                Write-Host "Un nombre entier stp..." -ForegroundColor Red
            }
        }

        # ON EFFACE L'ECRAN POUR CACHER LE NOMBRE
        Clear-Host
        Write-Host "L'écran a été effacé pour la sécurité du secret..." -ForegroundColor Gray
        Write-Host "JOUEUR 2 : C'est à toi de jouer ! (o㇃o)" -ForegroundColor Yellow
        $IntroMessage = "RÈGLES : Joueur 2, trouve le nombre du Joueur 1 (1-100) !"
    }

    # --- LANCEMENT DU JEU (Commun aux deux modes) ---
    Write-Host ""
    Write-Host $IntroMessage -ForegroundColor Yellow
    Write-Host "Niveau : $NomNiveau | Vies : $MaxTentatives" -ForegroundColor Cyan
    Write-Host ""

    $Essais = 0
    while ($true) {
        $Essais++
        
        try {
            $Saisie = Read-Host "[Essai $Essais / $MaxTentatives] Alors ? (⚆᭹⚆) "
            if ([string]::IsNullOrWhiteSpace($Saisie)) { throw "Vide" }
            $Nombre = [int]$Saisie

            if ($Nombre -lt 1 -or $Nombre -ge $MaxNombre) {
                Write-Host "Hep ! Hors limites ! (o_O)" -ForegroundColor Red
                $Essais-- 
                continue
            }
        }
        catch {
            Write-Host "Un nombre valide stp..." -ForegroundColor Red
            $Essais-- 
            continue
        }

        if ($Nombre -eq $NombreSecret) {
            Write-Host "BRAVO ! T'as trouvé en $Essais essais ! (•_•)" -ForegroundColor Cyan
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
        Write-Host "🏆 Meilleur score session : $($MeilleurScore.Minimum) essais" -ForegroundColor Yellow
    }
    Write-Host "------------------------------------------" -ForegroundColor Gray

    Write-Host ""
    if ($ModeJeu -eq "2") {
        Write-Host "Astuce : Échangez les rôles pour la prochaine partie !" -ForegroundColor Gray
    }
    $Rejouer = Read-Host "Une petite dernière ? (oui/non) "
}

Write-Host "Dégonflé ! (◡_◡)" -ForegroundColor Magenta