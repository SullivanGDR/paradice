import 'package:flutter/material.dart';
import 'myhomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paradice',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Accueil'),

      /// routes permet d'établir des routes pour notre
      /// applications Paradice, permettant d'avoir
      /// plusieurs pages.
      routes: <String, WidgetBuilder>{
        '/route1': (BuildContext context) => FirstPage(),
        '/route2': (BuildContext context) => SecondPage(),
        '/route3': (BuildContext context) => ThirdPage(),
      },
    );
  }
}
