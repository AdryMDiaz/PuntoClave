import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:puntoclave/Carrito/carritocompras.dart';
import 'package:puntoclave/Clientes/login_usuario.dart';
import 'package:puntoclave/Clientes/token.dart';
import 'package:puntoclave/Productos/detalle_productos1.dart';
import 'package:puntoclave/Productos/objeto_producto.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';

class Listproductos extends StatefulWidget {
  //const Listproductos({Key? key}) : super(key: key);
  final String TiendaId;
  Listproductos(this.TiendaId);

  @override
  _ListproductosState createState() => _ListproductosState();
}

class _ListproductosState extends State<Listproductos> {
  String idDoc = "";
  String nombreTienda = "";
  ObjetoProducto objProducto = new ObjetoProducto();
  final firebase = FirebaseFirestore.instance;

  buscarDoc() async {
    try {
      CollectionReference ref =
          FirebaseFirestore.instance.collection("Tiendas");
      QuerySnapshot tienda = await ref.get();

      if (tienda.docs.length != 0) {
        for (var cursor in tienda.docs) {
          if (cursor.id == widget.TiendaId) {
            //if (cursor.id == widget.TiendaId) {
            objProducto.tienda = cursor.get("razon_social");
            objProducto.logo = cursor.get("foto_producto");
            objProducto.titulo = cursor.get("razon_social");
            objProducto.descripcion = cursor.get("descripcion_Producto");
            objProducto.categoria = cursor.get("categoria_Producto");
            objProducto.dcto = cursor.get("descuento");
            objProducto.total = cursor.get("precio_Venta");
            objProducto.iva = cursor.get("iva");
            objProducto.valor = cursor.get("precio_Sin_Iva");
            objProducto.idTienda = cursor.get("idTienda");
            objProducto.producto = cursor.get("nombre_producto");

            print(objProducto.tienda);
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  agregarCarrito(String idTienda, String idUser, String idItem) async {
    try {
      await firebase.collection("Carrito").doc().set(
          {"UsuarioId": idUser, "TiendaId": idTienda, "ProductoId": idItem});
      //mensaje("Correcto","Registro correto");
    } catch (e) {
      print(e);
      // mensaje("Error...",""+e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PuntoClave',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            objProducto.tienda,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                fontStyle: FontStyle.italic),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
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
            IconButton(
                icon: const Icon(
                  Icons.public,
                ),
                onPressed: () async {
                  const url = 'https://www.google.com';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                }),
            IconButton(
              icon: const Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => carritocompras()));
              },
            ),
          ],
        ),
        body: Container(
          child: Center(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Productos")
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (snapshot.data!.docs[index].get("idTienda") ==
                            widget.TiendaId &&
                        snapshot.data!.docs[index].get("estado") == true) {
                      return Card(
                        child: GestureDetector(
                          onTap: () {
                            String idDoc = snapshot.data!.docs[index].id;
                            buscarDoc();
                            print(idDoc);
                            print(objProducto.idTienda);
                            print(objProducto.tienda);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        detProductos1(idDoc)));
                          },
                          child: Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(
                                    20.0, 5.0, 20.0, 5.0),
                                height: 115.0,
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
                                      130.0, 10.0, 10.0, 5.0),
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
                                            width: 170.0,
                                            child: Text(
                                              snapshot.data!.docs[index]
                                                  .get("nombre_producto"),
                                              style: const TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w600),
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
                                            width: 170.0,
                                            child: Text(
                                              "Valor: " +
                                                  snapshot.data!.docs[index]
                                                      .get("precio_Sin_Iva") +
                                                  " COP",
                                              style: const TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
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
                                            width: 170.0,
                                            child: Text(
                                              "IVA: " +
                                                  snapshot.data!.docs[index]
                                                      .get("iva") +
                                                  " COP",
                                              style: const TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
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
                                            width: 170.0,
                                            child: Text(
                                              "Valor Total: " +
                                                  snapshot.data!.docs[index]
                                                      .get("precio_Venta") +
                                                  " COP",
                                              style: const TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 1.0,
                                      ),
                                      //const Text('Cantidad +1-'),
                                      const SizedBox(
                                        height: 1.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 150.0,
                                            height: 25.0,
                                            child:
                                                FloatingActionButton.extended(
                                              backgroundColor: Colors.white60,
                                              foregroundColor:
                                                  Colors.pinkAccent,
                                              heroTag: null,
                                              onPressed: () async {
                                                token tk = new token();
                                                //tk.validarToken();
                                                String idUser =
                                                    await tk.validarToken();
                                                print(idUser);
                                                if (idUser != "") {
                                                  agregarCarrito(
                                                      widget.TiendaId,
                                                      idUser,
                                                      snapshot.data!.docs[index]
                                                          .id);
                                                } else {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              Loginclientes()));
                                                }
                                                print(
                                                    'Ir a carrito de compras');
                                                //Navigator.pop(context);
                                              },
                                              label: const Text(
                                                'Añadir al Carrito',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                              icon: const Icon(
                                                  Icons.add_shopping_cart),
                                            ),
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
                                      //'images/shopping_1280.jpg',
                                      "images/" +
                                          snapshot.data!.docs[index]
                                              .get("foto_producto"),
                                      width: 125.0,
                                      fit: BoxFit.cover,
                                    )),
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
