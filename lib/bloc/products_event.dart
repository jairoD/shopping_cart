part of 'products_bloc.dart';

abstract class ProductsEvent {}

class AddProduct extends ProductsEvent {
  final ProductModel product;

  AddProduct(this.product);
}

class RemoveProduct extends ProductsEvent {
  final ProductModel product;

  RemoveProduct(this.product);
}

class CreateCart extends ProductsEvent {}
