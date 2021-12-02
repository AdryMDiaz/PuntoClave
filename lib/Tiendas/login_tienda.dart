import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puntoclave/Tiendas/modificar_pass_neg.dart';
import 'package:puntoclave/Tiendas/modificar_tienda.dart';
import 'package:puntoclave/Tiendas/registro_tiendas.dart';

import '../main.dart';
import 'gestiontiendas.dart';

class Logintiendas extends StatefulWidget {
  const Logintiendas({Key? key}) : super(key: key);

  @override
  _LogintiendasState createState() => _LogintiendasState();
}

class _LogintiendasState extends State<Logintiendas> {
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

  validarDatos() async {
    try {
      CollectionReference ref = FirebaseFirestore.instance
          .collection("Tiendas"); //instanciamos la colección
      QuerySnapshot tienda =
          await ref.get(); //almacenamos la colección en la variable cliente

      if (tienda.docs.length != 0) {
        int flag = 0;
        //la variable cursor temporalmente almacenará la información de la colección por cada documento existente en ella
        for (var cursor in tienda.docs) {
          if (cursor.get("correo_electronico") == correo_electronico.text) {
            if (cursor.get("contraseña") == password.text) {
              if (cursor.get("estado") == true) {
                flag = 1;
                print(cursor.id);

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
                    "activo": true
                  });
                  mensaje1("Ingreso Exitoso",
                      "Bienvenido " + cursor.get("razon_social"));
                } catch (e) {
                  print(e);
                  mensaje1("Error...", "" + e.toString());
                }

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Gestiontiendas(cursor.id)));
              } else {}
            }
          } else {}
        }
        if (flag == 0) {
          print("Tienda no encontrada");

          const snackBar = SnackBar(
            content: Text(
              'Negocio inactivo o no existe en la base de datos!',
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black,
            behavior: SnackBarBehavior.floating,
            //width: 300,
            //height: 200,
            margin: EdgeInsets.all(60),
            elevation: 30,
            shape: StadiumBorder(
                side: BorderSide(color: Colors.deepOrangeAccent, width: 2)),
            /*action: SnackBarAction(
                    label: '',
                    textColor: Colors.white,
                    onPressed: () {
                      // Some code to undo the change.
                      Navigator.pop(context);
                    },
                  ),*/
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } else {
        print("Colección vacía");
      }
    } catch (e) {
      print(e);
    }
  }

  inactivarTienda() async {
    try {
      CollectionReference ref = FirebaseFirestore.instance
          .collection("Tiendas"); //instanciamos la colección
      QuerySnapshot cliente =
          await ref.get(); //almacenamos la colección en la variable cliente

      if (cliente.docs.length != 0) {
        int flag = 0;
        //la variable cursor temporalmente almacenará la información de la colección por cada documento existente en ella
        for (var cursor in cliente.docs) {
          if (cursor.get("correo_electronico") == correo_electronico.text) {
            if (cursor.get("contraseña") == password.text) {
              if (cursor.get("estado") == true) {
                flag = 1;
                print(cursor.id);

                try {
                  await firebase
                      .collection("Tiendas")
                      .doc(cursor.id) //vacío automaticamente genera el id
                      .set({
                    "correo_electronico": cursor.get("correo_electronico"),
                    "razon_social": cursor.get("razon_social"),
                    "direccion_fisica": cursor.get("direccion_fisica"),
                    "telefono_fijo": cursor.get("telefono_fijo"),
                    "telefono_celular": cursor.get("telefono_celular"),
                    "pagina_web": cursor.get("pagina_web"),
                    "categoria": cursor.get("categoria"),
                    "productos": cursor.get("productos"),
                    "contraseña": cursor.get("contraseña"),
                    "foto": cursor.get("foto"),
                    "estado": false,
                  });
                  mensaje("Inactivacion Exitosa",
                      "Negocio inactivado exitosamente");
                } catch (e) {
                  print(e);
                  mensaje("Error...", "" + e.toString());
                }
              } else {}
            }
          } else {}
        }
        if (flag == 0) {
          print("Tienda no encontrada");
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
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      title: 'PuntoClave',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Registrar Negocio',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                fontStyle: FontStyle.italic),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.add_business,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Registrotiendas()));
            },
          ),
          /*actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.person_add,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],*/
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Image.asset("images/icons8-business-641.png"),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
                child: TextField(
                  controller: correo_electronico,
                  decoration: InputDecoration(
                    labelText: "Correo Electrónico",
                    hintText: "Dirección de correo electrónico",
                    contentPadding: EdgeInsets.all(16),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    //hoverColor: Colors.red,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
                child: TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                    hintText: "Contraseña",
                    contentPadding: EdgeInsets.all(16),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    //hoverColor: Colors.red,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 180.0,
                        height: 40.0,
                        child: FloatingActionButton.extended(
                          //backgroundColor: Colors.white60,
                          //foregroundColor: Colors.brown,
                          onPressed: () {
                            validarDatos();
                          },
                          label: const Text(
                            'Acceder a mi tienda',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          icon: const Icon(Icons.business_center),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 180.0,
                        height: 40.0,
                        child: FloatingActionButton.extended(
                          //backgroundColor: Colors.white60,
                          //foregroundColor: Colors.brown,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Modificartienda()));
                          },
                          label: const Text(
                            'Modificar Tienda',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          icon: const Icon(Icons.mode_edit),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 180.0,
                        height: 40.0,
                        child: FloatingActionButton.extended(
                          //backgroundColor: Colors.white60,
                          //foregroundColor: Colors.brown,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Modificarpasstiendas()));
                          },
                          label: const Text(
                            'Olvidé mi contraseña',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          icon: const Icon(Icons.remember_me),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 180.0,
                        height: 40.0,
                        child: FloatingActionButton.extended(
                          //backgroundColor: Colors.white60,
                          //foregroundColor: Colors.brown,
                          onPressed: () {
                            inactivar(
                                "Inactivar Tienda", "¿Desea inactivar tienda?");
                          },
                          label: const Text(
                            'Inactivar tienda',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          icon: const Icon(Icons.auto_delete),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void inactivar(String titulo, String mess) {
    showDialog(
      context: context,
      builder: (builcontex) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(mess),
          actions: [
            Padding(
              padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 0),
              child: TextField(
                controller: correo_electronico,
                decoration: InputDecoration(
                  labelText: "Correo Electrónico",
                  hintText: "Correo Electrónico",
                  contentPadding: EdgeInsets.all(16),
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  //hoverColor: Colors.red,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 0),
              child: TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Contraseña",
                  hintText: "Contraseña",
                  contentPadding: EdgeInsets.all(16),
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  //hoverColor: Colors.red,
                ),
              ),
            ),
            RaisedButton(
              child: const Text(
                "Aceptar",
                style: TextStyle(
                  color: Colors.orange,
                  fontStyle: FontStyle.italic,
                ),
              ),
              onPressed: () {
                inactivarTienda();
                Navigator.of(context, rootNavigator: true).pop();

                const snackBar = SnackBar(
                  content: Text(
                    '¡Tienda Inactivada Exitosamente!',
                    textAlign: TextAlign.center,
                  ),
                  backgroundColor: Colors.black,
                  behavior: SnackBarBehavior.floating,
                  //width: 300,
                  //height: 200,
                  margin: EdgeInsets.all(60),
                  elevation: 30,
                  shape: StadiumBorder(
                      side:
                          BorderSide(color: Colors.deepOrangeAccent, width: 2)),
                  /*action: SnackBarAction(
                    label: '',
                    textColor: Colors.white,
                    onPressed: () {
                      // Some code to undo the change.
                      Navigator.pop(context);
                    },
                  ),*/
                );

                // Find the ScaffoldMessenger in the widget tree
                // and use it to show a SnackBar.
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            RaisedButton(
              child: const Text(
                "Cancelar",
                style: TextStyle(
                  color: Colors.orange,
                  fontStyle: FontStyle.italic,
                ),
              ),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),
          ],
        );
      },
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
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
