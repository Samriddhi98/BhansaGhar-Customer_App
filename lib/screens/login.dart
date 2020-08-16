import 'package:flutter/material.dart';

import 'menu_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final formKey = GlobalKey<FormState>();
  bool _togglevisibility = true;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Column(children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 100.0),
              width: 100.0,
              height: 50.0,
              //   color: Colors.amber,
              child: FittedBox(
                  child: Image.asset(
                'assets/images/logo.PNG',
                height: 50.0,
                width: 100.0,
              )),
            ),
            Text('Food that feels like home')
          ]),

          Container(
            padding: EdgeInsets.only(top: 50.0),
            width: deviceSize.width,
            color: Colors.white,
            child: Form(
              child: Column(
                children: <Widget>[
                  Card(
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Username or email",
                          prefixIcon: Icon(Icons.mail_outline),
                          border: InputBorder.none,
                        ),
                      )),
                  SizedBox(height: 15.0),
                  Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.vpn_key),
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _togglevisibility = !_togglevisibility;
                            });
                          },
                          icon: _togglevisibility
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        ),
                      ),
                      obscureText: _togglevisibility,
                    ),
                  )
                ],
              ),
            ),
          ),

          //   SizedBox(
          //  height: 5.0,
          // ),
          Container(
            padding: EdgeInsets.only(top: 15.0, right: 20.0),
            alignment: Alignment(1.0, 0.0),
            // color: Colors.blue,
            child: InkWell(
              child: Text(
                'Forgot Password',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Container(
            height: 40.0,
            width: 350.0,
            child: GestureDetector(
                          child: Material(
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Colors.black87,
                color: Colors.black,
                elevation: 7.0,
                child: Center(
                    child: Text('LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ))),
              ),
               onTap: () {
                  Navigator.of(context).pushNamed('/main-screen');
                },
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            height: 40.0,
            width: 350.0,
            color: Colors.transparent,
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child:
                          ImageIcon(AssetImage('assets/images/facebook.png')),
                    ),
                    SizedBox(width: 10.0),
                    Center(
                      child: Text(
                        'Log in with facebook',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )),
          ),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('New to BhansaGhar?'),
              SizedBox(width: 5.0),
              InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed('/sign-up');
                  Navigator.of(context).pushReplacementNamed('/sign-up');
                },
                child: Text(
                  'SignUp',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
