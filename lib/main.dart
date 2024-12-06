import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'views/login_view.dart';
import 'home.dart'; 
import 'views/delivery_view.dart';
import 'data/user_data.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginView(),
        '/homepage': (context) => HomePage(),
        '/delivery': (context) => DeliveryScreen(
              user: currentUser,
              onShopSelected: (shop) {
              },
            ),
      },
    );
  }
}
