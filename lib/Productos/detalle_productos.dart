import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:puntoclave/Productos/objeto_producto.dart';

class detProductos extends StatefulWidget {
  final ObjetoProducto productoObj;
  detProductos(this.productoObj);
  //final String docId;
  //detProductos(this.docId);

  @override
  Product_det createState() => Product_det();
}

class Product_det extends State<detProductos> {
  //String nombre = "Nombre producto y/o servicio";
  ObjetoProducto productoObj = new ObjetoProducto();

  /*String logo = "";
  String titulo = "";
  String valor = "";
  String iva = "";
  String total = "";
  String descripcion = "";
  String tienda = "";
  String categoria = "";
  String dcto = "";
  String idTienda = "";*/

  Product_det() {
    //buscarDoc();
  }

  //Las clases van en mayúscula
  //Los métodos en minúscula
  //ObjetoProducto objProducto = new ObjetoProducto();

  buscarDoc(docId) async {
    try {
      CollectionReference ref =
          FirebaseFirestore.instance.collection("Productos");
      QuerySnapshot producto = await ref.get();

      if (producto.docs.length != 0) {
        for (var cursor in producto.docs) {
          if (cursor.id == docId) {
            productoObj.tienda = cursor.get("razon_social");
            productoObj.logo = cursor.get("foto_producto");
            productoObj.titulo = cursor.get("razon_social");
            productoObj.descripcion = cursor.get("descripcion_Producto");
            productoObj.categoria = cursor.get("categoria_Producto");
            productoObj.dcto = cursor.get("descuento");
            productoObj.total = cursor.get("precio_Venta");
            productoObj.iva = cursor.get("iva");
            productoObj.valor = cursor.get("precio_Sin_Iva");
            productoObj.idTienda = cursor.get("idTienda");
            productoObj.producto = cursor.get("nombre_producto");
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Valor: ' + widget.productoObj.valor + ' COP',
                    //'Valor: 25.200 COP',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Valor: ' + widget.productoObj.iva + ' COP',
                    //'IVA: 4.800 COP',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Valor: ' + widget.productoObj.total + ' COP',
                    //'Valor Total: 30.000 COP',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Dcto: ' + widget.productoObj.dcto + ' COP',
                    //'Valor Total: 30.000 COP',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "Nombre Negocio: " + widget.productoObj.tienda,
                  //'Masculino',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[500],
                  ),
                ),
                Text(
                  "Categoria: " + widget.productoObj.categoria,
                  //'Masculino',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[500],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text('⭐⭐⭐⭐⭐'),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Descripción: ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  widget.productoObj.descripcion,
                  /*"Breve descripción del producto y/o servicio donde se específique"
                  " las características más importantes.",*/
                  textAlign: TextAlign.justify,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Widget bottomSection = Container(
      padding: const EdgeInsets.all(5.0),
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
                print('Ir a carrito de compras');
                //Navigator.pop(context);
              },
              heroTag: null,
              label: const Text(
                'Añadir al Carrito',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900),
              ),
              icon: const Icon(Icons.add_shopping_cart),
            ),
          ),
        ],
      ),
    );

    return MaterialApp(
      title: 'PuntoClave',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.productoObj.titulo,
            style: const TextStyle(
                color: Colors.white60,
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
          actions: <Widget>[],
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/' + widget.productoObj.logo,
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            textSection,
            bottomSection,
          ],
        ),
      ),
    );
  }
}
