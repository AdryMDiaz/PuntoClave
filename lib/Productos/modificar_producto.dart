import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Modificarproducto extends StatefulWidget {
  const Modificarproducto({Key? key}) : super(key: key);
  //final String idProducto;
  //Modificarproducto(this.idProducto);

  @override
  _ModificarproductoState createState() => _ModificarproductoState();
}

class _ModificarproductoState extends State<Modificarproducto> {
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
  TextEditingController status = TextEditingController();

  //para poderlos comunicar con la función de modificar
  String idProducto = "";
  String idTienda = "";
  String nombretienda = "";

  buscarDatos() async {
    try {
      CollectionReference ref = FirebaseFirestore.instance
          .collection("Productos"); //instanciamos la colección
      QuerySnapshot producto =
          await ref.get(); //almacenamos la colección en la variable cliente

      if (producto.docs.length != 0) {
        int flag = 0;
        for (var cursor in producto.docs) {
          if (cursor.get("nombre_producto") == nombreProducto.text) {
            int flag = 1;
            categoriaProducto.text = cursor.get("categoria");
            descripcionProducto.text = cursor.get("descripcion_Producto");
            dcto.text = cursor.get("descuento");
            rutaFoto.text = cursor.get("foto_producto");
            iva.text = cursor.get("iva");
            precioSinIva.text = cursor.get("precio_Sin_Iva");
            precioVenta.text = cursor.get("precio_Venta");
            status.text = cursor.get("estado");
            //garantizamos que vamos a modificar el mismo dato
            this.idProducto = cursor.id;
            this.idTienda = cursor.get("idTienda");
            this.nombretienda = cursor.get("nombre_tienda");
          } else {
            print("Producto no encontrado");
          }
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
          .doc(idProducto) //vacío automaticamente genera el id
          .set({
        "categoria_Producto": categoriaProducto.text,
        "descripcion_Producto": descripcionProducto.text,
        "descuento": dcto.text,
        "estado": status.text,
        "foto_producto": rutaFoto.text,
        "idTienda": this.idTienda,
        "iva": iva.text,
        "nombre_producto": nombreProducto.text,
        "nombre_tienda": this.nombretienda,
        "precio_Sin_Iva": precioSinIva.text,
        "precio_Venta": precioVenta.text,
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
            "Modificación de Productos",
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
                          print(nombreProducto);
                          buscarDatos();
                        },
                        label: const Text(
                          'Buscar Producto',
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
                    labelText: "Estado producto (True/False)",
                    hintText: "Estado producto (True/False)",
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
                          modProducto();

                          nombreProducto.clear();
                          precioVenta.clear();
                          iva.clear();
                          precioSinIva.clear();
                          dcto.clear();
                          categoriaProducto.clear();
                          descripcionProducto.clear();
                          rutaFoto.clear();
                          status.clear();
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
              },
            ),
          ],
        );
      },
    );
  }
}
