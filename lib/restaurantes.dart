import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Restaurantes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PuntoClave',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Restaurantes y Cafeterias',
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
                  Icons.home,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
              child: Column(children: [
            Stack(
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
                    height: 190.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0,
                          )
                        ]),
                    child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(160.0, 10.0, 10.0, 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 120.0,
                                  child: const Text(
                                    'Negocio 1',
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.favorite_border,
                                  color: Colors.pinkAccent,
                                )
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
                              height: 10.0,
                            ),
                            Text('⭐⭐⭐⭐⭐'),
                            Row(
                              children: const [
                                Text(
                                  '50 min',
                                  style: TextStyle(color: Colors.black54),
                                ),
                                Icon(Icons.timer, color: Colors.black54)
                              ],
                            )
                          ],
                        ))),
                Positioned(
                  top: 14.0,
                  left: 26.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      "images/restaurant.jpg",
                      width: 120.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
            Stack(
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
                    height: 190.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0,
                          )
                        ]),
                    child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(160.0, 10.0, 10.0, 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 120.0,
                                  child: const Text(
                                    'Negocio 2',
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.favorite_border,
                                  color: Colors.pinkAccent,
                                )
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
                              height: 10.0,
                            ),
                            Text('⭐⭐⭐⭐⭐'),
                            Row(
                              children: const [
                                Text(
                                  '50 min',
                                  style: TextStyle(color: Colors.black54),
                                ),
                                Icon(Icons.timer, color: Colors.black54)
                              ],
                            )
                          ],
                        ))),
                Positioned(
                  top: 14.0,
                  left: 26.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      "images/restaurant.jpg",
                      width: 120.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
            Stack(
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
                    height: 190.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0,
                          )
                        ]),
                    child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(160.0, 10.0, 10.0, 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 120.0,
                                  child: const Text(
                                    'Negocio 2',
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.favorite_border,
                                  color: Colors.pinkAccent,
                                )
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
                              height: 10.0,
                            ),
                            Text('⭐⭐⭐⭐⭐'),
                            Row(
                              children: const [
                                Text(
                                  '50 min',
                                  style: TextStyle(color: Colors.black54),
                                ),
                                Icon(Icons.timer, color: Colors.black54)
                              ],
                            )
                          ],
                        ))),
                Positioned(
                  top: 14.0,
                  left: 26.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      "images/restaurant.jpg",
                      width: 120.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
            Stack(
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
                    height: 190.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0,
                          )
                        ]),
                    child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(160.0, 10.0, 10.0, 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 120.0,
                                  child: const Text(
                                    'Negocio 3',
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.favorite_border,
                                  color: Colors.pinkAccent,
                                )
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
                              height: 10.0,
                            ),
                            Text('⭐⭐⭐⭐⭐'),
                            Row(
                              children: const [
                                Text(
                                  '50 min',
                                  style: TextStyle(color: Colors.black54),
                                ),
                                Icon(Icons.timer, color: Colors.black54)
                              ],
                            )
                          ],
                        ))),
                Positioned(
                  top: 14.0,
                  left: 26.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      "images/restaurant.jpg",
                      width: 120.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
            Stack(
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
                    height: 190.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0,
                          )
                        ]),
                    child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(160.0, 10.0, 10.0, 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 120.0,
                                  child: const Text(
                                    'Negocio 4',
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.favorite_border,
                                  color: Colors.pinkAccent,
                                )
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
                              height: 10.0,
                            ),
                            Text('⭐⭐⭐⭐⭐'),
                            Row(
                              children: const [
                                Text(
                                  '50 min',
                                  style: TextStyle(color: Colors.black54),
                                ),
                                Icon(Icons.timer, color: Colors.black54)
                              ],
                            )
                          ],
                        ))),
                Positioned(
                  top: 14.0,
                  left: 26.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      "images/restaurant.jpg",
                      width: 120.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
            Stack(
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
                    height: 190.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0,
                          )
                        ]),
                    child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(160.0, 10.0, 10.0, 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 120.0,
                                  child: const Text(
                                    'Negocio 5',
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.favorite_border,
                                  color: Colors.pinkAccent,
                                )
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
                              height: 10.0,
                            ),
                            Text('⭐⭐⭐⭐⭐'),
                            Row(
                              children: const [
                                Text(
                                  '50 min',
                                  style: TextStyle(color: Colors.black54),
                                ),
                                Icon(Icons.timer, color: Colors.black54)
                              ],
                            )
                          ],
                        ))),
                Positioned(
                  top: 14.0,
                  left: 26.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      "images/restaurant.jpg",
                      width: 120.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ]))),
    );
  }
}
