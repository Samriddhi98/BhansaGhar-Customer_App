import 'package:BhansaGhar/providers/favourites.dart';
import 'package:BhansaGhar/providers/foodproduct.dart';
import 'package:BhansaGhar/screens/contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'order_page.dart';
import 'orderhistory.dart';
import 'faqpage.dart';
import 'contact.dart';
import 'aboutus.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  String id;

  String username;

  String email;

  setChefDetailValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    id = prefs.getString("UserId");
    username = prefs.getString("Username");
    email = prefs.getString("UserEmail");

    setState(() {});
    // print('add food token$token');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setChefDetailValuesSF();
  }

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
                  // Container(
                  //   width: 50.0,
                  //   margin: EdgeInsets.all(10.0),
                  //   decoration: BoxDecoration(
                  //     color: Colors.grey,
                  //     shape: BoxShape.circle,
                  //   ),
                  //   child: Icon(
                  //     Icons.person,
                  //     // size: 40.0,
                  //     color: Colors.black,
                  //   ),
                  // ),

                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Icon(
                        Icons.person,
                        size: 80.0,
                        color: Colors.white,
                      ),
                      // child: Image.asset(
                      //   "assets/images/food1.jpg",
                      //   width: 80,
                      //   height: 80,
                      //   fit: BoxFit.fill,
                      // ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    //color: Colors.red,
                    height: 80.0,
                    width: 195.0,
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.black87),
                        ),
                        Divider(),
                        Text(
                          email,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.0,
                              color: Colors.black87),
                        )
                      ],
                    ),
                  )
                  // RichText(
                  //   text: TextSpan(children: [
                  //     TextSpan(
                  //         //  text: "Name Surname\n",
                  //         text: username,
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             // fontFamily: 'Montserrat',
                  //             color: Colors.black87)),
                  //     TextSpan(
                  //         // text: "@username",
                  //         text: email,
                  //         style: TextStyle(
                  //             // fontFamily: 'Montserrat',
                  //             color: Colors.black54)),
                  //   ]),
                  // ),
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
                  ),
                  ListTile(
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => OrderHistory()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.forum),
                    title: Text("FAQ"),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => FaqPage()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.view_list),
                    title: Text("Contact Us"),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ContactPage()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text("About Us"),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => AboutPage()));
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
