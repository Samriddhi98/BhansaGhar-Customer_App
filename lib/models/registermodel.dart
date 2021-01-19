import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class RegisterModel {

  String username, email, password;

  RegisterModel(
      {@required this.username, @required this.email, @required this.password});
      factory RegisterModel.fromJson(Map<String, String> json){
   return RegisterModel(
     username: json["username"],
      email: json["email"],
       password: json["password"],

   );
}
 
 
 }