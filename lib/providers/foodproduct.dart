import 'package:flutter/foundation.dart';

class Foodproduct with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final String chefname;
  final String address;
  final String image;
  final List<String> category;
  final double price;
  final double rating;
  bool isFavourite;

  Foodproduct(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.chefname,
      @required this.address,
      @required this.image,
      @required this.category,
      this.isFavourite = false,
      @required this.price,
      this.rating});

      void toggleFavouriteStatus(){
        isFavourite =!isFavourite;
        notifyListeners();
      }
}

