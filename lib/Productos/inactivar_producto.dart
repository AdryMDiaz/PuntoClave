import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class inacProducto extends StatefulWidget {
  //const inacProducto({Key? key}) : super(key: key);
  final String idProducto;
  inacProducto(this.idProducto);

  @override
  Product_inac createState() => Product_inac();
}

class Product_inac extends State<inacProducto> {
  final firebase = FirebaseFirestore.instance;

  String logo = "";
  String titulo = "";
  String valor = "";
  String iva = "";
  String total = "";
  String descripcion = "";
  String tienda = "";
  String categoria = "";
  String dcto = "";
  String idTienda = "";
  String producto = "";

  Product_inac() {
    buscarDoc();
  }

  //Las clases van en mayúscula
  //Los métodos en minúscula
  //ObjetoProducto objProducto = new ObjetoProducto();

  buscarDoc() async {
    try {
      CollectionReference ref =
          FirebaseFirestore.instance.collection("Productos");
      QuerySnapshot producto = await ref.get();

      if (producto.docs.length != 0) {
        for (var cursor in producto.docs) {
          if (cursor.id == widget.idProducto) {
            this.logo = cursor.get("foto_producto");
            this.titulo = cursor.get("nombre_producto");
            this.valor = cursor.get("precio_Sin_Iva");
            this.iva = cursor.get("iva");
            this.total = cursor.get("precio_Venta");
            this.dcto = cursor.get("descuento");
            this.tienda = cursor.get("nombre_tienda");
            this.categoria = cursor.get("categoria_Producto");
            this.descripcion = cursor.get("descripcion_Producto");
            this.idTienda = cursor.get("idTienda");
            this.producto = cursor.get("nombre_producto");
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  inactivarProducto() async {
    try {
      CollectionReference ref = FirebaseFirestore.instance
          .collection("Productos"); //instanciamos la colección
      QuerySnapshot producto =
          await ref.get(); //almacenamos la colección en la variable cliente

      if (producto.docs.length != 0) {
        int flag = 0;
        //la variable cursor temporalmente almacenará la información de la colección por cada documento existente en ella
        for (var cursor in producto.docs) {
          if (cursor.id == widget.idProducto) {
            if (cursor.get("estado") == true) {
              flag = 1;
              print(cursor.id);

              try {
                await firebase
                    .collection("Productos")
                    .doc(cursor.id) //vacío automaticamente genera el id
                    .set({
                  "categoria_Producto": cursor.get("categoria_Producto"),
                  "descripcion_Producto": cursor.get("descripcion_Producto"),
                  "descuento": cursor.get("descuento"),
                  "foto_producto": cursor.get("foto_producto"),
                  "idTienda": cursor.get("idTienda"),
                  "iva": cursor.get("iva"),
                  "nombre_producto": cursor.get("nombre_producto"),
                  "nombre_tienda": cursor.get("nombre_tienda"),
                  "precio_Sin_Iva": cursor.get("precio_Sin_Iva"),
                  "precio_Venta": cursor.get("precio_Venta"),
                  "estado": false,
                });
                mensaje("Inactivacion Exitosa",
                    "Producto inactivado exitosamente, si lo desea activar nuevamente dirigase a la sección de modificar producto");
              } catch (e) {
                print(e);
                mensaje("Error...", "" + e.toString());
              }
            } else {}
          }
        }
        if (flag == 0) {
          print("Producto no encontrado");
        }
      } else {
        print("Colección vacía");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PuntoClave',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            producto,
            style: const TextStyle(
                color: Colors.white60,
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
          actions: <Widget>[],
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
                    if (snapshot.data!.docs[index].id == widget.idProducto) {
                      return Card(
                        child: GestureDetector(
                          onTap: () {
                            String idDoc = snapshot.data!.docs[index].id;
                            buscarDoc();
                            print(idDoc);
                            print(idTienda);
                            print(tienda);
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  snapshot.data!.docs[index]
                                      .get("nombre_producto"),
                                  //'IVA: 4.800 COP',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(5.0),
                                    width: 600,
                                    height: 240,
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
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 1.0,
                                    left: 1.0,
                                    bottom: 1.0,
                                    right: 1.0,
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        child: Image.asset(
                                          //'images/shopping_1280.jpg',
                                          "images/" +
                                              snapshot.data!.docs[index]
                                                  .get("foto_producto"),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.all(25),
                                child: Row(
                                  children: [
                                    Expanded(
                                      /*1*/
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          /*2*/
                                          Container(
                                            padding: const EdgeInsets.only(
                                                bottom: 8),
                                            child: Text(
                                              'Valor: ' +
                                                  snapshot.data!.docs[index]
                                                      .get("precio_Sin_Iva") +
                                                  ' COP',
                                              //'Valor: 25.200 COP',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(
                                                bottom: 8),
                                            child: Text(
                                              'Valor: ' +
                                                  snapshot.data!.docs[index]
                                                      .get("iva") +
                                                  ' COP',
                                              //'IVA: 4.800 COP',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(
                                                bottom: 8),
                                            child: Text(
                                              'Valor: ' +
                                                  snapshot.data!.docs[index]
                                                      .get("precio_Venta") +
                                                  ' COP',
                                              //'Valor Total: 30.000 COP',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(
                                                bottom: 8),
                                            child: Text(
                                              'Dcto: ' +
                                                  snapshot.data!.docs[index]
                                                      .get("descuento") +
                                                  ' COP',
                                              //'Valor Total: 30.000 COP',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Nombre Negocio: " +
                                                snapshot.data!.docs[index]
                                                    .get("nombre_tienda"),
                                            //'Masculino',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey[500],
                                            ),
                                          ),
                                          Text(
                                            "Categoria: " +
                                                snapshot.data!.docs[index]
                                                    .get("categoria_Producto"),
                                            //'Masculino',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey[500],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          const Text('⭐⭐⭐⭐⭐'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    Expanded(
                                      /*1*/
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          /*2*/
                                          Container(
                                            padding: const EdgeInsets.only(
                                                bottom: 8),
                                            child: const Text(
                                              'Descripción: ',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                                .get("descripcion_Producto"),
                                            /*"Breve descripción del producto y/o servicio donde se específique"
                  " las características más importantes.",*/
                                            textAlign: TextAlign.justify,
                                            softWrap: true,
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey[500],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      //width: 150.0,
                                      //height: 25.0,
                                      child: FloatingActionButton.extended(
                                        //backgroundColor: Colors.white60,
                                        //foregroundColor: Colors.brown,
                                        onPressed: () {
                                          inactivarProducto();
                                        },
                                        heroTag: null,
                                        label: const Text(
                                          'Eliminar Producto',
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        icon: const Icon(Icons.auto_delete),
                                      ),
                                    ),
                                  ],
                                ),
                              )
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

  void mensaje(String titulo, String mess) {
    showDialog(
      context: context,
      builder: (builcontex) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(mess),
          actions: [
            RaisedButton(
              child: const Text(
                "Aceptar",
                style: TextStyle(
                  color: Colors.orange,
                  fontStyle: FontStyle.italic,
                ),
              ),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
