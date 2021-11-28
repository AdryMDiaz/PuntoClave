import 'package:flutter/material.dart';

class detProductos extends StatefulWidget {
  @override
  Product_det createState() => Product_det();
}

class Product_det extends State<detProductos> {
  String nombre = "Nombre producto y/o servicio";

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
                  child: const Text(
                    'Valor: 25.200 COP',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'IVA: 4.800 COP',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Valor Total: 30.000 COP',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Masculino',
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
                  "Breve descripción del producto y/o servicio donde se específique"
                  " las características más importantes.",
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
      padding: const EdgeInsets.all(20.0),
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
            nombre,
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
              'images/tshirt_1280.jpg',
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
