import 'package:BhansaGhar/Api/ApiService.dart';
import 'package:BhansaGhar/models/loginmodel.dart';

import 'package:BhansaGhar/screens/main_screen.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final formKey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  TextEditingController email = TextEditingController(),
      password = TextEditingController();

  bool _togglevisibility = true;

  saveTopref(String token) async {
    var preference = await SharedPreferences.getInstance();
    preference.setString("token", token);
    // String a = preference.getString("token");
    // print(a);
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldkey,
      resizeToAvoidBottomInset: false,
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
              key: formKey,
              child: Column(
                children: <Widget>[
                  Card(
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isNotEmpty) {
                            print(value);
                            bool valid = EmailValidator.validate(value);
                            print(valid);
                            if (!valid) {
                              return "         Email is invalid";
                            }
                          } else {
                            return "           Email cannot be empty";
                          }
                          // return value;
                        },
                        decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.mail_outline),
                          border: InputBorder.none,
                        ),
                        controller: email,
                      )),
                  SizedBox(height: 15.0),
                  Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "              Password required";
                        }
                        //  return value;
                      },
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
                      controller: password,
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
              onTap: () {},
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
                print(email.text);
                if (formKey.currentState.validate()) {
                  LoginModel loginModel =
                      LoginModel(email: email.text, password: password.text);
                  ApiService().postLoginUser(loginModel).then((value) {
                    if (value.statusCode == 200) {
                      saveTopref(value.data['token']);
                      Fluttertoast.showToast(
                        msg: value.data['Login Success!'],
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 10.0,
                      );
                      Navigator.of(context).pushNamed('/main-screen');
                    } else if (value.statusCode == 400) {
                      print("gftyrugr");
                      print(value.data['error']);
                      Fluttertoast.showToast(
                        msg: value.data['Login Failed!'],
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 10.0,
                      );
                      // scaffoldkey.currentState.showSnackBar(SnackBar(
                      //   content: Text(value.data['error']),
                      //   backgroundColor: Colors.red,
                      // ));
                    } else {
                      Fluttertoast.showToast(
                        msg: value.data['Login Failed!'],
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 10.0,
                      );
                    }
                  });
                } else {
                  print("not validated");
                  Fluttertoast.showToast(
                    msg: 'Login Failed!',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.grey,
                    textColor: Colors.white,
                    fontSize: 10.0,
                  );
                }
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
