import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class LoginModel {
  String email, contact, password;

  LoginModel(
      {@required this.email, @required this.contact, @required this.password});

  factory LoginModel.fromJson(Map<String, String> json) {
    return LoginModel(
      contact: json["contact"],
      email: json["email"],
      password: json["password"],
    );
  }
}
