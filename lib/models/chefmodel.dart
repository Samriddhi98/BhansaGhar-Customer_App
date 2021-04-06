// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';

// class ChefModel {
//   String id, name, location;

//   ChefModel({@required this.id, @required this.name, @required this.location});

// }

//  }
// To parse this JSON data, do

//     final chefModel = chefModelFromJson(jsonString);

import 'dart:convert';

// ChefModel chefModelFromJson(String str) => ChefModel.fromJson(json.decode(str));

// String chefModelToJson(ChefModel data) => json.encode(data.toJson());

class ChefModel {
  ChefModel({
    this.role,
    this.id,
    this.name,
    this.username,
    this.email,
    this.contact,
    this.location,
    this.account,
    this.createdAt,
    this.v,
  });

  String role;
  String id;
  String name;
  String username;
  String email;
  int contact;
  String location;
  int account;
  DateTime createdAt;
  int v;

  factory ChefModel.fromJson(Map<String, dynamic> json) => ChefModel(
        role: json["role"] == null ? null : json["role"],
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        username: json["username"] == null ? null : json["username"],
        email: json["email"] == null ? null : json["email"],
        contact: json["contact"] == null ? null : json["contact"],
        location: json["location"] == null ? null : json["location"],
        account: json["account"] == null ? null : json["account"],
        createdAt: DateTime.parse(json["createdAt"]) == null
            ? null
            : DateTime.parse(json["createdAt"]),
        v: json["__v"] == null ? null : json["_v"],
      );

  factory ChefModel.fromJson2(Map<String, dynamic> json) {
    print(json["name"]);

    return ChefModel(
      id: json["_id"],
      name: json["name"],
      location: json["location"],
    );
  }

  Map<String, dynamic> toJson() => {
        "role": role,
        "_id": id,
        "name": name,
        "username": username,
        "email": email,
        "contact": contact,
        "location": location,
        "account": account,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
      };
}
