import 'dice20.dart';
import 'dicepool.dart';

/// Dice20pool est une classe fille de Dicepool.
/// Permet l'ajout d'un dé D20 dans le pool de dé.
class Dice20pool extends Dicepool {
  Dice20pool() : super();

  @override

  /// Méthode réécrite importée de Dicepool
  /// permettant d'ajouter un dé au pool.
  void addDice() {
    super.getLesDices().add(D20());
  }
}
