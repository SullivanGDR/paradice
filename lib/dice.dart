import 'dart:math';

/// La classe Dice est une classe abstraite définissant
/// un dé avec un nombre de face donné.
///
/// Elle contient les variables privées '_nbFace' qui indique
/// le nombre de faces du dé, et '_res' qui indique le résultat
/// du dernier lancer.
///
/// Puis une méthode lancer() qui permet de lancer le dé
/// et de mettre à jour '_res'.

abstract class Dice {
  // Attributs

  // Nombre de faces que contient le dé.
  int _nbFace;

  // Résultat du dernier lancer de dé.
  int _res = 0;

  /// Constructeur de la classe Dice qui
  /// initialise le nombre de faces du dé.
  Dice(this._nbFace);

  // Getter du nombre de faces du dé.
  // @return le nombre de faces du dé.
  int getNbFace() {
    return this._nbFace;
  }

  // Getter du résultat du dernier lancer de dé.
  // @return le résultat du dernier lancer de dé.
  int getRes() {
    return this._res;
  }

  // Méthode qui permet de reset le Dice
  void reset() {}

  /// Méthode permettant de lancer le dé et de mettre à jour
  /// le résultat '_res'. Le résultat du lancer est un nombre
  /// aléatoire entre 1 et le nombre de faces du dé '_nbFaces'.
  void lancer() {
    Random random = new Random();
    this._res = random.nextInt(this._nbFace) + 1;
  }
}
