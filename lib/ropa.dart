import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puntoclave/neg1_ropa.dart';
import 'package:puntoclave/neg2_ropa.dart';

class Ropa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PuntoClave',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ropa y Accesorios',
            style: TextStyle(
                color: Colors.white60,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                fontStyle: FontStyle.italic),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
            ),
            onPressed: () {
              print('Menu Lateral');
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.home,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Neg1_Ropa()));
                },
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(120.0, 10.0, 10.0, 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100.0,
                                  child: const Text(
                                    'Negocio 1',
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                const Icon(
                                  Icons.favorite_border,
                                  color: Colors.pinkAccent,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100.0,
                                  child: const Text(
                                    'Dirección física: '
                                    'Correo electrónico: '
                                    'Teléfono fijo: '
                                    'Número Celular: '
                                    'Página Web: '
                                    'Productos: ',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 1.0,
                            ),
                            const Text('⭐⭐⭐⭐⭐'),
                            const SizedBox(
                              height: 1.0,
                            ),
                            Row(
                              children: const [
                                Text(
                                  '45 min',
                                  style: TextStyle(color: Colors.black54),
                                ),
                                Icon(
                                  Icons.timer,
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5.0,
                      left: 18.0,
                      bottom: 5.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.asset(
                          'images/hangers_1280.jpg',
                          width: 110.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Neg2_Ropa()));
                },
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(120.0, 10.0, 10.0, 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100.0,
                                  child: const Text(
                                    'Negocio 2',
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                const Icon(
                                  Icons.favorite_border,
                                  color: Colors.pinkAccent,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100.0,
                                  child: const Text(
                                    'Dirección física: '
                                    'Correo electrónico: '
                                    'Teléfono fijo: '
                                    'Número Celular: '
                                    'Página Web: '
                                    'Productos: ',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 1.0,
                            ),
                            const Text('⭐⭐⭐⭐⭐'),
                            const SizedBox(
                              height: 1.0,
                            ),
                            Row(
                              children: const [
                                Text(
                                  '45 min',
                                  style: TextStyle(color: Colors.black54),
                                ),
                                Icon(
                                  Icons.timer,
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5.0,
                      left: 18.0,
                      bottom: 5.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.asset(
                          'images/hangers_1280.jpg',
                          width: 110.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
