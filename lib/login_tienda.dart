import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puntoclave/Productos/registro_productos.dart';
import 'package:puntoclave/Tiendas/registro_tiendas.dart';

class Logintiendas extends StatefulWidget {
  const Logintiendas({Key? key}) : super(key: key);

  @override
  _LogintiendasState createState() => _LogintiendasState();
}

class _LogintiendasState extends State<Logintiendas> {
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
                  MaterialPageRoute(builder: (context) => Registroproductos()));
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
              /*Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    child: Image.asset(""),
                  ),
                ),
              ),*/
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
                        //width: 130.0,
                        //height: 50.0,
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
                padding: EdgeInsets.all(15),
                child: Center(
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
                          onPressed: () {},
                          label: const Text(
                            'Retirar tienda',
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
              Padding(
                padding: EdgeInsets.all(15),
                child: Center(
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
                          onPressed: () {},
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
            ],
          ),
        ),
      ),
    );
  }
}
