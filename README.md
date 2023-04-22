# Paradice

Application Flutter de simulation de lancement de dé(s).

## Fonctionnement du programme

Ce projet est réalisé dans le cadre de mes études en BTS SIO au lycée Guy Mollet à Arras.

Paradice est une application mobile permettant de lancer des dés et de générer des statistiques par rapport au dernier lancer. 

Ce projet permet sur la première page 'Statistiques' de lancer 4 types de dé prédéfinis :
- D6
- D10
- D20
- D100

De base, le dé est initialisé à 6 faces, mais l'utilisateur peut changer de dé parmis ces 4 choix comme bon lui semble,
l'utilisateur peut aussi choisir le nombre de dé(s) qu'il souhaite lancer grâce aux différents boutons permettant de gérer
le nombre de dé de manières précises. 

Une fois que l'utilisateur à choisit le dé et la quantité de dé qu'il souhaite lancer, il suffit d'appuyer sur le bouton pour lancer et les résultats du lancement apparaîtront sans que l'utilisateur ait besoin d'actualiser la page. 

Les différentes statistiques sont : 
- Le nombre de chaque faces sur lequel le ou les dés sont tombés
- La moyenne du lancer

Ensuite Paradice dispose d'une deuxième page 'Personnalisation' qui permet à l'utilisateur de faire des lancements de dé(s) personnalisés.

Comme dans la page statistiques, l'utilisateur peut choisir 4 dé : (D6, D10, D20, D100), la différence est que l'utilisateur peut lancer plusieurs types de dés et pas seulement en choisir qu'un seul. Quand l'utilisateur clic sur un dé, il s'ajoute en dessous, mais il peut aussi créer ses propres dé personnalisés en entrant le nombre de faces qu'il souhaite sur son dé. Pour finir il peut lancer tous les dés, les supprimer, ou en ajouter d'autre. 

### dice.dart

La classe Dice est une classe abstraite définissant un dé avec un nombre de face donné.

Elle contient les variables privées '_nbFace' qui indique le nombre de faces du dé, et '_res' qui indique le résultat du dernier lancer.

Puis une méthode lancer() qui permet de lancer le dé et de mettre à jour '_res'.

### dicepool.dart

La classe Dicepool est une classe abstraite définissant un pool de plusieurs dés.

Elle contient les listes privées '_lesDices' qui contient les dés, et '_lesResultats' qui contient les résultats du dernier lancer de dés.

Dicepool contient de nombreuses méthodes permettant de gérer nos dés, comme avoir les résultats, la moyenne et reset les dés.

### dicepoolPerso.dart

Même fonctionnement que dicepool.dart, mais permet d'avoir des pools de plusieurs types de dé.

### dice6/10/20/100/Perso.dart

Ces fichiers ont tous le même but, c'est de créer un dé, (6, 10, 20, 100, et dé à nombre de faces personnalisées).

### main.dart et myhomepage.dart 

Ce sont les deux fichiers permettant d'afficher le rendu sous Flutter pour l'application mobile.


Application réalisée part Gendre Sullivan - 2023
