import 'dice.dart';

/// La classe Dicepool est une classe abstraite définissant
/// un pool de plusieurs dés.
///
/// Elle contient les listes privées '_lesDices' qui contient
/// les dés, et '_lesResultats' qui contient les résultats
/// du dernier lancer de dés.

abstract class Dicepool {
  // Attributs

  // Liste contenant les Dices.
  List<Dice> _lesDices = [];

  // Liste contenant les résultats.
  List _lesResultats = [];

  /// Constructeur de la classe Dicepool qui
  /// permet de créer un pool de Dice et d'y
  /// ajouter un dé.
  Dicepool() {
    addDice();
  }

  // Getter de la liste de dés.
  /// @return les dés que contient
  /// le pool.
  List getLesDices() {
    return this._lesDices;
  }

  // Getter des résultats des lancer de dés.
  // @return les résultats des lancer de dés.
  List getLesResultats() {
    return this._lesResultats;
  }

  // Méthode permettant l'ajout d'un dé.
  void addDice();

  /// Méthode permettant de vider le pool de dés en mettant
  /// à jour la liste de Dice '_lesDices' et la liste des
  /// résultats '_lesResultats'.
  void viderLesDices() {
    this._lesDices = [];
    this._lesResultats = [];
  }

  /// Méthode permettant de reset les dés en mettant à jour
  /// la liste de Dice '_lesDices' et la liste des résultats
  /// '_lesResultats'.
  void resetDices() {
    this._lesResultats = [];
    for (Dice dice in this._lesDices) {
      dice.reset();
    }
  }

  /// Méthode permettant d'avoir la longueur
  /// de la liste de dés (le nombre de dés).
  int getNbDices() {
    return this.getLesDices().length;
  }

  /// Méthode permettant de lancer les dés, c'est à dire
  /// de lancer chaque dés du pool un part un et de stocker
  /// son résultats dans '_lesResultats'.
  void lancerLesDices() {
    for (Dice dice in this._lesDices) {
      dice.lancer();
      this._lesResultats.add(dice.getRes());
    }
  }

  /// Méthode qui permet d'avoir le nombre de fois
  /// qu'une face donnée est tombée sur un lancer
  /// de dé.
  /// return: le nombre de fois où la face est tombée.
  int calculNbFaces(int a) {
    int nbFace = 0;
    for (int face in this._lesResultats) {
      if (face == a) {
        nbFace++;
      }
    }
    return nbFace;
  }

  /// Méthode permettant de calculer la moyenne d'un lancer
  /// de dé en faisant la somme de '_lesResultats' / par sa
  /// longueur.
  /// return: la moyenne d'un lancer
  double calculMoyenne() {
    int somme = 0;
    for (int element in this._lesResultats) {
      somme += element;
    }
    double moyenne = somme / this._lesResultats.length;
    moyenne = double.parse(moyenne.toStringAsFixed(2));
    return moyenne;
  }
}
