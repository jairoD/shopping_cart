import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/bloc/products_bloc.dart';

class ShoppingCartButton extends StatelessWidget {
  const ShoppingCartButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        return FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () => Navigator.pushNamed(context, "/local-cart"),
          child: Stack(
            children: [
              state.myProducts.isEmpty
                  ? SizedBox()
                  : Align(
                      alignment: Alignment.topRight,
                      child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              color: Color(0xff5667f9),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(state.myProducts.length.toString()))),
                    ),
              Align(
                alignment: Alignment.center,
                child: Icon(Icons.shopping_bag_outlined, color: Colors.white),
              )
            ],
          ),
        );
      },
    );
  }
}
