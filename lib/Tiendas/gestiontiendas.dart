import 'package:flutter/material.dart';
import 'package:puntoclave/Productos/registro_productos.dart';
import 'package:puntoclave/main.dart';

class Gestiontiendas extends StatefulWidget {
  const Gestiontiendas({Key? key}) : super(key: key);

  @override
  _GestiontiendasState createState() => _GestiontiendasState();
}

class _GestiontiendasState extends State<Gestiontiendas> {
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
            "Gestion Tiendas",
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
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Image.asset("images/icons8-business-64.png"),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Registroproductos()));
                        },
                        label: const Text(
                          'Crear Producto',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        icon: const Icon(Icons.post_add),
                      ),
                    ),
                  ],
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
                        onPressed: () {},
                        label: const Text(
                          'Modificar Producto',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        icon: const Icon(Icons.business_center),
                      ),
                    ),
                  ],
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
                        onPressed: () {},
                        label: const Text(
                          'Inactivar Producto',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        icon: const Icon(Icons.auto_delete),
                      ),
                    ),
                  ],
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MyApp()));
                        },
                        label: const Text(
                          'Cerrar Sesión',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        icon: const Icon(Icons.auto_delete),
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
}
