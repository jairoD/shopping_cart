import 'package:flutter/material.dart';
import 'package:shopping_cart/models/carts_model.dart';

class CartsList extends StatelessWidget {
  final List<CartsModel> carts;
  const CartsList({Key key, this.carts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(thickness: 1),
        itemCount: carts.length,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            child: Card(
                semanticContainer: true,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Estado: ${carts[index].status}",
                                style: TextStyle(fontSize: 22)),
                            Text("id: ${carts[index].id}",
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )),
          );
        });
  }
}
