import 'package:flutter/material.dart';

class MenuLateralT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: Icon(Icons.account_circle_rounded),
            accountName: Text("Nombre Usuario"),
            accountEmail: Text('nameusuario@nameusuario.com'),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://www.viajaporlibre.com/wp-content/uploads/2019/12/Kremlin-de-Moscu-6-1024x683.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
            ),
            title: Text('Mi Cuenta'),
          ),
          ListTile(
            leading: Icon(Icons.business_center),
            title: Text('Mis Pedidos'),
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Métodos de Pago'),
          ),
          ListTile(
            leading: Icon(Icons.contact_support_sharp),
            title: Text('Ayuda y Comentarios'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Ajustes'),
          ),
        ],
      ),
    );
  }
}
