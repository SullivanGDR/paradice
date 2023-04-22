import 'dicepool.dart';
import 'dicePerso.dart';

/// DicepoolPerso est une classe fille de Dicepool.
/// Permet l'ajout d'un dé personnalisé dans le pool
/// de dé Dicepool.
class DicepoolPerso extends Dicepool {
  // Attributs
  // Permet d'indiquer le nombre de faces du dé.
  int _nbFace;

  /// Constructeur de la classe DicepoolPerso
  /// qui permet de créer un pool de dés
  /// personnalisés.
  DicepoolPerso(this._nbFace) : super();

  // Getter de la variable privée '_nbFaces'.
  /// @return le nombre de faces.
  int getNbFaces() {
    return this._nbFace;
  }

  @override

  /// addDice() est une méthode réécrite
  /// provenant de Dicepool permettant
  /// d'ajouter un dé au pool de dés.
  void addDice() {
    super.getLesDices().add(DicePerso(this._nbFace));
  }
}

// DicepoolPerso a été réalisé avec l'aide de Thoma H.
// @Contact : thomahamlaoui@gmail.com