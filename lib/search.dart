import 'package:flutter/material.dart';

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
    return const Text(
        //Se mostrarán los resultados de búsqueda
        'Resultados de la Búsqueda de Productos, Servicios y/o Categorías');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const ListTile(
      title: Text(
          //Se mostrarán los resultados de búsqueda
          'Sugerencias de Búsqueda de Productos, Servicios y/o Categorías'),
    );
  }
}
