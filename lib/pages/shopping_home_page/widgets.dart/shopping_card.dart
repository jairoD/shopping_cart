import 'package:flutter/material.dart';
import 'package:shopping_cart/models/product_model.dart';

class ShoppingCard extends StatelessWidget {
  final ProductModel product;
  final Widget action;
  const ShoppingCard({Key key, this.product, this.action}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: Card(
          semanticContainer: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                        image: DecorationImage(
                            image: NetworkImage(product.image),
                            fit: BoxFit.contain)),
                    height: 100,
                    width: 100),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${product.name} \$${product.price}",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      Text("${product.description}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                          )),
                    ],
                  ),
                ),
                action ?? SizedBox()
              ],
            ),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
    );
  }
}
