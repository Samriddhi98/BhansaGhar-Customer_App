import 'package:BhansaGhar/screens/profile.dart';
import 'package:BhansaGhar/screens/navdrawer.dart';
import 'package:flutter/material.dart';
import 'package:BhansaGhar/Assets/my_flutter_app_icons.dart';

//pages
import 'package:BhansaGhar/screens/menu_screen.dart';
import 'package:BhansaGhar/screens/order_page.dart';
import 'package:BhansaGhar/screens/chefs_page.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int currentTabIndex = 0;

  List<Widget> pages;
  Widget currentPage;

  MenuPage menuPage;
  OrderPage orderPage;
  ChefPage chefPage;
  ProfilePage profilePage;

  void initState(){
    super.initState();
    menuPage = MenuPage();
    chefPage = ChefPage();
    profilePage = ProfilePage();
    orderPage = OrderPage();
    pages = [menuPage,chefPage,profilePage,orderPage];

    currentPage = menuPage;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
          setState(() {
            currentTabIndex = index;
            currentPage = pages[index];
          });
        },
        currentIndex: currentTabIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
           BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.chef,),
            title: Text('Chefs'),
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Orders'),
          )
        ],
      ),
      body: currentPage,
    );
  }
}
