import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Publicidad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PuntoClave',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Publicidad y Fotografía',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                fontStyle: FontStyle.italic),
          ),
          leading: const Icon(Icons.menu),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.home,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(120.0, 10.0, 10.0, 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100.0,
                                child: const Text(
                                  'Negocio 1',
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const Icon(
                                Icons.favorite_border,
                                color: Colors.pinkAccent,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 1.0,
                          ),
                          const Text(
                              'Dirección Física: , Correo Electrónico: , Geolocalización: '),
                          const Text('Teléfono Fijo: , Número de Celular: '),
                          const Text('Página Web: '),
                          const SizedBox(
                            height: 1.0,
                          ),
                          const Text('Productos: '),
                          const SizedBox(
                            height: 1.0,
                          ),
                          const Text('⭐⭐⭐⭐⭐'),
                          const SizedBox(
                            height: 1.0,
                          ),
                          Row(
                            children: const [
                              Text(
                                '45 min',
                                style: TextStyle(color: Colors.black54),
                              ),
                              Icon(
                                Icons.timer,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5.0,
                    left: 18.0,
                    bottom: 5.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                        'https://t3.ftcdn.net/jpg/00/67/45/86/240_F_67458672_QwFWNd3yoVE7XEZXeGsRNhNhQXnWQ0hg.jpg',
                        width: 110.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(120.0, 10.0, 10.0, 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100.0,
                                child: const Text(
                                  'Negocio 2',
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const Icon(
                                Icons.favorite_border,
                                color: Colors.pinkAccent,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 1.0,
                          ),
                          const Text(
                              'Dirección Física: , Correo Electrónico: , Geolocalización: '),
                          const Text('Teléfono Fijo: , Número de Celular: '),
                          const Text('Página Web: '),
                          const SizedBox(
                            height: 1.0,
                          ),
                          const Text('Productos: '),
                          const SizedBox(
                            height: 1.0,
                          ),
                          const Text('⭐⭐⭐⭐⭐'),
                          const SizedBox(
                            height: 1.0,
                          ),
                          Row(
                            children: const [
                              Text(
                                '45 min',
                                style: TextStyle(color: Colors.black54),
                              ),
                              Icon(
                                Icons.timer,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5.0,
                    left: 18.0,
                    bottom: 5.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                        'https://t3.ftcdn.net/jpg/00/67/45/86/240_F_67458672_QwFWNd3yoVE7XEZXeGsRNhNhQXnWQ0hg.jpg',
                        width: 110.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(120.0, 10.0, 10.0, 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100.0,
                                child: const Text(
                                  'Negocio 3',
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const Icon(
                                Icons.favorite_border,
                                color: Colors.pinkAccent,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 1.0,
                          ),
                          const Text(
                              'Dirección Física: , Correo Electrónico: , Geolocalización: '),
                          const Text('Teléfono Fijo: , Número de Celular: '),
                          const Text('Página Web: '),
                          const SizedBox(
                            height: 1.0,
                          ),
                          const Text('Productos: '),
                          const SizedBox(
                            height: 1.0,
                          ),
                          const Text('⭐⭐⭐⭐⭐'),
                          const SizedBox(
                            height: 1.0,
                          ),
                          Row(
                            children: const [
                              Text(
                                '45 min',
                                style: TextStyle(color: Colors.black54),
                              ),
                              Icon(
                                Icons.timer,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5.0,
                    left: 18.0,
                    bottom: 5.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                        'https://t3.ftcdn.net/jpg/00/67/45/86/240_F_67458672_QwFWNd3yoVE7XEZXeGsRNhNhQXnWQ0hg.jpg',
                        width: 110.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(120.0, 10.0, 10.0, 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100.0,
                                child: const Text(
                                  'Negocio 4',
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const Icon(
                                Icons.favorite_border,
                                color: Colors.pinkAccent,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 1.0,
                          ),
                          const Text(
                              'Dirección Física: , Correo Electrónico: , Geolocalización: '),
                          const Text('Teléfono Fijo: , Número de Celular: '),
                          const Text('Página Web: '),
                          const SizedBox(
                            height: 1.0,
                          ),
                          const Text('Productos: '),
                          const SizedBox(
                            height: 1.0,
                          ),
                          const Text('⭐⭐⭐⭐⭐'),
                          const SizedBox(
                            height: 1.0,
                          ),
                          Row(
                            children: const [
                              Text(
                                '45 min',
                                style: TextStyle(color: Colors.black54),
                              ),
                              Icon(
                                Icons.timer,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5.0,
                    left: 18.0,
                    bottom: 5.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                        'https://t3.ftcdn.net/jpg/00/67/45/86/240_F_67458672_QwFWNd3yoVE7XEZXeGsRNhNhQXnWQ0hg.jpg',
                        width: 110.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(120.0, 10.0, 10.0, 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100.0,
                                child: const Text(
                                  'Negocio 5',
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const Icon(
                                Icons.favorite_border,
                                color: Colors.pinkAccent,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 1.0,
                          ),
                          const Text(
                              'Dirección Física: , Correo Electrónico: , Geolocalización: '),
                          const Text('Teléfono Fijo: , Número de Celular: '),
                          const Text('Página Web: '),
                          const SizedBox(
                            height: 1.0,
                          ),
                          const Text('Productos: '),
                          const SizedBox(
                            height: 1.0,
                          ),
                          const Text('⭐⭐⭐⭐⭐'),
                          const SizedBox(
                            height: 1.0,
                          ),
                          Row(
                            children: const [
                              Text(
                                '45 min',
                                style: TextStyle(color: Colors.black54),
                              ),
                              Icon(
                                Icons.timer,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5.0,
                    left: 18.0,
                    bottom: 5.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                        'https://t3.ftcdn.net/jpg/00/67/45/86/240_F_67458672_QwFWNd3yoVE7XEZXeGsRNhNhQXnWQ0hg.jpg',
                        width: 110.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
