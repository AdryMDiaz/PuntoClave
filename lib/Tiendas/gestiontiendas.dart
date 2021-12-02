import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:puntoclave/Productos/registro_productos.dart';
import 'package:puntoclave/main.dart';

class Gestiontiendas extends StatefulWidget {
  //const Gestiontiendas({Key? key}) : super(key: key);
  final String docId;
  Gestiontiendas(this.docId);

  @override
  _GestiontiendasState createState() => _GestiontiendasState();
}

class _GestiontiendasState extends State<Gestiontiendas> {
  final firebase = FirebaseFirestore.instance;

  TextEditingController correo_electronico = TextEditingController();
  TextEditingController password = TextEditingController();

  TextEditingController razonSocial = TextEditingController();
  TextEditingController direccion = TextEditingController();
  TextEditingController telefonoFijo = TextEditingController();
  TextEditingController telefonoCelular = TextEditingController();
  TextEditingController paginaWeb = TextEditingController();
  TextEditingController categoria = TextEditingController();
  TextEditingController rutaFoto = TextEditingController();
  TextEditingController productos = TextEditingController();

  cerrarSesion() async {
    try {
      CollectionReference ref = FirebaseFirestore.instance
          .collection("Tiendas"); //instanciamos la colección
      QuerySnapshot tienda =
          await ref.get(); //almacenamos la colección en la variable cliente

      if (tienda.docs.length != 0) {
        int flag = 0;
        //la variable cursor temporalmente almacenará la información de la colección por cada documento existente en ella
        for (var cursor in tienda.docs) {
          if (cursor.get("activo") == true) {
            try {
              await firebase
                  .collection("Tiendas")
                  .doc(cursor.id) //traerá el id del documento
                  .set({
                "correo_electronico": cursor.get("correo_electronico"),
                "razon_social": cursor.get("razon_social"),
                "direccion_fisica": cursor.get("direccion_fisica"),
                "telefono_fijo": cursor.get("telefono_fijo"),
                "telefono_celular": cursor.get("telefono_celular"),
                "pagina_web": cursor.get("pagina_web"),
                "categoria": cursor.get("categoria"),
                "productos": cursor.get("productos"),
                "foto": cursor.get("foto"),
                "contraseña": cursor.get("contraseña"),
                "estado": true,
                "activo": false
              });
              mensaje("Salida Exitosa",
                  "Gracias por tu visita " + cursor.get("razon_social"));
            } catch (e) {}
          }
        }
      }
    } catch (e) {
      print(e);
      mensaje("Error...", "" + e.toString());
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
          title: const Text(
            "Gestion Tiendas",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                fontStyle: FontStyle.italic),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.post_add,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Registroproductos(widget.docId)));
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.logout,
              ),
              tooltip: "Cerrar Sesión",
              onPressed: () {
                cerrarSesion();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
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
                            widget.docId &&
                        snapshot.data!.docs[index].get("estado") == true) {
                      return Card(
                        child: GestureDetector(
                          onTap: () {
                            print(widget.docId);
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(15),
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
                                              snapshot.data!.docs[index]
                                                  .get("nombre_producto"),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                                .get("descripcion_Producto"),
                                            style: TextStyle(
                                              color: Colors.grey[500],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    /*3*/
                                    FloatingActionButton(
                                      backgroundColor: Colors.white60,
                                      foregroundColor: Colors.purpleAccent,
                                      onPressed: () {},
                                      child: const Icon(Icons.mode_edit),
                                      tooltip: "Modificar producto",
                                    ),
                                    FloatingActionButton(
                                      backgroundColor: Colors.white60,
                                      foregroundColor: Colors.purpleAccent,
                                      onPressed: () {},
                                      child: const Icon(Icons.auto_delete),
                                      tooltip: "Eliminar producto",
                                    )
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void mensaje1(String titulo, String mess) {
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
