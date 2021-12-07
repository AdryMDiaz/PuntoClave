/// Flutter code sample for BottomNavigationBar
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:puntoclave/Clientes/login_usuario.dart';
import 'package:puntoclave/Tiendas/login_tienda.dart';
import 'package:puntoclave/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'PuntoClave';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

  final screens = [
    Index(),
    const Center(
      child:
          Text('Index 1: Notificaciones y/o Promociones', style: optionStyle),
    ),
    Loginclientes(),
    Logintiendas(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //debugShowCheckedModeBanner: false,
      body: Center(
        child: screens.elementAt(_selectedIndex),
      ),
      //body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.red[800],
        iconSize: 25,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        //showUnselectedLabels: false,
        //showSelectedLabels: false,
        currentIndex: _selectedIndex,
        //onTap: (index) => setState(() => _selectedIndex = index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home), //business_center
            label: 'Servicios',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Clientes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Tiendas',
          ),
        ],
        //currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: _onItemTapped,
      ),
    );
  }
}
