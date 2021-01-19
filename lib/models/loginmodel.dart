import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class LoginModel {

  String  email, password;

  LoginModel(
      { @required this.email, @required this.password});
      factory LoginModel.fromJson(Map<String, String> json){
   return LoginModel(
     
      email: json["email"],
       password: json["password"],

   );
}
 
 
 }