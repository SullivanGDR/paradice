import 'dice10.dart';
import 'dicepool.dart';

/// Dice10pool est une classe fille de Dicepool.
/// Permet l'ajout d'un dé D10 dans le pool de dé.
class Dice10pool extends Dicepool {
  Dice10pool() : super();

  @override

  /// Méthode réécrite importée de Dicepool
  /// permettant d'ajouter un dé au pool.
  void addDice() {
    super.getLesDices().add(D10());
  }
}
