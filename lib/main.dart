///
/// main.dart
///
import 'package:flutter/material.dart';
 
import 'screen/device.dart';
 
/// Instancie l'application
void main() {
  runApp(MyApp());
}
 
/// La classe principale de l'application
/// qui va instancier un état StatefulWidget
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
 
/// la classe de l'état principal de l'application
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    ///
    /// met en place un conteneur général de l'appli
    /// avec infos titre, theme, splash, icones...
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'XXXXX',
      theme: ThemeData(
        fontFamily: 'BakbakOne',
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white
      ),
      ///
      /// et appel de l'écran d'accueil
      home: DeviceScreen(),
    );
  }
}