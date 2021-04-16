// // To parse this JSON data, do
//
//     final favourites = favouritesFromJson(jsonString);

import 'dart:convert';
import 'dart:html';

import 'package:flutter/cupertino.dart';

Favourites favouritesFromJson(String str) =>
    Favourites.fromJson(json.decode(str));

String favouritesToJson(Favourites data) => json.encode(data.toJson());

class Favourites extends ChangeNotifier {
  Favourites({
    this.id,
    this.favouriteId,
    this.userId,
    this.v,
  });

  String id;
  FavouriteId favouriteId;
  String userId;

  int v;

  List<FavouriteId> listofFavourites;

  void toggleFavouriteStatus(int index) {
    listofFavourites[index].isFavourite = !listofFavourites[index].isFavourite;
    notifyListeners();
  }

  factory Favourites.fromJson(Map<String, dynamic> json) => Favourites(
        id: json["_id"],
        favouriteId: FavouriteId.fromJson(json["favouriteId"]),
        userId: json["userId"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "favouriteId": favouriteId.toJson(),
        "userId": userId,
        "__v": v,
      };
}

class FavouriteId {
  FavouriteId(
      {this.id,
      this.name,
      this.price,
      this.favouriteIdId,
      this.photo,
      this.image,
      this.isFavourite = true});

  String id;
  String name;
  int price;
  String favouriteIdId;
  bool isFavourite;
  File photo;
  String image;

  factory FavouriteId.fromJson(Map<String, dynamic> json) => FavouriteId(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        favouriteIdId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "id": favouriteIdId,
      };
}

// import 'package:flutter/material.dart';

// import 'package:BhansaGhar/providers/foodproduct.dart';

// class FavouriteItem {
//   final String id;
//   final String title;
//   final String chefname;
//   final double price;
//   final String image;

//   FavouriteItem({
//     @required this.id,
//     @required this.title,
//     @required this.chefname,
//     @required this.price,
//     @required this.image,
//   });
// }

// class Favourites with ChangeNotifier {
//   Foodproduct food;
//   bool isFavourite = false;

//   bool get _isFavourite => food.isFavourite;

//   List<FavouriteItem> _items = [];

//   List<FavouriteItem> get items {
//     if (food.isFavourite == true) return [..._items];
//   }

//   int get itemCount {
//     return _items == null ? 0 : _items.length;
//   }
// }
