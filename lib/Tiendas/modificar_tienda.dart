import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Modificartienda extends StatefulWidget {
  const Modificartienda({Key? key}) : super(key: key);

  @override
  _ModificartiendaState createState() => _ModificartiendaState();
}

class _ModificartiendaState extends State<Modificartienda> {
  final firebase = FirebaseFirestore.instance;

  TextEditingController mail = TextEditingController();
  TextEditingController razonSocial = TextEditingController();
  TextEditingController direccion = TextEditingController();
  TextEditingController telefonoFijo = TextEditingController();
  TextEditingController telefonoCelular = TextEditingController();
  TextEditingController paginaWeb = TextEditingController();
  TextEditingController categoria = TextEditingController();
  TextEditingController rutaFoto = TextEditingController();
  TextEditingController productos = TextEditingController();
  TextEditingController password = TextEditingController();

  //para poderlos comunicar con la función de modificar
  String docId = "";
  String pass = "";
  String correo = "";
  bool status = false;
  bool active = false;

  buscarDatos() async {
    try {
      CollectionReference ref = FirebaseFirestore.instance
          .collection("Tiendas"); //instanciamos la colección
      QuerySnapshot tienda =
          await ref.get(); //almacenamos la colección en la variable cliente

      if (tienda.docs.length != 0) {
        int flag = 0;
        //la variable cursor temporalmente almacenará la información de la colección por cada documento existente en ella
        for (var cursor in tienda.docs) {
          if (cursor.get("correo_electronico") == mail.text) {
            if (cursor.get("contraseña") == password.text) {
              if (cursor.get("estado") == true) {
                flag = 1;
                razonSocial.text = cursor.get("razon_social");
                direccion.text = cursor.get("direccion_fisica");
                telefonoFijo.text = cursor.get("telefono_fijo");
                telefonoCelular.text = cursor.get("telefono_celular");
                paginaWeb.text = cursor.get("pagina_web");
                categoria.text = cursor.get("categoria");
                rutaFoto.text = cursor.get("foto");
                productos.text = cursor.get("productos");
                //garantizamos que vamos a modificar el mismo dato
                this.docId = cursor.id;
                this.correo = cursor.get("correo_electronico");
                this.pass = cursor.get("contraseña");
                this.status = cursor.get("estado");
                this.active = cursor.get("activo");
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

  modTienda() async {
    try {
      await firebase
          .collection("Tiendas")
          .doc(docId) //vacío automaticamente genera el id
          .set({
        "razon_social": razonSocial.text,
        "direccion_fisica": direccion.text,
        "telefono_fijo": telefonoFijo.text,
        "telefono_celular": telefonoCelular.text,
        "pagina_web": paginaWeb.text,
        "categoria": categoria.text,
        "productos": productos.text,
        "foto": rutaFoto.text,
        "correo_electronico": this.correo,
        "estado": this.status,
        "contraseña": this.pass,
        "activo": this.active,
      });
      mensaje("Modificación Exitosa", "Negocio modificado exitosamente");
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
        primarySwatch: Colors.deepOrange,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Actualización de datos Negocios",
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
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 0),
                child: TextField(
                  controller: mail,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    labelText: "Correo Electrónico",
                    hintText: "Digite correo electrónico",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 0),
                child: TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                    hintText: "Contraseña",
                    contentPadding: EdgeInsets.all(10),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    //hoverColor: Colors.red,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 180.0,
                      height: 40.0,
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          buscarDatos();
                        },
                        label: const Text(
                          'Buscar Tienda',
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
                    EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 0),
                child: TextField(
                  controller: razonSocial,
                  decoration: InputDecoration(
                    labelText: "Razón Social",
                    hintText: "Digite nombre del negocio",
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 0),
                child: TextField(
                  controller: direccion,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    labelText: "Dirección Física",
                    hintText: "Digite ubicación del negocio",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 0),
                child: TextField(
                  controller: telefonoFijo,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    labelText: "Teléfono Fijo",
                    hintText: "Digite número de teléfono fijo",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 0),
                child: TextField(
                  controller: telefonoCelular,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    labelText: "Teléfono Celular",
                    hintText: "Digite número de teléfono celular",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 0),
                child: TextField(
                  controller: paginaWeb,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    labelText: "Página Web",
                    hintText: "Digite url de la página web",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 0),
                child: TextField(
                  controller: productos,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    labelText: "Productos",
                    hintText: "Describa sus productos",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 0),
                child: TextField(
                  controller: rutaFoto,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    labelText: "Foto Negocio",
                    hintText: "Foto Negocio",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 0),
                /*child: DropdownButton(
                  //value: _vista,
                  underline: Container(height: 2, color: Colors.deepOrange),
                  items: _lista.map((String a) {
                    return DropdownMenuItem(
                      value: a,
                      child: Text(a),
                    );
                  }).toList(),
                  onChanged: (String? value) => {
                    setState(() {
                      _vista = value!;
                    })
                  },
                  hint: Text(_vista),
                ),*/
                child: TextField(
                  controller: categoria,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    labelText: "Categoria Negocio",
                    hintText: "Seleccione categoria del negocio",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 180.0,
                      height: 40.0,
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          modTienda();
                          razonSocial.clear();
                          direccion.clear();
                          telefonoFijo.clear();
                          telefonoCelular.clear();
                          paginaWeb.clear();
                          categoria.clear();
                          productos.clear();
                          rutaFoto.clear();
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
              )
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
                  color: Colors.indigo,
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
