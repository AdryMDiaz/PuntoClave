import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Modificarpassclientes extends StatefulWidget {
  const Modificarpassclientes({Key? key}) : super(key: key);

  @override
  _ModificarpassclientesState createState() => _ModificarpassclientesState();
}

class _ModificarpassclientesState extends State<Modificarpassclientes> {
  final firebase = FirebaseFirestore.instance;
  TextEditingController correo_electronico = TextEditingController();
  TextEditingController password_actual = TextEditingController();
  TextEditingController password_nueva = TextEditingController();

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
            if (cursor.get("contraseña") == password_actual.text) {
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
                    "contraseña": password_nueva.text,
                    "estado": true
                  });
                  mensaje(
                      "Operación Exitosa", "Contraseña cambiada exitosamente");
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
            'Cancelar Suscripción',
            style: TextStyle(
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
              /*Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));*/
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
                    width: 150,
                    height: 150,
                    child: Image.asset("images/icons8-usuario-96.png"),
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
                  controller: password_actual,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Contraseña Actual",
                    hintText: "Contraseña actual",
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
                  controller: password_nueva,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Nueva contraseña",
                    hintText: "Nueva contraseña",
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
                            'Cambiar Contraseña',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          icon: const Icon(Icons.how_to_reg),
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
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
