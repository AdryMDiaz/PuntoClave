import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puntoclave/main.dart';

class Modificarcliente extends StatefulWidget {
  const Modificarcliente({Key? key}) : super(key: key);

  @override
  _ModificarclienteState createState() => _ModificarclienteState();
}

class _ModificarclienteState extends State<Modificarcliente> {
  final firebase = FirebaseFirestore.instance;
  TextEditingController mail = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController cellphone = TextEditingController();
  TextEditingController password = TextEditingController();

  //para poderlos comunicar con la función de modificar
  String docId = "";
  String pass = "";
  String correo = "";
  bool status = false;

  buscarDatos() async {
    try {
      CollectionReference ref = FirebaseFirestore.instance
          .collection("Clientes"); //instanciamos la colección
      QuerySnapshot cliente =
          await ref.get(); //almacenamos la colección en la variable cliente

      if (cliente.docs.length != 0) {
        int flag = 0;
        //la variable cursor temporalmente almacenará la información de la colección por cada documento existente en ella
        for (var cursor in cliente.docs) {
          if (cursor.get("correo_electronico") == mail.text) {
            if (cursor.get("contraseña") == password.text) {
              if (cursor.get("estado") == true) {
                flag = 1;
                name.text = cursor.get("nombre_completo");
                address.text = cursor.get("direccion_envio");
                phone.text = cursor.get("telefono_fijo");
                cellphone.text = cursor.get("telefono_celular");
                //garantizamos que vamos a modificar el mismo dato
                this.docId = cursor.id;
                this.correo = cursor.get("correo_electronico");
                this.pass = cursor.get("contraseña");
                this.status = cursor.get("estado");
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

  modCliente() async {
    try {
      await firebase.collection("Clientes").doc(docId).set({
        "correo_electronico": this.correo,
        "nombre_completo": name.text,
        "direccion_envio": address.text,
        "telefono_fijo": phone.text,
        "telefono_celular": cellphone.text,
        "contraseña": this.pass,
        "estado": this.status,
      });
      mensaje("Modificación Exitosa", "Cliente modificado exitosamente");
    } catch (e) {
      print(e);
      mensaje("Error...", "" + e.toString());
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
          centerTitle: true,
          title: const Text(
            'Actualización de datos',
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
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],*/
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
                child: TextField(
                  controller: mail,
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
                padding: EdgeInsets.all(20.0),
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
                          buscarDatos();
                        },
                        label: const Text(
                          'Buscar Cliente',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        icon: const Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: "Nombres y Apellidos",
                    hintText: "Nombres y Apellidos",
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
                  controller: address,
                  decoration: InputDecoration(
                    labelText: "Dirección Física",
                    hintText: "Dirección Física",
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
                  controller: phone,
                  decoration: InputDecoration(
                    labelText: "Teléfono Fijo",
                    hintText: "Número de teléfono fijo",
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
                  controller: cellphone,
                  decoration: InputDecoration(
                    labelText: "Teléfono Celular",
                    hintText: "Número de teléfono celular",
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
                padding: EdgeInsets.all(20.0),
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
                          modCliente();

                          mail.clear();
                          name.clear();
                          address.clear();
                          phone.clear();
                          cellphone.clear();
                          password.clear();
                        },
                        label: const Text(
                          'Actualizar Datos',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        icon: const Icon(Icons.mode_edit),
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
