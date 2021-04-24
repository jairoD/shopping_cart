import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_cart/models/product_model.dart';

class FirebaseFirestoreServices {
  CollectionReference cartsCollection =
      FirebaseFirestore.instance.collection("/carts");
  CollectionReference productsCartsCollection =
      FirebaseFirestore.instance.collection("/products-carts");
  CollectionReference productsCollection =
      FirebaseFirestore.instance.collection("/products");

  firebaseGetProducts() {
    Stream products = productsCollection.snapshots();
    return products;
  }

  firebaseGetCarts() {
    Stream carts = cartsCollection.snapshots();
    return carts;
  }

  Future<bool> firebaseCreateCart(
      List<ProductModel> productsSelected, double total) async {
    try {
      var createCartResponse =
          await cartsCollection.add({"status": "pendiente"});
      await productsCartsCollection.add({
        "products": productsSelected.map((e) => e.id).toList(),
        "cartId": createCartResponse.id,
        "total": total
      }).then((value) {
        return true;
      });
      return false;
    } catch (e) {
      return false;
    }
  }
}
