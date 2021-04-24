import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProductsCartModel {
  List<String> productId;
  String cartId;
  double quantity;
  ProductsCartModel({
    this.productId,
    this.cartId,
    this.quantity,
  });

  ProductsCartModel copyWith({
    List<String> productId,
    String cartId,
    double quantity,
  }) {
    return ProductsCartModel(
      productId: productId ?? this.productId,
      cartId: cartId ?? this.cartId,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'cartId': cartId,
      'quantity': quantity,
    };
  }

  factory ProductsCartModel.fromMap(Map<String, dynamic> map) {
    return ProductsCartModel(
      productId: List<String>.from(map['productId']),
      cartId: map['cartId'],
      quantity: map['quantity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsCartModel.fromJson(String source) =>
      ProductsCartModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ProductsCartModel(productId: $productId, cartId: $cartId, quantity: $quantity)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductsCartModel &&
        listEquals(other.productId, productId) &&
        other.cartId == cartId &&
        other.quantity == quantity;
  }

  @override
  int get hashCode => productId.hashCode ^ cartId.hashCode ^ quantity.hashCode;
}
