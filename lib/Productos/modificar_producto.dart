import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Modificarproducto extends StatefulWidget {
  //const Modificarproducto({Key? key}) : super(key: key);
  final String idProducto;
  Modificarproducto(this.idProducto);

  @override
  _ModificarproductoState createState() => _ModificarproductoState();
}

class _ModificarproductoState extends State<Modificarproducto> {
  final firebase = FirebaseFirestore.instance;

  //TextEditingController nombreTienda = TextEditingController();
  TextEditingController nombreProducto = TextEditingController();
  TextEditingController precioVenta = TextEditingController();
  TextEditingController valorIva = TextEditingController();
  TextEditingController precioSinIva = TextEditingController();
  TextEditingController valorDcto = TextEditingController();
  TextEditingController categoriaProducto = TextEditingController();
  TextEditingController descripcionProducto = TextEditingController();
  TextEditingController rutaFoto = TextEditingController();

  //para poderlos comunicar con la función de modificar
  String docId = "";
  bool status = false;
  String nombreTienda = "";
  String idTienda = "";

  buscarDatos() async {
    try {
      CollectionReference ref = FirebaseFirestore.instance
          .collection("Productos"); //instanciamos la colección
      QuerySnapshot tienda =
          await ref.get(); //almacenamos la colección en la variable cliente

      if (tienda.docs.length != 0) {
        int flag = 0;
        //la variable cursor temporalmente almacenará la información de la colección por cada documento existente en ella
        for (var cursor in tienda.docs) {
          if (cursor.id == widget.idProducto) {
            flag = 1;
            print(cursor.id);
            //nombreTienda.text = cursor.get("nombre_tienda");
            nombreProducto.text = cursor.get("nombre_producto");
            valorIva.text = cursor.get("iva");
            valorDcto.text = cursor.get("descuento");
            precioVenta.text = cursor.get("precio_Venta");
            precioSinIva.text = cursor.get("precio_Sin_Iva");
            descripcionProducto.text = cursor.get("descripcion_Producto");
            categoriaProducto.text = cursor.get("categoria_Producto");
            rutaFoto.text = cursor.get("foto_producto");
            //garantizamos que vamos a modificar el mismo dato
            this.docId = cursor.id;
            this.status = cursor.get("estado");
            this.nombreTienda = cursor.get("nombre_tienda");
            this.idTienda = cursor.get("idTienda");
          } else {}
        }
        if (flag == 0) {
          print("Producto no encontrado");
        }
      } else {
        print("Colección vacía");
      }
    } catch (e) {
      print(e);
    }
  }

  modProducto() async {
    try {
      await firebase
          .collection("Productos")
          .doc(docId) //vacío automaticamente genera el id
          .set({
        "nombre_producto": nombreProducto.text,
        "precio_Sin_Iva": precioSinIva.text,
        "iva": valorIva.text,
        "precio_Venta": precioVenta.text,
        "descuento": valorDcto.text,
        "descripcion_Producto": descripcionProducto.text,
        "categoria_Producto": categoriaProducto.text,
        "foto_producto": rutaFoto.text,
        "idTienda": this.idTienda,
        "nombre_tienda": this.nombreTienda,
        "estado": true,
      });
      mensaje("Modificación Exitosa", "Producto modificado exitosamente");
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
            "Modificación de Producto",
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
                          print(widget.idProducto);
                          buscarDatos();
                        },
                        heroTag: null,
                        label: const Text(
                          'Llenar campos',
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
                  controller: nombreProducto,
                  decoration: InputDecoration(
                    labelText: "Nombre Producto",
                    hintText: "Digite el nombre del producto",
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
                  controller: categoriaProducto,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    labelText: "Categoría Producto",
                    hintText: "Digite la categoría del producto",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 0),
                child: TextField(
                  controller: precioSinIva,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    labelText: "Precio Bruto",
                    hintText: "Digite el valor antes de IVA",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 0),
                child: TextField(
                  controller: valorIva,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    labelText: "IVA",
                    hintText: "Digite el valor del IVA",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 0),
                child: TextField(
                  controller: precioVenta,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    labelText: "Precio Venta",
                    hintText: "Digite el valor a la venta",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 0),
                child: TextField(
                  controller: valorDcto,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    labelText: "Valor Descuento",
                    hintText: "Digite valor descuento",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 0),
                child: TextField(
                  controller: descripcionProducto,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    labelText: "Descripción Producto",
                    hintText: "Describa brevemente el producto",
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
                    labelText: "Foto Producto",
                    hintText: "Foto Producto",
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
                          modProducto();
                          nombreProducto.clear();
                          categoriaProducto.clear();
                          precioVenta.clear();
                          precioSinIva.clear();
                          valorIva.clear();
                          valorDcto.clear();
                          descripcionProducto.clear();
                          rutaFoto.clear();
                        },
                        heroTag: null,
                        label: const Text(
                          'Actualizar Campos',
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
              },
            ),
          ],
        );
      },
    );
  }
}
