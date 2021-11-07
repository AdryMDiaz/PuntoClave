import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Belleza extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PuntoClave',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Peluquería y Belleza',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
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
        body: SingleChildScrollView(),
      ),
    );
  }
}
