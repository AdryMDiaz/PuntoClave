import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puntoclave/Clientes/registro_clientes.dart';
import 'package:puntoclave/Productos/modulo_productos.dart';

class Loginclientes extends StatefulWidget {
  const Loginclientes({Key? key}) : super(key: key);

  @override
  _LoginclientesState createState() => _LoginclientesState();
}

class _LoginclientesState extends State<Loginclientes> {
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
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      "images/bubbles_1280.png",
                    ),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      //width: 130.0,
                      //height: 50.0,
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
                    SizedBox(
                      //width: 130.0,
                      //height: 50.0,
                      child: FloatingActionButton.extended(
                        //backgroundColor: Colors.white60,
                        //foregroundColor: Colors.brown,
                        onPressed: () {
                          validarDatos();
                        },
                        label: const Text(
                          'Darme de baja',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        icon: const Icon(Icons.auto_delete),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
