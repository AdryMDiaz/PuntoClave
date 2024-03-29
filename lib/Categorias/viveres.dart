import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puntoclave/Clientes/login_usuario.dart';
import 'package:puntoclave/Productos/list_productos.dart';

import '../main.dart';

class Viveres extends StatelessWidget {
  String categoria = "Víveres y Abarrotes";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PuntoClave',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            categoria,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                fontStyle: FontStyle.italic),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.home,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.login,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Loginclientes()));
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
                    if (snapshot.data!.docs[index]
                            .get("categoria")
                            .toString()
                            .toUpperCase()
                            .contains(categoria.toUpperCase()) &&
                        snapshot.data!.docs[index].get("estado") == true) {
                      return Card(
                        child: GestureDetector(
                          onTap: () {
                            String idTienda = snapshot.data!.docs[index].id;
                            print(snapshot.data!.docs[index].id);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Listproductos(idTienda)));
                          },
                          child: Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5.0),
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
                                      130.0, 10.0, 10.0, 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              style: const TextStyle(
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
                                            width: 120.0,
                                            child: Text(
                                              snapshot.data!.docs[index]
                                                  .get("direccion_fisica"),
                                              style: const TextStyle(
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
                                            width: 120.0,
                                            child: Text(
                                              snapshot.data!.docs[index]
                                                  .get("correo_electronico"),
                                              style: const TextStyle(
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
                                            width: 120.0,
                                            child: Text(
                                              snapshot.data!.docs[index]
                                                  .get("telefono_fijo"),
                                              style: const TextStyle(
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
                                            width: 120.0,
                                            child: Text(
                                              snapshot.data!.docs[index]
                                                  .get("telefono_celular"),
                                              style: const TextStyle(
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
                                            width: 120.0,
                                            child: Text(
                                              snapshot.data!.docs[index]
                                                  .get("pagina_web"),
                                              style: const TextStyle(
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
                                            width: 120.0,
                                            child: Text(
                                              snapshot.data!.docs[index]
                                                  .get("productos"),
                                              style: const TextStyle(
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
                                            style: TextStyle(
                                                color: Colors.black54),
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
                                left: 5.0,
                                bottom: 5.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.asset(
                                    //'images/shopping_1280.jpg',
                                    "images/" +
                                        snapshot.data!.docs[index].get("foto"),
                                    width: 125.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Card();
                    }
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
