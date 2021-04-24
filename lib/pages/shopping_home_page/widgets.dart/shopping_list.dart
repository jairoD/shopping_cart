import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/bloc/products_bloc.dart';
import 'package:shopping_cart/models/product_model.dart';
import 'package:shopping_cart/pages/shopping_home_page/widgets.dart/shopping_card.dart';

class ShoppingList extends StatelessWidget {
  final List<ProductModel> products;
  const ShoppingList({Key key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(thickness: 1),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ShoppingCard(
            product: products[index],
            action: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.add_circle_outline_outlined,
                      size: 30,
                      color: Colors.black,
                    ),
                    onPressed: () => BlocProvider.of<ProductsBloc>(context)
                        .add(AddProduct(products[index]))),
              ],
            ),
          );
        });
  }
}
