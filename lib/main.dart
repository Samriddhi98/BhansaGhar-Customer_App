import 'package:BhansaGhar/providers/cart.dart';
import 'package:BhansaGhar/screens/itemdetail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:BhansaGhar/providers/foodproducts.dart';
import 'package:BhansaGhar/screens/main_screen.dart';

import 'package:BhansaGhar/screens/menu_screen.dart';
import 'package:BhansaGhar/screens/login.dart';
import 'package:BhansaGhar/screens/signup.dart';

import 'locator.dart';

void main() {
initLocator();
runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Foodproducts(),
          ),
          ChangeNotifierProvider.value(
          value: locator<Cart>(),
        ),

      ],
      child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primaryColor: Colors.yellow[700],
            // primarySwatch: Colors.purple,
            accentColor: Colors.redAccent,
            //fontFamily: 'Lato',
          ),
          home: AuthScreen(),
          routes: <String, WidgetBuilder>{
            '/sign-up': (BuildContext context) => new SignUp(),
            '/login': (BuildContext context) => new AuthScreen(),
            '/menu-screen': (BuildContext context) => new MenuPage(),
            '/main-screen': (BuildContext context) => new MainScreen(),
            '/item-detail':(BuildContext context) => new ItemDetail(),
          }),
    );
  }
}
