// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.role,
    this.id,
    this.username,
    this.email,
    this.createdAt,
    this.v,
  });

  String role;
  String id;
  String username;
  String email;
  DateTime createdAt;
  int v;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        role: json["role"],
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "_id": id,
        "username": username,
        "email": email,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
      };
}
