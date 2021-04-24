import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/bloc/products_bloc.dart';
import 'package:shopping_cart/models/product_model.dart';
import 'package:shopping_cart/pages/shopping_home_page/widgets.dart/shopping_card.dart';

class LocalCartBody extends StatelessWidget {
  const LocalCartBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state.myProducts.isEmpty)
            return Center(
                child: Text("Aun no ha seleccionado articulos.",
                    style: TextStyle(fontSize: 22, color: Colors.white)));
          return ListView.separated(
              separatorBuilder: (context, index) => Divider(thickness: 1),
              itemCount: state.myProducts.toSet().toList().length,
              itemBuilder: (context, index) {
                ProductModel product = state.myProducts.toSet().toList()[index];
                return ShoppingCard(
                  product: product,
                  action: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.remove_circle_outline,
                            size: 30,
                            color: Colors.black,
                          ),
                          onPressed: () =>
                              BlocProvider.of<ProductsBloc>(context)
                                  .add(RemoveProduct(product))),
                      Text(
                          "Cantidad: ${state.myProducts.where((element) => element.id == product.id).length}",
                          style: TextStyle(
                            fontSize: 14,
                          ))
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
