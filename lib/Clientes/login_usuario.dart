import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puntoclave/Clientes/modificar_cliente.dart';
import 'package:puntoclave/Clientes/modificar_pass_cli.dart';
import 'package:puntoclave/Clientes/registro_clientes.dart';
import 'package:puntoclave/Clientes/token.dart';

import '../main.dart';

class Loginclientes extends StatefulWidget {
  const Loginclientes({Key? key}) : super(key: key);

  @override
  _LoginclientesState createState() => _LoginclientesState();
}

class _LoginclientesState extends State<Loginclientes> {
  final firebase = FirebaseFirestore.instance;

  TextEditingController correo_electronico = TextEditingController();
  TextEditingController password = TextEditingController();
  int _value = 1;

  validarDatos() async {
    try {
      CollectionReference ref = FirebaseFirestore.instance
          .collection("Clientes"); //instanciamos la colección
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
                token tk = new token();
                String idToken = await tk.validarToken("login");
                if (idToken != "") {
                  final firebase = FirebaseFirestore.instance;
                  try {
                    firebase.collection("Tokens").doc(idToken).delete();
                  } catch (e) {
                    print(e);
                  }
                }
                tk.guardarToken(cursor.id);
                //Navigator.of(context, rootNavigator: true).pop();
                /*Navigator.push(context,
                    MaterialPageRoute(builder: (context) => detProductos()));*/
              } else {}
            }
          } else {}
        }
        if (flag == 0) {
          print("Cliente no encontrado");

          const snackBar = SnackBar(
            content: Text(
              'Cliente inactivo o no existe en la base de datos!',
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black,
            behavior: SnackBarBehavior.floating,
            //width: 300,
            //height: 200,
            margin: EdgeInsets.all(60),
            elevation: 30,
            shape: StadiumBorder(
                side: BorderSide(color: Colors.redAccent, width: 2)),
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

  inactivarCliente() async {
    try {
      CollectionReference ref = FirebaseFirestore.instance
          .collection("Clientes"); //instanciamos la colección
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
                      .collection("Clientes")
                      .doc(cursor.id) //traerá el id del documento
                      .set({
                    "correo_electronico": cursor.get("correo_electronico"),
                    "nombre_completo": cursor.get("nombre_completo"),
                    "direccion_envio": cursor.get("direccion_envio"),
                    "telefono_fijo": cursor.get("telefono_fijo"),
                    "telefono_celular": cursor.get("telefono_celular"),
                    "contraseña": cursor.get("contraseña"),
                    "estado": false
                  });
                  mensaje("Inactivacion Exitosa",
                      "Cliente inactivado exitosamente");
                } catch (e) {
                  print(e);
                  mensaje("Error...", "" + e.toString());
                }
              } else {}
            }
          } else {}
        }
        if (flag == 0) {
          print("Cliente no encontrado");
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
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Registrarse',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                fontStyle: FontStyle.italic),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.person_add,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Registroclientes()));
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Image.asset("images/icons8-usuario-96.png"),
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
                          heroTag: null,
                          onPressed: () {
                            validarDatos();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyApp()));
                          },
                          label: const Text(
                            'Iniciar Sesión',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          icon: const Icon(Icons.login),
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
                                    builder: (context) => Modificarcliente()));
                          },
                          heroTag: null,
                          label: const Text(
                            'Modificar Cliente',
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
                                        Modificarpassclientes()));
                          },
                          heroTag: null,
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
                            inactivar("Darse de baja",
                                "¿Desea inactivar este cliente?");
                          },
                          heroTag: null,
                          label: const Text(
                            'Darme de Baja',
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
                  color: Colors.red,
                  fontStyle: FontStyle.italic,
                ),
              ),
              onPressed: () {
                inactivarCliente();
                Navigator.of(context, rootNavigator: true).pop();

                const snackBar = SnackBar(
                  content: Text(
                    '¡Cliente Inactivado Exitosamente!',
                    textAlign: TextAlign.center,
                  ),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                  //width: 300,
                  //height: 200,
                  margin: EdgeInsets.all(60),
                  elevation: 30,
                  shape: StadiumBorder(
                      side: BorderSide(color: Colors.redAccent, width: 2)),
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
                  color: Colors.red,
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
                  color: Colors.red,
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
