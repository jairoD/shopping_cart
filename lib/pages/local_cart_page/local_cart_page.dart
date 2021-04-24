import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/bloc/products_bloc.dart';
import 'package:shopping_cart/pages/local_cart_page/widgets/local_cart_body.dart';
import 'package:shopping_cart/pages/widgets/general_button.dart';

class LocalCartPage extends StatelessWidget {
  const LocalCartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        backgroundColor: Colors.black,
        body: Container(
            padding: EdgeInsets.all(12),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                LocalCartBody(),
                GeneralButton(
                  function: () =>
                      BlocProvider.of<ProductsBloc>(context).add(CreateCart()),
                  text: "Comprar",
                )
              ],
            )));
  }
}
