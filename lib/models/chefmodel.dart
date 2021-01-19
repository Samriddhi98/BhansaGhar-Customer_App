import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ChefModel {

  String id, name, location;

  ChefModel(
      {@required this.id, @required this.name, @required this.location});
      factory ChefModel.fromJson(Map<String, dynamic> json){
    print(json["name"]);

   return ChefModel(
     id: json["_id"],
      name: json["name"],
       location: json["location"],

   );
}
 
 
 }