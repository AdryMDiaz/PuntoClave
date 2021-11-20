import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Registrotiendas extends StatefulWidget {
  const Registrotiendas({Key? key}) : super(key: key);

  @override
  _RegistrotiendasState createState() => _RegistrotiendasState();
}

class _RegistrotiendasState extends State<Registrotiendas> {
  final firebase = FirebaseFirestore.instance;
  TextEditingController mail = TextEditingController();
  TextEditingController razonSocial = TextEditingController();
  TextEditingController direccion = TextEditingController();
  TextEditingController telefonoFijo = TextEditingController();
  TextEditingController telefonoCelular = TextEditingController();
  TextEditingController paginaWeb = TextEditingController();
  TextEditingController categoria = TextEditingController();
  TextEditingController productos = TextEditingController();
  TextEditingController password1 = TextEditingController();

  registroTiendas() async {
    try {
      await firebase
          .collection("Tiendas")
          .doc() //vacío automaticamente genera el id
          .set({
        "correo_electronico": mail.text,
        "razon_social": razonSocial.text,
        "direccion_fisica": direccion.text,
        "telefono_fijo": telefonoFijo.text,
        "telefono_celular": telefonoCelular.text,
        "pagina_web": paginaWeb.text,
        "categoria": categoria.text,
        "productos": productos.text,
        "contraseña": password1.text,
      });
      mensaje("Registro Exitoso", "Negocio creado exitosamente");
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
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Registro de Negocios",
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
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
                padding:
                    EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 0),
                child: TextField(
                  controller: productos,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    labelText: "Productos",
                    hintText: "Digite sus productos separados por ;",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 0),
                child: TextField(
                  controller: password1,
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
                      //width: 150.0,
                      //height: 25.0,
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          registroTiendas();

                          mail.clear();
                          razonSocial.clear();
                          direccion.clear();
                          telefonoFijo.clear();
                          telefonoCelular.clear();
                          paginaWeb.clear();
                          categoria.clear();
                          productos.clear();
                          password1.clear();
                        },
                        label: const Text(
                          'Crear Negocio',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        icon: const Icon(Icons.add_business),
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
