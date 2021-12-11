import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class carritocompras extends StatefulWidget {
  final String idUser;
  carritocompras(this.idUser);
  @override
  carritocomprasapp createState() => carritocomprasapp();
}

class carritocomprasapp extends State<carritocompras> {
  //final User? user = auth.currentUser;
  final firebase = FirebaseFirestore.instance;
  int total = 0;
  num totalcompra = 0;

  borrarDocumento(String idItem) async {
    try {
      await firebase.collection("Carrito").doc(idItem).delete();
      calcularTotal();
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    calcularTotal();
    super.initState();
  }

  actualizarCantidad(int _cant, String item, int precio) async {
    try {
      await firebase
          .collection("Carrito")
          .doc(item)
          .update({"Cantidad": _cant});

      await firebase
          .collection("Carrito")
          .doc(item)
          .update({"TotalPago": _cant * precio});
    } catch (e) {
      print(e);
    }
  }

  String calcularTotal() {
    firebase
        .collection('Carrito')
        .where('UsuarioId', isEqualTo: widget.idUser)
        .get()
        .then((value) {
      setState(() {
        totalcompra = 0;
        value.docs.forEach((element) {
          totalcompra = totalcompra + element.data()["TotalPago"];
        });
      });
    });

    return totalcompra.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    Widget pagoTotal = (Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 120),
      height: 40,
      width: 400,
      color: Colors.grey[200],
      child: Row(
        children: <Widget>[
          Text("Total:  \$${calcularTotal()}",
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Colors.black))
        ],
      ),
    ));

    Widget ListSection = (Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Carrito").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, index) {
                if (snapshot.data!.docs[index].get("UsuarioId") ==
                    widget.idUser) {
                  var cant = new List<int>.filled(snapshot.data!.docs.length,
                      snapshot.data!.docs[index].get("Cantidad"));
                  total = snapshot.data!.docs[index].get("PrecioNeto") *
                      snapshot.data!.docs[index].get("Cantidad");
                  return Card(
                    shadowColor: Colors.red,
                    elevation: 5,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      snapshot.data!.docs[index]
                                          .get("NombreProducto"),
                                      style: const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    'Precio: \$${snapshot.data!.docs[index].get("PrecioNeto")}',
                                    style: const TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    'Total: \$${total}',
                                    style: const TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.remove),
                                        onPressed: () {
                                          setState(() {
                                            if (cant[index] == 1) {
                                              cant[index] = 1;
                                            } else {
                                              cant[index] = cant[index] - 1;
                                            }
                                            actualizarCantidad(
                                                cant[index],
                                                snapshot.data!.docs[index].id,
                                                snapshot.data!.docs[index]
                                                    .get("PrecioNeto"));
                                            calcularTotal();
                                          });
                                        },
                                        color: Colors.deepOrange,
                                      ),
                                      Text(cant[index].toString(),
                                          style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                      IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: () {
                                          setState(() {
                                            cant[index] = cant[index] + 1;
                                            actualizarCantidad(
                                                cant[index],
                                                snapshot.data!.docs[index].id,
                                                snapshot.data!.docs[index]
                                                    .get("PrecioNeto"));

                                            calcularTotal();
                                          });
                                        },
                                        color: Colors.deepOrange,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 35,
                                    height: 35,
                                    child: FittedBox(
                                      child: FloatingActionButton(
                                        tooltip: "Borrar del carrito",
                                        onPressed: () {
                                          borrarDocumento(
                                              snapshot.data!.docs[index].id);
                                        },
                                        heroTag: null,
                                        child:
                                            const Icon(Icons.delete_outlined),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  );
                } else {
                  return new Card();
                }
              },
            );
          }),
    ));

    Widget ButtomSection = (Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SizedBox(
        width: 160.0,
        height: 40.0,
        child: FloatingActionButton.extended(
          heroTag: null,
          onPressed: () {
            confirmar(context);
          },
          label: const Text(
            'Finalizar Pedido',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
          icon: const Icon(Icons.attach_money),
        ),
      ),
    ));

    return MaterialApp(
      title: 'PuntoClave',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Carrito de Compras",
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
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.home,
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                ListSection,
                pagoTotal,
                ButtomSection,
                //pagoTotal(totalProd),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void confirmar(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          content: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.red))),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            "Entrega a Domicilio",
                            style: TextStyle(fontSize: 16, color: Colors.red),
                          ),
                        ),
                        Icon(
                          Icons.home_work_sharp,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.red))),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            "Recoger en Tienda",
                            style: TextStyle(fontSize: 16, color: Colors.red),
                          ),
                        ),
                        Icon(
                          Icons.store_sharp,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
