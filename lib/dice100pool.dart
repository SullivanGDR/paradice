import 'dice100.dart';
import 'dicepool.dart';

/// Dice100pool est une classe fille de Dicepool.
/// Permet l'ajout d'un dé D100 dans le pool de dé.
class Dice100pool extends Dicepool {
  Dice100pool() : super();

  @override

  /// Méthode réécrite importée de Dicepool
  /// permettant d'ajouter un dé au pool.
  void addDice() {
    super.getLesDices().add(D100());
  }
}
