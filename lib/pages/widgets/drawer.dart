import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          color: Colors.black,
          child: ListView(
            children: [
              ListTile(
                title: Text("Ver Pedidos",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                trailing: IconButton(
                    icon: Icon(Icons.arrow_forward, color: Colors.white),
                    onPressed: () =>
                        Navigator.pushNamed(context, "/carts-page")),
              )
            ],
          )),
    );
  }
}
