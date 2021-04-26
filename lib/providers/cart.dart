import 'package:BhansaGhar/models/chefmodel.dart';
import 'package:flutter/material.dart';

import 'counter.dart';

class CartItem {
  final String productId;
  final String id;
  final String title;
  int quantity;
  final double price;
  final String image;
  final String chefid;

  void incrementQuantity() {
    this.quantity++;
  }

  void decrementQuantity() {
    if (quantity != 0) {
      this.quantity--;
    }
  }

  CartItem(
      {@required this.productId,
      @required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price,
      @required this.image,
      @required this.chefid});
}

class Cart with ChangeNotifier {
  String allowedChefId;
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
      total = total + item.price * item.quantity;
    });
    _totalPrice = total.toInt();
    notifyListeners();
  }

  void increaseTotalFromCounter({double price = 0.0}) {
    _totalPrice = _totalPrice + price.toInt();
    notifyListeners();
  }

  void increaseCount(String productId) {
    CartItem item =
        _items.values.toList().firstWhere((i) => i.productId == productId);
    item.incrementQuantity();
    notifyListeners();
  }

  void decreaseCount(String productId) {
    CartItem item =
        _items.values.toList().firstWhere((i) => i.productId == productId);
    item.decrementQuantity();
    notifyListeners();
  }

  void decreaseTotalFromCounter({double price = 0.0, counter}) {
    _totalPrice = counter == 1 ? _totalPrice : _totalPrice - price.toInt();
    notifyListeners();
  }

  void addItem(String productid, double price, String title, String image,
      ChefModel chef) {
    if (allowedChefId == null) {
      allowedChefId = chef.id;
    } else if (allowedChefId != chef.id) {
      throw Exception('Chef id not matched');
    }
    // print('incoming chef id${chef.id}');

    // _items.values.map((e) => print('chefid:${e.chefid}'));

    // if (_items.containsValue(chef.id)) {
    if (_items.containsKey(productid)) {
      print('product id is: $productid');
      // change quantity .....
      print('map: ${_items["$productid"].chefid}');
      _items.update(
          productid,
          (existingCartItem) => CartItem(
                productId: existingCartItem.productId,
                id: existingCartItem.id,
                title: existingCartItem.title,
                price: existingCartItem.price,
                image: existingCartItem.image,
                chefid: existingCartItem.chefid,
                quantity: existingCartItem.quantity,
              ));
      print('cartitem$_items');
    } else {
      _items.putIfAbsent(
          productid,
          () => CartItem(
                productId: productid,
                id: DateTime.now().toString(),
                title: title,
                price: price,
                image: image,
                quantity: 0,
                chefid: chef.id,
              ));
    }
    // } else {
    //   print('jpaietebvdk');
    // }

    notifyListeners();
  }

  void removeItems(String productId) {
    _items.remove(productId);
    getTotalPrice();
    notifyListeners();
  }

  void itemTotal(int counter) {}

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId].quantity > 1) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity - 1,
              chefid: existingCartItem.chefid,
              image: existingCartItem.image));
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
