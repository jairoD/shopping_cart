import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/models/carts_model.dart';
import 'package:shopping_cart/pages/carts_page.dart/widgets/carts_list.dart';
import 'package:shopping_cart/services/firebase/firebase_firestore_services.dart';

class CartsPage extends StatelessWidget {
  const CartsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tus Pedidos",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.black,
      body: Container(
          padding: EdgeInsets.all(12),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestoreServices().firebaseGetCarts(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Algo salio mal :('));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<CartsModel> carts = snapshot.data.docs
                  .map((e) => CartsModel(status: e.data()["status"], id: e.id))
                  .toList();
              return CartsList(carts: carts);
            },
          )),
    );
  }
}
