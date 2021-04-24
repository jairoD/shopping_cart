import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/bloc/products_bloc.dart';
import 'package:shopping_cart/pages/carts_page.dart/carts_page.dart';
import 'package:shopping_cart/pages/local_cart_page/local_cart_page.dart';
import 'package:shopping_cart/pages/root/root_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/pages/shopping_home_page/shopping_home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text("Error");
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return BlocProvider<ProductsBloc>(
            create: (context) => ProductsBloc(),
            child: MaterialApp(
              title: 'Prueba Flutter',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              initialRoute: '/root',
              routes: {
                '/root': (context) => RootPage(),
                '/shopping-home': (context) => ShoppingHomePage(),
                '/local-cart': (context) => LocalCartPage(),
                '/carts-page': (context) => CartsPage(),
              },
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
