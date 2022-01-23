///
/// screen/device.dart
///
import 'package:cv/screen/competences.dart';
import 'package:cv/screen/experience.dart';
import 'package:cv/screen/formation.dart';
import 'package:cv/screen/infos.dart';
import 'package:cv/screen/profil.dart';
import 'package:flutter/material.dart';

 
/// La classe de l'écran, qui va instancier un état
// ignore: must_be_immutable
class DeviceScreen extends StatefulWidget {
  @override
  _DeviceScreenState createState() => _DeviceScreenState();
}
 
/// La classe de l'état
class _DeviceScreenState extends State<DeviceScreen> {
  /// écran par défaut
  int _currentScreen = 0;
 
  /// liste des écrans
  final List<Widget> _screenList = [
    ProfilScreen(),
    ExperienceScreen(),
    FormationScreen(),
    CompetenceScreen(),
    InfoScreen(),
  ];
 
  /// construction de l'écran principal
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CV Marius"),
      ),
      //
      body: _screenList[_currentScreen],
      //
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        //
        onTap: onTabTapped,
        //
        currentIndex: _currentScreen,
        //
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Expérience',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Formation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.science),
            label: 'Compétences',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Infos',
          ),
        ],
      ),
    );
  }
 
  void onTabTapped(int index) {
    setState(() {
      _currentScreen = index;
    });
  }
}