import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Belleza extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PuntoClave',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Peluqueria y Belleza',
            style: TextStyle(
                color: Colors.white,
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),
          ],
        ),
        body: Container(
          child: Center(
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("Tiendas").snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new Card(
                      child: Stack(
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
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
                              padding: const EdgeInsets.fromLTRB(
                                  120.0, 10.0, 10.0, 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 120.0,
                                        child: Text(
                                          snapshot.data!.docs[index]
                                              .get("razon_social"),
                                          style: TextStyle(
                                              fontSize: 15.0,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 150.0,
                                        child: Text(
                                          snapshot.data!.docs[index]
                                              .get("direccion_fisica"),
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 150.0,
                                        child: Text(
                                          snapshot.data!.docs[index]
                                              .get("correo_electronico"),
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 150.0,
                                        child: Text(
                                          snapshot.data!.docs[index]
                                              .get("telefono_fijo"),
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 150.0,
                                        child: Text(
                                          snapshot.data!.docs[index]
                                              .get("telefono_celular"),
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 150.0,
                                        child: Text(
                                          snapshot.data!.docs[index]
                                              .get("pagina_web"),
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 150.0,
                                        child: Text(
                                          snapshot.data!.docs[index]
                                              .get("productos"),
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
                                'images/beauty_salon_1280.jpg',
                                width: 110.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
