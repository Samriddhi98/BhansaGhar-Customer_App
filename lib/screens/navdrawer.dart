import 'package:BhansaGhar/providers/favourites.dart';
import 'package:BhansaGhar/providers/foodproduct.dart';
import 'package:BhansaGhar/screens/contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'order_page.dart';
import 'orderhistory.dart';
import 'faqpage.dart';
import 'contact.dart';
import 'aboutus.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(top: 50, left: 8, right: 8, bottom: 8),
              // color: HexColor("#31343E"),
              color: Theme.of(context).primaryColor,
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset(
                      "assets/images/food1.jpg",
                      width: 80,
                      height: 80,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Name Surname\n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              // fontFamily: 'Montserrat',
                              color: Colors.black87)),
                      TextSpan(
                          text: "@username",
                          style: TextStyle(
                              // fontFamily: 'Montserrat',
                              color: Colors.black54)),
                    ]),
                  ),
                ],
              ),
            ),
          ),
          // Divider(height: 1, thickness: 1, color: Colors.blueGrey[900]),
          Expanded(
            flex: 3,
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  ListTile(
                    dense: true,
                    title: Text(
                      "Home",
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: Icon(Icons.home),
                    onTap: () {
                      Navigator.pushNamed(context, "/main-screen");
                    },
                  ),ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text("My favourites"),
                    onTap: () {
                        
                        Navigator.of(context).pushNamed('/favourites');

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.room_service),
                    title: Text("Order History"),
                    onTap: () {
                       Navigator.of(context).push(
                         MaterialPageRoute
                         (builder: (context) => OrderHistory()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.forum),
                    title: Text("FAQ"),
                    onTap: () {
                         Navigator.of(context).push(
                         MaterialPageRoute
                         (builder: (context) => FaqPage()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.view_list),
                    title: Text("Contact Us"),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ContactPage())
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text("About Us"),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AboutPage())
                      );
                    },
                  ),
                  // List items goes here...
                ],
              ),
            ),
          ),
         /* Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              Container(
                width: 130.0,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.account_circle),
                  label: Text('Profile'),
                ),
              ),
              Container(
                width: 130.0,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.account_circle),
                  label: Text('My Profile'),
                ),
              ),
            ]),
          ), */
        ],
      ),
    );
  }
}
