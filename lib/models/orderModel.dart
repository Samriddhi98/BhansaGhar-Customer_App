// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    this.orderStatus,
    this.id,
    this.chefId,
    this.userId,
    this.createdAt,
    this.v,
    this.orderModelId,
  });

  String orderStatus;
  String id;
  String chefId;
  String userId;
  DateTime createdAt;
  int v;
  String orderModelId;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        orderStatus: json["orderStatus"],
        id: json["_id"],
        chefId: json["chefId"],
        userId: json["userId"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
        orderModelId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "orderStatus": orderStatus,
        "_id": id,
        "chefId": chefId,
        "userId": userId,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
        "id": orderModelId,
      };
}
