import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puntoclave/belleza.dart';
import 'package:puntoclave/farmacia.dart';
import 'package:puntoclave/ferreteria.dart';
import 'package:puntoclave/latoneria.dart';
import 'package:puntoclave/licoreria.dart';
import 'package:puntoclave/miscelanea.dart';
import 'package:puntoclave/publicidad.dart';
import 'package:puntoclave/restaurantes.dart';
import 'package:puntoclave/ropa.dart';
import 'package:puntoclave/search.dart';
import 'package:puntoclave/tintoreria.dart';
import 'package:puntoclave/viveres.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PuntoClave',
      //debugShowCheckedModeBanner: false,
      //home:HomePage()
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Categorías y Servicios',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                fontStyle: FontStyle.italic),
          ),
          leading: const Icon(Icons.menu),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search,
              ),
              onPressed: () {
                showSearch(
                    context: context, delegate: search('Buscar Servicios'));
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Viveres()));
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1.0,
                                blurRadius: 5.0,
                                offset: Offset(2, 6),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.asset(
                              'images/pumpkin_1280.jpg',
                              fit: BoxFit.fill,
                              width: 400.0,
                              height: 150.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.brown,
                        child: const Text(
                          'Víveres y Abarrotes',
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Tintoreria()));
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1.0,
                                blurRadius: 5.0,
                                offset: Offset(2, 6),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.asset(
                              'images/washing_1280.jpg',
                              fit: BoxFit.fill,
                              width: 400.0,
                              height: 150.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: const Text(
                          'Tintorerías y Lavanderías',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Ferreteria()));
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1.0,
                                blurRadius: 5.0,
                                offset: Offset(2, 6),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.asset(
                              'images/tools_1280.jpg',
                              fit: BoxFit.fill,
                              width: 400.0,
                              height: 150.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        child: const Text(
                          'Ferreterías y Cerrajerías',
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Latoneria()));
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1.0,
                                blurRadius: 5.0,
                                offset: Offset(2, 6),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.asset(
                              'images/man_1280.jpg',
                              fit: BoxFit.fill,
                              width: 400.0,
                              height: 150.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.black12,
                        child: const Text(
                          'Latonería y Pintura',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Restaurantes()));
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1.0,
                                blurRadius: 5.0,
                                offset: Offset(2, 6),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.asset(
                              'images/cupcakes_1280.jpg',
                              fit: BoxFit.fill,
                              width: 400.0,
                              height: 150.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.brown,
                        child: const Text(
                          'Restaurantes y Cafeterías',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Farmacia()));
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1.0,
                                blurRadius: 5.0,
                                offset: Offset(2, 6),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.asset(
                              'images/first_aid_1280.jpg',
                              fit: BoxFit.fill,
                              width: 400.0,
                              height: 150.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.blueGrey,
                        child: const Text(
                          'Farmacias y Droguerías',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Miscelanea()));
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1.0,
                                blurRadius: 5.0,
                                offset: Offset(2, 6),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.asset(
                              'images/calculator_1280.jpg',
                              fit: BoxFit.fill,
                              width: 400.0,
                              height: 150.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white54,
                        child: const Text(
                          'Misceláneas y Papelerías',
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Belleza()));
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1.0,
                                blurRadius: 5.0,
                                offset: Offset(2, 6),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.asset(
                              'images/hair_salon_1280.jpg',
                              fit: BoxFit.fill,
                              width: 400.0,
                              height: 150.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.black12,
                        child: const Text(
                          'Peluquería y Belleza',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Ropa()));
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1.0,
                                blurRadius: 5.0,
                                offset: Offset(2, 6),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.asset(
                              'images/store_1280.jpg',
                              fit: BoxFit.fill,
                              width: 400.0,
                              height: 150.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.black12,
                        child: const Text(
                          'Ropa y Accesorios',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Publicidad()));
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1.0,
                                blurRadius: 5.0,
                                offset: Offset(2, 6),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.asset(
                              'images/social_media_1280.jpg',
                              fit: BoxFit.fill,
                              width: 400.0,
                              height: 150.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.black12,
                        child: const Text(
                          'Publicidad y Fotografía',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Licoreria()));
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1.0,
                                blurRadius: 5.0,
                                offset: Offset(2, 6),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.asset(
                              'images/alcoholic_1280.jpg',
                              fit: BoxFit.fill,
                              width: 400.0,
                              height: 150.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.black12,
                        child: const Text(
                          'Licorerías',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
