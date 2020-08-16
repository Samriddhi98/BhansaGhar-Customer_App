import 'package:flutter/material.dart';

import 'counter.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String image;
  

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
    @required this.image,
    
  });
}


class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

   int totalPrice = 0;

  int get _totalPrice => totalPrice;

  set _totalPrice(int value) {
    totalPrice = value;
    notifyListeners();
  }

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items == null ? 0 : _items.length;
  }

 void getTotalPrice({double price = 0.0}) {
    num total = 0;
    items.values.toList().forEach((item) {
      total = total + item.price;
    });
    _totalPrice = total.toInt();
    notifyListeners();
  }

   void increaseTotalFromCounter({double price = 0.0}) {
    _totalPrice = _totalPrice + price.toInt();
    notifyListeners();
  }

  void decreaseTotalFromCounter({double price = 0.0, counter}) {
    _totalPrice = counter == 1 ? _totalPrice:  _totalPrice - price.toInt() ;
    notifyListeners();
  }
  

  void addItem(String productid, double price, String title, String image) {
    if (_items.containsKey(productid)) {
      // change quantity .....
      _items.update(
          productid,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                title: existingCartItem.title,
                price: existingCartItem.price,
                image: existingCartItem.image,
                quantity: existingCartItem.quantity + 1,
              ));
    } else {
      _items.putIfAbsent(
          productid,
          () => CartItem(
                id: DateTime.now().toString(),
                title: title,
                price: price,
                image: image,
                quantity: 1,
              ));
    }
    notifyListeners();
  }

  void removeItems(String productId) {
   
    _items.remove(productId);
    notifyListeners();
  }

  void itemTotal(int counter){
  
  }

  void removeSingleItem(String productId){
    if(!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId].quantity > 1){
      _items.update(
        productId,
      (existingCartItem) => CartItem(
        id: existingCartItem.id,
        title: existingCartItem.title,
        price: existingCartItem.price,
        quantity: existingCartItem.quantity - 1,
        image: existingCartItem.image
        ));
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear(){
    _items = {};
    notifyListeners();
  }
}
