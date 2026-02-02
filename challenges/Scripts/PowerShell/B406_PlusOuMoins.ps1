# Challenge : Jeu du Plus ou Moins (Version Fun)
# Auteur : Freed
# Reprise de la base du même jeu créé précédemment en Python
# Vers 1.1

Clear-Host
$Rejouer = "oui"

while ($Rejouer -eq "oui") {
    
    # --- AMELIORATION VISUELLE (TITRE) ---
    Clear-Host
    Write-Host "==========================================" -ForegroundColor Magenta
    Write-Host "      JEU DU PLUS OU MOINS (v1.1)         " -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor Magenta
    Write-Host ""
    
    # La phrase d'intro en Jaune
    Write-Host "RÈGLES : Eh toi là ! Tu dois me retrouver un nombre entre 1 et 100 ! (o㇃o)" -ForegroundColor Yellow
    Write-Host "Je te dirai si c'est plus ou moins." -ForegroundColor Yellow
    Write-Host ""

    $NombreSecret = Get-Random -Minimum 1 -Maximum 101
    $Essais = 0

    while ($true) {
        $Essais++
        
        try {
            # Ajout du compteur d'essais
            $Saisie = Read-Host "[Essai $Essais] Alors ? (⚆᭹⚆) "
            $Nombre = [int]$Saisie
        }
        catch {
            Write-Host "Heu... j'ai dit un nombre..." -ForegroundColor Red
            continue
        }

        # --- COULEURS IMPOSÉES ---
        if ($Nombre -eq $NombreSecret) {
            # La phrase de victoire (•_•) en CYAN
            Write-Host "Pas mal larbin, t'as trouvé le nombre mystère en $Essais essais ! (•_•)" -ForegroundColor Cyan
            break 
        }
        elseif ($Nombre -lt $NombreSecret) {
            # BLEU pour "Plus grand"
            Write-Host "C'est plus !" -ForegroundColor Blue
        }
        else {
            # VERT pour "Plus petit"
            Write-Host "C'est moins !" -ForegroundColor Green
        }
    }

    Write-Host ""
    $Rejouer = Read-Host "Une petite dernière ? (oui/non) "
}

Write-Host "Dégonflé ! (◡_◡)" -ForegroundColor Magenta