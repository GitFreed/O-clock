# Le module "random" permet de générer des nombres aléatoire
# L'import de module dans python permet d'ajouter certaines fonctionnalitées
import random

# MAX est une constante (on ecrit les constantes en majuscule)
# Ca nous permet de configurer le nombre max que l'on peux avoir
MAX = 1000

# BONUS :
# On crée une variable pour savoir si le joueur souhaite rejouer ou non
# au début, on met oui par defaut pour lancer au moins une partie 
rejouer = "oui"

# Tant que le joueur répond oui à rejouer, on continue
# Tout le contenu de mon jeu se retrouve dans la boucle rejouer
while rejouer == "oui":
    # Permet de générer un nombre entier aléatoire entre 1 et 100
    nombre_secret = random.randint(1, MAX)

    # Variable pour savoir si le nombre est trouvé ou non (False par defaut)
    trouve = False

    # Compteur de tentatives
    tentatives = 0

    # Tant que le nombre n'est pas trouvé, on continue a demander
    # trouve == False est la condition de boucle
    # tant que la condition est vrai, alors la boucle continue
    while trouve == False:

        # Si jamais l'utilisateur entre du texte a la place d'un nombre, le int() va faire une erreur
        # Au lieu de faire crash le script, nous utilisont try except pour s'assurer de continuer notre script
        try:
            # On demande a l'utilisateur de proposer un nombre
            # input récupère du texte, int() le transforme en nombre
            proposition = int(input(f"Devinez le nombre (entre 1 et {MAX}) : "))
        # Dans le except, nous pouvons récupérer l'erreur, et gérer le cas ou la proposition n'est pas bonne
        except:
            print("Merci d'entrer un nombre valide.")
            continue

        # On ajoute 1 au compteur de tentatives 
        tentatives += 1
        # tentatives = tentatives + 1

        # Si le nombre proposé est plus grand que 100 ou plus petit que 1
        if proposition > MAX or proposition < 1:
            # On affiche un message d'erreur
            print(f"Veuillez choisir un nombre entre 1 et {MAX}")
            # Et on continue un nouveau tour de boucle sans executer, pour cette fois, le code en dessous
            continue

        # Si la proposition est plus petite que le nombre secret
        if proposition < nombre_secret:
            print("C'est plus !")
        
        # Si la proposition est plus grande que le nombre secret
        elif proposition > nombre_secret:
            print("C'est moins !")
        
        # Si la proposition est ni plus grande, ni plus petite, alors c'est le bon nombre !
        else:
            print("Bravo vous avez trouvé !")
            # en mettant un f avant les "", je peux ajouter directement mes variables entre {} dans ma chaine de caractere
            print(f"Nombre de tentatives : {tentatives}")
            if tentatives > 10:
                print("T'es nul frère")
            else:
                print("Bien joué")
            trouve = True
    
    rejouer = input("Voulez-vous rejouer ? (oui / non) : ").lower()