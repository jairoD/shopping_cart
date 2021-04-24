part of 'products_bloc.dart';

class ProductsState {
  final List<ProductModel> myProducts;

  ProductsState({
    this.myProducts,
  });

  ProductsState addProduct(ProductModel product) {
    myProducts.add(product);
    return ProductsState(myProducts: myProducts);
  }

  ProductsState removeProduct(ProductModel product) {
    myProducts.remove(product);
    return ProductsState(myProducts: myProducts);
  }

  ProductsState clear() {
    return ProductsState(myProducts: []);
  }

  Stream<ProductsState> createCart() async* {
    var response = await FirebaseFirestoreServices().firebaseCreateCart(
        myProducts,
        myProducts.fold(0, (value, element) => value + element.price));
    if (response) clear();
  }
}
