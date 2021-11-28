import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:puntoclave/Tiendas/gestiontiendas.dart';

class Registroproductos extends StatefulWidget {
  const Registroproductos({Key? key}) : super(key: key);

  @override
  _RegistroproductosState createState() => _RegistroproductosState();
}

class _RegistroproductosState extends State<Registroproductos> {
  final firebase = FirebaseFirestore.instance;
  TextEditingController nombreTienda = TextEditingController();
  TextEditingController nombreProducto = TextEditingController();
  TextEditingController precioVenta = TextEditingController();
  TextEditingController iva = TextEditingController();
  TextEditingController precioSinIva = TextEditingController();
  TextEditingController dcto = TextEditingController();
  TextEditingController categoriaProducto = TextEditingController();
  TextEditingController descripcionProducto = TextEditingController();
  TextEditingController rutaFoto = TextEditingController();

  registroProductos() async {
    try {
      await firebase
          .collection("Productos")
          .doc() //vacío automaticamente genera el id
          .set({
        "nombre_tienda": nombreTienda.text,
        "nombre_producto": nombreProducto.text,
        "precio_Venta": precioVenta.text,
        "iva": iva.text,
        "precio_Sin_Iva": precioSinIva.text,
        "descuento": dcto.text,
        "categoria_Producto": categoriaProducto.text,
        "descripcion_Producto": descripcionProducto.text,
        "foto_producto": rutaFoto.text,
        "estado": true
      });
      mensaje("Registro Exitoso", "Producto creado exitosamente");
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
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Registro de Productos",
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
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
                child: TextField(
                  controller: nombreTienda,
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: "Nombre Tienda",
                    hintText: "Digite nombre de la tienda",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
                child: TextField(
                  controller: nombreProducto,
                  decoration: InputDecoration(
                    labelText: "Nombre Producto",
                    hintText: "Digite el nombre del producto",
                    isDense: true,
                    contentPadding: EdgeInsets.all(12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
                child: TextField(
                  controller: precioVenta,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(12),
                    labelText: "Precio Venta",
                    hintText: "Digite valor de venta del producto",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
                child: TextField(
                  controller: iva,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(12),
                    labelText: "Valor IVA",
                    hintText: "Digite el valor del IVA",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
                child: TextField(
                  controller: precioSinIva,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(12),
                    labelText: "Valor sin Iva",
                    hintText: "Digite valor del producto sin IVA",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
                child: TextField(
                  controller: dcto,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(12),
                    labelText: "Valor Descuento",
                    hintText: "Digite valor del descuento",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
                child: TextField(
                  controller: categoriaProducto,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(12),
                    labelText: "Categoria Producto",
                    hintText: "Seleccione categoria del producto",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
                child: TextField(
                  controller: descripcionProducto,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(12),
                    labelText: "Descripcion del Producto",
                    hintText: "Digite breve descripcion del producto",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
                child: TextField(
                  controller: rutaFoto,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(12),
                    labelText: "Foto producto",
                    hintText: "Foto producto",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
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
                        onPressed: () {
                          registroProductos();

                          nombreTienda.clear();
                          nombreProducto.clear();
                          precioVenta.clear();
                          iva.clear();
                          precioSinIva.clear();
                          dcto.clear();
                          categoriaProducto.clear();
                          descripcionProducto.clear();
                          rutaFoto.clear();
                        },
                        label: const Text(
                          'Crear Producto',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        icon: const Icon(Icons.add_box),
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
                  color: Colors.deepPurple,
                  fontStyle: FontStyle.italic,
                ),
              ),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Gestiontiendas()));
              },
            ),
          ],
        );
      },
    );
  }
}
