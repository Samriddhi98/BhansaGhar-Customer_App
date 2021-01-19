import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ForgetpassModel {

  String  email, password;

   ForgetpassModel(
      { @required this.email});
      factory  ForgetpassModel.fromJson(Map<String, String> json){
   return  ForgetpassModel(
     
      email: json["email"],
     

   );
}
 
 
 }