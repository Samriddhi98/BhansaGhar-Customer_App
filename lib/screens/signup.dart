import 'package:BhansaGhar/Api/ApiService.dart';
import 'package:BhansaGhar/models/registermodel.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _togglevisibility = true;
  RegisterModel registerModel;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController(),
      email = TextEditingController(),
      password = TextEditingController(),
      reEnterpassword = TextEditingController();
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
              key: _formkey,
              child: Column(
                children: <Widget>[
                  Card(
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextFormField(
                        controller: username,
                        decoration: InputDecoration(
                          hintText: "Username",
                          prefixIcon: Icon(Icons.person_pin),
                          border: InputBorder.none,
                        ),
                      )),
                  Card(
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          //bool valid = EmailValidator.validate(value);
                          //print(valid);
                          //if (!valid) {
                            //return "Email is invalid";
                          //}
                        },
                        controller: email,
                        decoration: InputDecoration(
                          hintText: "E-mail",
                          prefixIcon: Icon(Icons.mail_outline),
                          border: InputBorder.none,
                        ),
                      )),
                  //   SizedBox(height: 15.0),
                  Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextFormField(
                      controller: password,
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
                  ),
                  //   SizedBox(height: 15.0),
                  Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextField(
                      controller: reEnterpassword,
                      decoration: InputDecoration(
                        hintText: "Re-enter Password",
                        prefixIcon: Icon(Icons.vpn_key),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //   SizedBox(
          //  height: 5.0,
          // ),

          SizedBox(height: 30.0),
          Container(
            height: 40.0,
            width: 350.0,
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
              shadowColor: Colors.black87,
              color: Colors.black,
              elevation: 7.0,
              child: GestureDetector(
                child: Center(
                    child: Text('SIGNUP',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ))),
                onTap: () {
                  if (_formkey.currentState.validate()) {
                    registerModel = RegisterModel(
                        username: username.text,
                        email: email.text,
                        password: password.text);
                    ApiService().postUser(registerModel).then((value) {
                      if (value.statusCode == 200) {
                         Navigator.pop(context);
                      } else if (value.statusCode == 400) {
                        print("eereafsdfasdfadsf");
                        print(value.data['error']);
                      }
                    });
                  } else {
                    print("not validated");
                  }
                },
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            height: 40.0,
            width: 350.0,
            color: Colors.transparent,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/login');
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Center(
                  child: Text('GO TO LOGIN'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
