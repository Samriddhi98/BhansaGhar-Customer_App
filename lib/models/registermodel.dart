import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class RegisterModel {
  String username, email, password, contact;

  RegisterModel(
      {@required this.username,
      @required this.email,
      @required this.contact,
      @required this.password});
  factory RegisterModel.fromJson(Map<String, String> json) {
    return RegisterModel(
        username: json["username"],
        email: json["email"],
        contact: json["contact"],
        password: json["password"]);
  }
}
