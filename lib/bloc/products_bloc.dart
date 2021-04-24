import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shopping_cart/models/product_model.dart';
import 'package:shopping_cart/services/firebase/firebase_firestore_services.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsState(myProducts: []));

  @override
  Stream<ProductsState> mapEventToState(
    ProductsEvent event,
  ) async* {
    if (event is AddProduct) {
      yield state.addProduct(event.product);
    }
    if (event is RemoveProduct) {
      yield state.removeProduct(event.product);
    }
    if (event is CreateCart) {
      yield* state.createCart();
      yield state.clear();
    }
  }
}
