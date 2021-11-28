import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puntoclave/Categorias/belleza.dart';
import 'package:puntoclave/Categorias/farmacia.dart';
import 'package:puntoclave/Categorias/latoneria.dart';
import 'package:puntoclave/Categorias/licoreria.dart';
import 'package:puntoclave/Categorias/miscelanea.dart';
import 'package:puntoclave/Categorias/publicidad.dart';
import 'package:puntoclave/Categorias/restaurantes.dart';
import 'package:puntoclave/Categorias/ropa.dart';
import 'package:puntoclave/Categorias/tintoreria.dart';
import 'package:puntoclave/Categorias/viveres.dart';
import 'package:puntoclave/Clientes/menulateral.dart';
import 'package:puntoclave/search.dart';

/*void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Index());
  }
}

class Index extends StatefulWidget {
  @override
  IndexStart createState() => IndexStart();
}

@override
class IndexStart extends State<Index> {
  String categoria1 = "Víveres y Abarrotes";
  String categoria2 = "Tintorerías y Lavanderías";
  String categoria3 = "Latonería y Pintura";
  String categoria4 = "Restaurantes y Cafeterías";
  String categoria5 = "Farmacias y Droguerías";
  String categoria6 = "Misceláneas y Papelerías";
  String categoria7 = "Peluquería y Belleza";
  String categoria8 = "Ropa y Accesorios";
  String categoria9 = "Publicidad y Fotografía";
  String categoria10 = "Licorerías";

  Widget build(BuildContext context) {
    Widget cateSection = Container();

    return MaterialApp(
      title: 'PuntoClave',
      debugShowCheckedModeBanner: false,
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
          leading: IconButton(
            icon: const Icon(
              Icons.style_rounded,
            ),
            onPressed: () {},
          ),
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
        drawer: MenuLateral(),
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
                        child: Text(
                          categoria1,
                          style: const TextStyle(
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
                        child: Text(
                          categoria2,
                          style: const TextStyle(
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
                        child: Text(
                          categoria3,
                          style: const TextStyle(
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
                        child: Text(
                          categoria4,
                          style: const TextStyle(
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
                        child: Text(
                          categoria5,
                          style: const TextStyle(
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
                        child: Text(
                          categoria6,
                          style: const TextStyle(
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
                        child: Text(
                          categoria7,
                          style: const TextStyle(
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
                        child: Text(
                          categoria8,
                          style: const TextStyle(
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
                        child: Text(
                          categoria9,
                          style: const TextStyle(
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
                        child: Text(
                          categoria10,
                          style: const TextStyle(
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
