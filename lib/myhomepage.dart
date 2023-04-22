import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paradice/dicePerso.dart';
import 'package:paradice/dicepoolPerso.dart';
import 'dice.dart';
import 'dicepool.dart';
import 'dice6.dart';
import 'dice10.dart';
import 'dice20.dart';
import 'dice100.dart';
import 'dice6pool.dart';
import 'dice10pool.dart';
import 'dice20pool.dart';
import 'dice100pool.dart';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  SplashScreenState createState() => SplashScreenState();
}

/// SplashScreenState est la page de lancement
/// de l'application, permettant de laisser le
/// temps de tout charger et de créer un beau
/// lancement d'application.
class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              'Assets/Images/paradice_logo.png',
              width: 350,
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 350.0),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// FirstPage est la page principale de
/// l'application Paradice, c'est ici
/// que se trouve le menu de navigation.
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'Assets/Images/paradice_logo.png',
                    width: 250,
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  Center(
                    child: Text('Menu'),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.equalizer),
              title: Text('Accès aux statistiques'),
              onTap: () {
                Navigator.pushNamed(context, '/route2');
              },
            ),
            ListTile(
              leading: Icon(Icons.casino),
              title: Text('Accès aux dés personnalisés'),
              onTap: () {
                Navigator.pushNamed(context, '/route3');
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'Assets/Images/paradice_logo.png',
                      width: 300,
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.all(5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Menu',
                        style: TextStyle(
                          fontFamily: 'Kosan',
                          color: Color.fromRGBO(216, 224, 237, 1),
                          fontSize: 35,
                        )),
                  ],
                ),
                const Padding(padding: EdgeInsets.all(5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/route2');
                      },
                      icon: Icon(Icons.equalizer),
                      label: Text("Statistiques"),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/route3');
                      },
                      icon: Icon(Icons.casino),
                      label: Text("Personnaliser"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ThirdPage est la page pour les dés personnalisés.
/// C'est sur cette page que l'on peut gérer les dés
/// personnalisés.
class ThirdPage extends StatefulWidget {
  @override
  _ThirdPage createState() => _ThirdPage();
}

class _ThirdPage extends State<ThirdPage> {
  final _formKey = GlobalKey<FormState>();
  // Attributs
  /// On initialise la valeurSaisie à 0.
  /// C'est ici qu'est stocké le nombre de
  /// faces voulu par l'utilisateur pour
  /// son dé personnalisé.
  int _valeurSaisie = 0;

  // Liste contenant les Dices personnalisés.
  List<DicepoolPerso> poolPerso = [];

  /// Méthode permettant de tester si notre pool
  /// de dés personnalisés contient déjà ou non
  /// un pool de dé saisi en paramètre.
  void testDes(int testDe) {
    bool condition = false;

    for (var element in poolPerso) {
      if (element.getNbFaces() == testDe) {
        element.addDice();
        condition = true;
        break;
      }
    }

    if (!condition) {
      poolPerso.add(DicepoolPerso(testDe));
    }
  }

  /// Méthode qui permet d'update 'testDe' à 6
  /// quand l'utilisateur appuie sur le bouton D6.
  void _D6() {
    testDes(6);
    setState(() {});
  }

  /// Méthode qui permet d'update 'testDe' à 10
  /// quand l'utilisateur appuie sur le bouton D10.
  void _D10() {
    testDes(10);
    setState(() {});
  }

  /// Méthode qui permet d'update 'testDe' à 20
  /// quand l'utilisateur appuie sur le bouton D20.
  void _D20() {
    testDes(20);
    setState(() {});
  }

  /// Méthode qui permet d'update 'testDe' à 100
  /// quand l'utilisateur appuie sur le bouton D100.
  void _D100() {
    testDes(100);
    setState(() {});
  }

  /// Méthode qui permet d'update 'testDe' avec la
  /// valeur saisie par l'utilisateur quand il appuie
  /// sur le bouton 'Ajouter le dé'.
  void _DPerso() {
    testDes(_valeurSaisie);
    setState(() {});
  }

  /// Méthode permettant d'afficher les informations des lancer de dé
  /// personnalisés. Avec l'aide de Widget des Colonnes sont créées et
  /// sont actualisées avec les données de lancer.
  /// @return Colonne2.
  Widget Resultats() {
    Column ColFaces = Column(children: <Widget>[Text('Nb Faces')]);
    Column ColDes = Column(children: <Widget>[Text('Nb dés')]);
    Column ColResultats = Column(children: <Widget>[Text('Résultats')]);
    Column ColMoyenne = Column(children: <Widget>[Text('Moyenne')]);
    Column Colonne2 = Column(
      children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ColFaces, ColDes, ColResultats, ColMoyenne]),
      ],
    );
    for (DicepoolPerso element in poolPerso) {
      ColFaces.children.add(Text(element.getNbFaces().toString()));
      ColDes.children.add(Text(element.getNbDices().toString()));
      ColResultats.children.add(Text(element.getLesResultats().toString()));
      ColMoyenne.children.add(Text(element.calculMoyenne().toString()));
    }
    return Colonne2;
  }
  // La méthode 'Résultats' provient de Thoma H.
  // @Contact : thomahamlaoui@gmail.com

  /// Méthode permettant de reset le dernier lancer de pool
  /// de dés et de lancer chaque dé dans poolPerso.
  void lancerTous() {
    for (DicepoolPerso element in poolPerso) {
      element.resetDices();
      element.lancerLesDices();
    }
    setState(() {});
  }

  /// Méthode permettant de vider le pool de dé,
  /// le remettant totalement vide grace à clear().
  void viderLesDes() {
    poolPerso.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personnalisation'),
      ),
      body: Column(
        children: <Widget>[
          Image.asset(
            'Assets/Images/paradice_logo.png',
            width: 350,
          ),
          const Divider(
            height: 0,
            thickness: 1,
            endIndent: 0,
            color: Colors.black38,
          ),
          Form(
            key: _formKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      LengthLimitingTextInputFormatter(13)
                    ],
                    decoration: const InputDecoration(labelText: "Nombre de faces"),
                    validator: (valeur) {
                      if (valeur == null || valeur.isEmpty) {
                        return 'Veuillez saisir une valeur';
                      } else {
                        _valeurSaisie = int.parse(valeur);
                      }
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _DPerso();
                    }
                  },
                  child: Text('Ajouter le dé'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                )
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.all(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ElevatedButton(onPressed: _D6, child: Text('D6', style: TextStyle(color: Colors.white))),
              ElevatedButton(onPressed: _D10, child: Text('D10', style: TextStyle(color: Colors.white))),
              ElevatedButton(onPressed: _D20, child: Text('D20', style: TextStyle(color: Colors.white))),
              ElevatedButton(onPressed: _D100, child: Text('D100', style: TextStyle(color: Colors.white))),
            ],
          ),
          const Padding(padding: EdgeInsets.all(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ElevatedButton(
                  onPressed: viderLesDes, child: Text('Vider le pool de dés', style: TextStyle(color: Colors.white))),
              ElevatedButton(
                  onPressed: lancerTous, child: Text('Lancer les dés', style: TextStyle(color: Colors.white))),
            ],
          ),
          const Padding(padding: EdgeInsets.all(5)),
          const Divider(
            height: 0,
            thickness: 1,
            endIndent: 0,
            color: Colors.black38,
          ),
          const Padding(padding: EdgeInsets.all(5)),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: <Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.center, children: const <Widget>[
                  Text('Résultats :'),
                ]),
                const Padding(padding: EdgeInsets.all(5)),
                Resultats() //Méthode Resultats permettant de gérer l'affichage
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// SecondPage est la page de lancement de dé
/// 'Statistiques', c'est sur cette page que
/// l'on peut choisir de lancer les dés
/// suivants : D6, D10, D20, D100.
class SecondPage extends StatefulWidget {
  @override
  _SecondPage createState() => _SecondPage();
}

class _SecondPage extends State<SecondPage> {
  // Attributs

  /// Indique le nombre de dé(s) que l'utilisateur
  /// souhaite lancer.
  int _counter = 1;

  // Indique la moyenne du lancer de dé(s).
  double _moyenne = 0;

  // Création d'un pool de dé D6 nommé stockde.
  /// Ici il est initialisé en tant que D6 mais
  /// sa valeur change quand l'utilisateur change
  /// de dé avec les différents boutons présents.
  Dicepool stockde = Dice6pool();

  // Permet de récupérer le type de dé.
  String _typeDe = "D6";

  /// 'rows', 'rows2' sont tous les deux des List
  /// de Widget permettant de gérer l'affichage
  /// des résultats.
  List<Widget> rows = [];
  List<Widget> rows2 = [];

  /// List de Widget permettant d'afficher
  /// 'Aucun résultat' si aucun dés n'a été lancé.
  List<Widget> rowstart = [Text('Aucun résultat')];

  /// Méthode permettant de retirer 10 a counter
  /// via une série de test pour éviter de passer
  /// counter en négatif.
  void _moinsDix() {
    setState(() {
      if (_counter <= 9) {
        _counter = _counter;
      } else if (_counter == 1) {
        _counter = _counter;
      } else {
        _counter = _counter - 10;
      }
    });
  }

  /// Méthode permettant de retirer 1 a counter
  /// via une série de test pour éviter de passer
  /// counter en négatif.
  void _moinsUn() {
    setState(() {
      if (_counter == 1 || _counter == 0) {
        _counter = _counter;
      } else {
        _counter = _counter - 1;
      }
    });
  }

  /// Méthode permettant de remettre counter a 0.
  void _reset() {
    setState(() {
      _counter = 1;
    });
  }

  /// Méthode permettant d'ajouter 1 a counter.
  void _plusUn() {
    setState(() {
      stockde.addDice();
      _counter = _counter + 1;
    });
  }

  /// Méthode permettant d'ajouter 10 a counter.
  void _plusDix() {
    setState(() {
      _counter = _counter + 10;
    });
  }

  /// Méthode permettant de mettre 'typeDe'
  /// égal à "D6" quand l'utilisateur
  /// appuie sur le bouton 'D6'.
  void _d6() {
    setState(() {
      _typeDe = "D6";
    });
  }

  /// Méthode permettant de mettre 'typeDe'
  /// égal à "D10" quand l'utilisateur
  /// appuie sur le bouton 'D10'.
  void _d10() {
    setState(() {
      _typeDe = "D10";
    });
  }

  /// Méthode permettant de mettre 'typeDe'
  /// égal à "D20" quand l'utilisateur
  /// appuie sur le bouton 'D20'.
  void _d20() {
    setState(() {
      _typeDe = "D20";
    });
  }

  /// Méthode permettant de mettre 'typeDe'
  /// égal à "D100" quand l'utilisateur
  /// appuie sur le bouton 'D100'.
  void _d100() {
    setState(() {
      _typeDe = "D100";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistiques'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(
              'Assets/Images/paradice_logo.png',
              width: 350,
            ),
            const Divider(
              height: 0,
              thickness: 1,
              endIndent: 0,
              color: Colors.black38,
            ),
            const Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(onPressed: _d6, child: Text('D6', style: TextStyle(color: Colors.white))),
                ElevatedButton(onPressed: _d10, child: Text('D10', style: TextStyle(color: Colors.white))),
                ElevatedButton(onPressed: _d20, child: Text('D20', style: TextStyle(color: Colors.white))),
                ElevatedButton(onPressed: _d100, child: Text('D100', style: TextStyle(color: Colors.white))),
              ],
            ),
            const Padding(padding: EdgeInsets.all(8)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(onPressed: _moinsUn, child: Text('-1', style: TextStyle(color: Colors.white))),
                ElevatedButton(onPressed: _moinsDix, child: Text('-10', style: TextStyle(color: Colors.white))),
                ElevatedButton(onPressed: _reset, child: Text('1', style: TextStyle(color: Colors.white))),
                ElevatedButton(onPressed: _plusUn, child: Text('+1', style: TextStyle(color: Colors.white))),
                ElevatedButton(onPressed: _plusDix, child: Text('+10', style: TextStyle(color: Colors.white))),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(10)),
              child: Row(children: <Widget>[
                Text('Nombre de $_typeDe:'),
                const Padding(padding: EdgeInsets.only(left: 5)),
                Text('$_counter'),
              ]),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: <Widget>[
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: const <Widget>[
                    Text('Résultats :'),
                  ]),
                  const Padding(padding: EdgeInsets.all(5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Column(children: rowstart)],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Column(children: rows), Column(children: rows2)],
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Moyenne obtenue : $_moyenne ')],
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    onPressed: () {
                      /// Méthode du bouton 'Reset' permettant de reset
                      /// toutes les variables et de vider le pool de dés.
                      _typeDe = "D6";
                      _counter = 1;
                      stockde.viderLesDices();
                      _moyenne = 0;
                      rows.clear();
                      rows2.clear();
                      rowstart = [Text('Aucun résultat')];
                      setState(() {});
                    },
                    icon: const Icon(Icons.delete),
                    label: const Text("Reset"),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// Méthode du bouton de lancement de dés.
          /// Ici le nombre de dés est récupérer via
          /// counter, ainsi que le type de dé et le
          /// nombre de faces.
          int nbDesChoisis = _counter;
          String typeDeChoisi = _typeDe;
          int nbFaces = 0;

          /// Ici plusieurs d'action sont faites selon typeDeChoisi.
          /// 'stockde' et 'nbFaces' sont actualisés par rapport
          /// au dé choisi par l'utilisateur.
          if (typeDeChoisi == "D6") {
            stockde = Dice6pool();
            nbFaces = 6;
          } else if (typeDeChoisi == "D10") {
            stockde = Dice10pool();
            nbFaces = 10;
          } else if (typeDeChoisi == "D20") {
            stockde = Dice20pool();
            nbFaces = 20;
          } else if (typeDeChoisi == "D100") {
            stockde = Dice100pool();
            nbFaces = 100;
          }

          /// On ajoute a notre pool de dés 'stockde'
          /// le nombre de dé(s) souhaité(s) par
          /// l'utilisateur.
          for (int i = 0; i < nbDesChoisis - 1; i++) {
            stockde.addDice();
          }

          /// Appel de la méthode 'lancerLesDices()' afin de
          /// afin de lancer tous les dés de notre pool de dé.
          stockde.lancerLesDices();

          /// On établie la moyenne de lancer de dé
          /// via la méthode 'calculMoyenne()'.
          _moyenne = stockde.calculMoyenne();

          /// On reset bien toutes les rows pour l'affichage
          /// des résultats
          rows.clear();
          rows2.clear();
          rowstart.clear();

          /// Dernière étape de notre lancement de dé :
          /// Ici on gère l'affichage des résultats en
          /// calculant pour chaque faces le nombre de
          /// fois où celle-ci est tombée et ainsi pouvoir
          /// l'afficher proprement dans des Widget 'Row'.
          for (int i = 1; i <= nbFaces; i++) {
            List<Widget> rowChildren = [];

            rowChildren.add(Text("Nombre de $i :"));

            int nbFace = stockde.calculNbFaces(i);

            rowChildren.add(Text(" $nbFace "));

            /// Ce if permet de mettre à gauche les faces
            /// impairs et à droite les faces paires.
            if (i % 2 == 0) {
              rows2.add(Row(children: rowChildren));
            } else {
              rows.add(Row(children: rowChildren));
            }
          }
          // SetState permet de mettre à jour le visuel à l'utilisateur.
          setState(() {});
        },
        backgroundColor: const Color.fromRGBO(216, 224, 237, 1),
        child: const Icon(Icons.casino_outlined),
      ),
    );
  }
}
