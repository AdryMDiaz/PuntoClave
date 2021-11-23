import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puntoclave/Clientes/registro_clientes.dart';
import 'package:puntoclave/Productos/modulo_productos.dart';
import 'package:puntoclave/modificar_pass_cli.dart';

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
          //print(cursor.get("correo_electronico"));
          //print(cursor.get("contraseña"));
          //print(correo_electronico.text);
          //print(password.text);
          if (cursor.get("correo_electronico") == correo_electronico.text) {
            // print("Correo encotrado");
            if (cursor.get("contraseña") == password.text) {
              //print("usuario_encontrado");
              flag = 1;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Productos()));
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
                          onPressed: () {
                            validarDatos();
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
                          onPressed: () {},
                          label: const Text(
                            'Modificar Usuario',
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
                                "¿Desea inactivar el usuario?");
                          },
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
