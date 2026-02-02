# Challenge : Jeu du Plus ou Moins (Version Fun)
# Auteur : Freed
# Vers 3.1 - Sauvegarde des scores (CSV)

Clear-Host
$FichierScores = "scores.csv"

# Boucle du Menu Principal
while ($true) {
    
    # --- TITRE ---
    Clear-Host
    Write-Host "==========================================" -ForegroundColor Magenta
    Write-Host "      JEU DU PLUS OU MOINS (v3.1)         " -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor Magenta
    Write-Host ""

    # --- MENU PRINCIPAL ---
    Write-Host "QUE VEUX-TU FAIRE ?" -ForegroundColor Yellow
    Write-Host "1. Jouer contre l'Ordinateur (Solo)" -ForegroundColor Green
    Write-Host "2. Jouer contre un Pote (Duel)" -ForegroundColor Cyan
    Write-Host "3. Voir le Tableau des Scores (Hall of Fame)" -ForegroundColor Blue
    Write-Host "4. Quitter (Fuir)" -ForegroundColor Red
    Write-Host ""
    
    $ChoixMenu = Read-Host "Ton choix (1-4)"
    
    if ($ChoixMenu -eq "4") {
        Write-Host "Dégonflé ! (◡_◡)" -ForegroundColor Magenta
        break
    }
    
    if ($ChoixMenu -eq "3") {
        # --- AFFICHAGE DES SCORES ---
        Clear-Host
        Write-Host "--- HALL OF FAME ---" -ForegroundColor Yellow
        if (Test-Path $FichierScores) {
            # On importe, on trie par essais (le plus petit en premier), et on affiche
            Import-Csv $FichierScores | Sort-Object {[int]$_.Essais} | Format-Table -AutoSize
        } else {
            Write-Host "Aucun score enregistré pour l'instant. Tout est à faire !" -ForegroundColor Gray
        }
        Write-Host ""
        Pause
        continue # Retour au menu
    }

    # Si on est ici, c'est qu'on joue (Choix 1 ou 2)
    if ($ChoixMenu -ne "1" -and $ChoixMenu -ne "2") { continue }

    # --- CONFIGURATION DE LA PARTIE ---
    if ($ChoixMenu -eq "1") {
        # --- MODE SOLO ---
        Clear-Host
        Write-Host "CHOISIS TA SOUFFRANCE :" -ForegroundColor Yellow
        Write-Host "1. Noob           (1 à 50  | 15 vies)" -ForegroundColor Green
        Write-Host "2. Normal          (1 à 100 | 10 vies)" -ForegroundColor Yellow
        Write-Host "3. Ultra-Violence (1 à 200 |  8 vies) ☠️" -ForegroundColor Red
        
        $ChoixDiff = Read-Host "Ton choix"
        switch ($ChoixDiff) {
            "1" { $MaxNombre = 51; $MaxTentatives = 15; $NomNiveau = "NOOB" }
            "2" { $MaxNombre = 101; $MaxTentatives = 10; $NomNiveau = "NORMAL" }
            "3" { $MaxNombre = 201; $MaxTentatives = 8; $NomNiveau = "ULTRA-VIOLENCE" }
            Default { $MaxNombre = 101; $MaxTentatives = 10; $NomNiveau = "NORMAL" }
        }
        $NombreSecret = Get-Random -Minimum 1 -Maximum $MaxNombre
        $IntroMessage = "RÈGLES : Trouve le nombre entre 1 et $($MaxNombre - 1) !"

    } else {
        # --- MODE DUEL ---
        Clear-Host
        Write-Host "--- MODE PVP ---" -ForegroundColor Cyan
        Write-Host "JOUEUR 1 : Cache ton écran !" -ForegroundColor Red
        $MaxNombre = 101; $MaxTentatives = 10; $NomNiveau = "DUEL"
        $NombreSecret = 0
        while ($NombreSecret -lt 1 -or $NombreSecret -gt 100) {
            try { $NombreSecret = [int](Read-Host "JOUEUR 1 > Nombre mystère (1-100)") } catch {}
        }
        Clear-Host
        Write-Host "Secret verrouillé." -ForegroundColor Gray
        $IntroMessage = "RÈGLES : Joueur 2, trouve le nombre du Joueur 1 (1-100) !"
    }

    # --- JEU ---
    Write-Host "`n$IntroMessage" -ForegroundColor Yellow
    Write-Host "Niveau : $NomNiveau | Vies : $MaxTentatives`n" -ForegroundColor Cyan

    $Essais = 0
    $Victoire = $false

    while ($true) {
        $Essais++
        try {
            $Saisie = Read-Host "[Essai $Essais / $MaxTentatives] Alors ? (⚆᭹⚆) "
            if ([string]::IsNullOrWhiteSpace($Saisie)) { throw }
            $Nombre = [int]$Saisie
            if ($Nombre -lt 1 -or $Nombre -ge $MaxNombre) { throw }
        } catch {
            Write-Host "Invalide ! (o_O)" -ForegroundColor Red; $Essais--; continue
        }

        if ($Nombre -eq $NombreSecret) {
            Write-Host "BRAVO Larbin ! T'as trouvé en $Essais essais ! (•_•)" -ForegroundColor Cyan
            $Victoire = $true
            break 
        } elseif ($Essais -ge $MaxTentatives) {
            Write-Host "PERDU Larbin ! C'était $NombreSecret... (X_X)" -ForegroundColor Red
            break
        } elseif ($Nombre -lt $NombreSecret) {
            Write-Host "C'est plus !" -ForegroundColor Blue
        } else {
            Write-Host "C'est moins !" -ForegroundColor Green
        }
    }

    # --- SAUVEGARDE DU SCORE ---
    if ($Victoire) {
        $NomJoueur = Read-Host "Entre ton nom pour la légende (Vide pour ignorer)"
        if (-not [string]::IsNullOrWhiteSpace($NomJoueur)) {
            # Création de l'objet Score
            $NouveauScore = [PSCustomObject]@{
                Date    = Get-Date -Format "yyyy-MM-dd HH:mm"
                Joueur  = $NomJoueur
                Niveau  = $NomNiveau
                Essais  = $Essais
            }
            # Export vers CSV (Append pour ajouter à la suite)
            $NouveauScore | Export-Csv -Path $FichierScores -Append -NoTypeInformation -Encoding UTF8
            Write-Host "✅ Score sauvegardé !" -ForegroundColor Green
        }
    }
    
    Write-Host ""
    Pause
}