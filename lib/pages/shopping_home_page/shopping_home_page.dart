import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/models/product_model.dart';
import 'package:shopping_cart/pages/shopping_home_page/widgets.dart/shopping_cart_button.dart';
import 'package:shopping_cart/pages/shopping_home_page/widgets.dart/shopping_list.dart';
import 'package:shopping_cart/pages/widgets/drawer.dart';
import 'package:shopping_cart/services/firebase/firebase_firestore_services.dart';

class ShoppingHomePage extends StatelessWidget {
  const ShoppingHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(
          "Articulos disponibles",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.black,
      floatingActionButton: ShoppingCartButton(),
      body: Container(
          padding: EdgeInsets.all(12),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestoreServices().firebaseGetProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Algo salio mal :('));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<ProductModel> products = snapshot.data.docs
                  .map((e) => ProductModel.fromMap(e.data()))
                  .toList();
              return ShoppingList(products: products);
            },
          )),
    );
  }
}
