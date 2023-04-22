import 'dice6.dart';
import 'dicepool.dart';

/// Dice6pool est une classe fille de Dicepool.
/// Permet l'ajout d'un dé D6 dans le pool de dé.
class Dice6pool extends Dicepool {
  Dice6pool() : super();

  @override

  /// Méthode réécrite importée de Dicepool
  /// permettant d'ajouter un dé au pool.
  void addDice() {
    super.getLesDices().add(D6());
  }
}
