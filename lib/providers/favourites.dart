

import 'package:flutter/material.dart';


import 'package:BhansaGhar/providers/foodproduct.dart';

class FavouriteItem {
  final String id;
  final String title;
  final String chefname;
  final double price;
  final String image;
  

  FavouriteItem({
    @required this.id,
    @required this.title,
    @required this.chefname,
    @required this.price,
    @required this.image,
    
  });
}

class Favourites with ChangeNotifier{
  Foodproduct food;
  bool isFavourite = false;

      bool get _isFavourite => food.isFavourite;


    
    List<FavouriteItem> _items = [];
 

    List<FavouriteItem> get items {
      if(food.isFavourite == true)
          return [..._items];
          
  }

  
  int get itemCount {
    return _items == null ? 0 : _items.length;
  }


  
}