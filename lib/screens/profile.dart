import 'package:BhansaGhar/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

import 'package:BhansaGhar/screens/editprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username;
  String email;
  String password;

  String _capitalize(String value) {
    return value.substring(0, 1).toUpperCase() +
        value.substring(1, value.length);
  }

  setUserDetailValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    username = prefs.getString("Username");
    email = prefs.getString("UserEmail");
    password = prefs.getString("username");
    setState(() {});
    // print('add food token$token');
  }

  @override
  void initState() {
    super.initState();
    setUserDetailValuesSF();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pushNamed('/main-screen');
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              // color: Colors.lightBlue,
              padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                              height: 150.0,
                              width: 150.0,
                              decoration: BoxDecoration(
                                // color: Colors.red,
                                borderRadius: BorderRadius.circular(60.0),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 3.0,
                                      offset: Offset(0, 4.0),
                                      color: Colors.black38)
                                ],
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.grey[800],
                              )),
                        ),
                        SizedBox(height: 20.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Text(
                                username != null
                                    ? _capitalize(username)
                                    : 'Sammy Tammy',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Center(
                              child: Text(
                                email != null ? email : 'example@gmail.com',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditProfile(),
                                      ));
                                },
                                child: Container(
                                    height: 25.0,
                                    width: 60.0,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Theme.of(context).accentColor),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: Center(
                                      child: Text(
                                        'Edit',
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
                                            fontSize: 16.0),
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'Account',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Card(
                      elevation: 5.0,
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          children: <Widget>[
                            CustomListTile(
                              icon: Icons.location_on,
                              text: 'Location',
                              title: 'Location',
                            ),
                            Divider(
                              height: 10.0,
                              color: Colors.grey,
                            ),
                            CustomListTile(
                              icon: Icons.visibility,
                              text: 'Change Password',
                              title: 'Change Password',
                            ),
                            Divider(
                              height: 10.0,
                              color: Colors.grey,
                            ),
                            CustomListTile(
                              icon: Icons.payment,
                              text: 'Payment',
                              title: 'Payment',
                            ),
                          ],
                        ),
                      ),
                    ),
                    /*  Container(
                      color: Colors.red,
                      alignment: Alignment.bottomRight,
                      child: FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.exit_to_app),
                          label: Text('Log Out')),
                    ) */
                  ]),
            ),
            Container(
              height: 102.0,
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              // color:Colors.yellow,
              alignment: Alignment.bottomRight,
              child: FlatButton.icon(
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    //Return String
                    Future<bool> token = prefs.setString("token", null);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => AuthScreen()));
                  },
                  icon: Icon(Icons.exit_to_app),
                  label: Text('Log Out')),
            ),
          ]),
        ),
      ),
    );
  }
}
