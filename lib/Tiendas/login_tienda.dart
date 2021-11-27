import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puntoclave/Tiendas/modificar_pass_neg.dart';
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
          //print(cursor.get("correo_electronico"));
          //print(cursor.get("contraseña"));
          //print(correo_electronico.text);
          //print(password.text);
          if (cursor.get("correo_electronico") == correo_electronico.text) {
            // print("Correo encontrado");
            if (cursor.get("contraseña") == password.text) {
              //print("usuario_encontrado");
              flag = 1;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Gestiontiendas()));
            }
          } else {
            //print("correo no encontrado");
            //print(cursor.get("correo_electronico"));
          }
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
          //print(cursor.get("correo_electronico"));
          //print(cursor.get("contraseña"));
          //print(correo_electronico.text);
          //print(password.text);
          if (cursor.get("correo_electronico") == correo_electronico.text) {
            // print("Correo encotrado");
            if (cursor.get("contraseña") == password.text) {
              //print("usuario_encontrado");
              flag = 1;
              print(cursor.id);

              try {
                await firebase
                    .collection("Tiendas")
                    .doc() //vacío automaticamente genera el id
                    .set({
                  "correo_electronico": cursor.get("mail"),
                  "razon_social": cursor.get("razonSocial"),
                  "direccion_fisica": cursor.get("direccion"),
                  "telefono_fijo": cursor.get("telefonoFijo"),
                  "telefono_celular": cursor.get("telefonoCelular"),
                  "pagina_web": cursor.get("paginaWeb"),
                  "categoria": cursor.get("categoria"),
                  "productos": cursor.get("productos"),
                  "contraseña": cursor.get("password1"),
                });
                mensaje("Registro Exitoso", "Negocio creado exitosamente");
              } catch (e) {
                print(e);
                mensaje("Error...", "" + e.toString());
              }
            }
          } else {
            //print("correo no encontrado");
            //print(cursor.get("correo_electronico"));
          }
        }
        if (flag == 0) {
          print("Usuario no encontrado");
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
                    child: Image.asset("images/icons8-business-64.png"),
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
              /*Padding(
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
                          onPressed: () {},
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
              ),*/
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

                final snackBar = SnackBar(
                  content: Text(
                    '¡Cliente Inactivado Exitosamente!',
                    textAlign: TextAlign.center,
                  ),
                  backgroundColor: Colors.deepOrange,
                  behavior: SnackBarBehavior.floating,
                  //width: 300,
                  //height: 200,
                  margin: EdgeInsets.all(60),
                  elevation: 30,
                  shape: const StadiumBorder(
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
}
