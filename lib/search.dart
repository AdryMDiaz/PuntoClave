import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:puntoclave/Productos/list_productos.dart';

class search extends SearchDelegate {
  @override
  final String searchFieldLabel;

  //mediante este constructor establecemos el texto que irá en el TextField
  search(this.searchFieldLabel);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon:
            const Icon(Icons.clear), //icono que limpiara la búsqueda realizada
        onPressed: () => this.query = '',
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons
          .arrow_back), //icono que permitirá regresar a la pantalla anterior
      onPressed: () => this.close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //Se mostrarán los resultados de búsqueda

    print(query);

    return const Text(
        'Resultados de la Búsqueda de Productos, Servicios y/o Categorías');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //Se mostrarán los resultados de búsqueda

    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Tiendas").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              if (snapshot.data!.docs[index]
                  .get("razon_social")
                  .toString()
                  .toUpperCase()
                  .contains(query.toUpperCase())) {
                return Card(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Listproductos(
                                  snapshot.data!.docs[index].id)));
                    },
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          height: 220.0,
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
                            padding: const EdgeInsets.fromLTRB(
                                130.0, 10.0, 10.0, 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 120.0,
                                      child: Text(
                                        snapshot.data!.docs[index]
                                            .get("razon_social"),
                                        style: const TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.favorite_border,
                                      color: Colors.pinkAccent,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 120.0,
                                      child: Text(
                                        snapshot.data!.docs[index]
                                            .get("direccion_fisica"),
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 120.0,
                                      child: Text(
                                        snapshot.data!.docs[index]
                                            .get("correo_electronico"),
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 120.0,
                                      child: Text(
                                        snapshot.data!.docs[index]
                                            .get("telefono_fijo"),
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 120.0,
                                      child: Text(
                                        snapshot.data!.docs[index]
                                            .get("telefono_celular"),
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 120.0,
                                      child: Text(
                                        snapshot.data!.docs[index]
                                            .get("pagina_web"),
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 120.0,
                                      child: Text(
                                        snapshot.data!.docs[index]
                                            .get("productos"),
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
                          left: 5.0,
                          bottom: 5.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.asset(
                              //'images/shopping_1280.jpg',
                              "images/" +
                                  snapshot.data!.docs[index].get("foto"),
                              width: 125.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return new Card();
              }
            },
          );

          /*return const ListTile(
      title: Text('Sugerencias de Búsqueda de Productos, Servicios y/o Categorías'),
    );*/
        });
  }
}
