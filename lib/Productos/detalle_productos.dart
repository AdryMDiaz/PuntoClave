import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class detProductos extends StatefulWidget {
  final String docId;
  detProductos(this.docId);

  @override
  Product_det createState() => Product_det();
}

class Product_det extends State<detProductos> {
  //String nombre = "Nombre producto y/o servicio";

  String logo = "";
  String titulo = "";
  String valor = "";
  String iva = "";
  String total = "";
  String descripcion = "";
  String tienda = "";
  String categoria = "";
  String dcto = "";

  Product_det() {
    buscarDoc();
  }

  buscarDoc() async {
    try {
      CollectionReference ref =
          FirebaseFirestore.instance.collection("Productos");
      QuerySnapshot producto = await ref.get();

      if (producto.docs.length != 0) {
        for (var cursor in producto.docs) {
          if (cursor.id == widget.docId) {
            this.logo = cursor.get("foto_producto");
            this.titulo = cursor.get("nombre_producto");
            this.valor = cursor.get("precio_Sin_Iva");
            this.iva = cursor.get("iva");
            this.total = cursor.get("precio_Venta");
            this.dcto = cursor.get("descuento");
            this.tienda = cursor.get("nombre_tienda");
            this.categoria = cursor.get("categoria_Producto");
            this.descripcion = cursor.get("descripcion_Producto");

            print(widget.docId + " id importado");
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
                    'Valor: ' + valor + ' COP',
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
                    'Valor: ' + iva + ' COP',
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
                    'Valor: ' + total + ' COP',
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
                    'Dcto: ' + dcto + ' COP',
                    //'Valor Total: 30.000 COP',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  tienda,
                  //'Masculino',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[500],
                  ),
                ),
                Text(
                  categoria,
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
                  descripcion,
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
            titulo,
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
              'images/' + logo,
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
