# Le module "random" permet de générer des nombres aléatoire
# L'import de module dans python permet d'ajouter certaines fonctionnalitées
import random

# BONUS :
# On crée une variable pour savoir si le joueur souhaite rejouer ou non
# au début, on met oui par defaut pour lancer au moins une partie 
rejouer = "oui"

# Tant que le joueur répond oui à rejouer, on continue
# Tout le contenu de mon jeu se retrouve dans la boucle rejouer
while rejouer == "oui":
    # Permet de générer un nombre entier aléatoire entre 1 et 100
    nombre_secret = random.randint(1, 100)

    # Compteur de tentatives
    tentatives = 0

    # Nous faisons une boucle infinie
    # Elle ne s'arrete que si on utilise le mot clé "break" pour stopper la boucle
    # Fonctionne aussi avec exit() mais lui stoppe tout le script
    while True:

        # On demande a l'utilisateur de proposer un nombre
        # input récupère du texte, int() le transforme en nombre
        proposition = int(input("Devinez le nombre (entre 1 et 100) : "))

        # On ajoute 1 au compteur de tentatives 
        tentatives += 1
        # tentatives = tentatives + 1

        # Si le nombre proposé est plus grand que 100 ou plus petit que 1
        if proposition > 100 or proposition < 1:
            # On affiche un message d'erreur
            print("Veuillez choisir un nombre entre 1 et 100")
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
            # Permet de stopper la boucle
            break
    
    rejouer = input("Voulez-vous rejouer ? (oui / non) : ").lower()