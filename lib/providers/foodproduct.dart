import 'package:BhansaGhar/Api/ApiService.dart';
import 'package:BhansaGhar/models/chefmodel.dart';
import 'package:flutter/foundation.dart';

class FoodProductsList with ChangeNotifier {
  List<Foodproduct> listOfProduct;
  FoodProductsList();
  Foodproduct findById(String id) {
    return listOfProduct.firstWhere((prod) => prod.id == id);
  }

  getFoodData(String cat) async {
    print(cat);
    this.listOfProduct = await ApiService().getFoodDataFromApi(cat);
    notifyListeners();
  }
}

class Foodproduct with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final ChefModel chefname;
  final String address;
  final String image;
  final String category;
  final List<dynamic> type;
  final int price;
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
      @required this.type,
      this.isFavourite = false,
      @required this.price,
      this.rating});

  void toggleFavouriteStatus() {
    isFavourite = !isFavourite;
    notifyListeners();
  }

  factory Foodproduct.fromJson(Map<String, dynamic> json) {
    ChefModel cm;
    if (json["chef"] != null) {
      cm = ChefModel.fromJson(json["chef"]);
    } else {
      cm = ChefModel(id: "null", name: "null", location: "null");
    }
    ;
    print(json["name"]);
    return Foodproduct(
        id: json["_id"],
        title: json["name"],
        type: json["type"],
        description: json["description"],
        chefname: cm,
        address: "",
        image:  json["photo"],
        category: json["category"],
        price: json["price"],
        isFavourite: false,
        rating: 1.0);
  }
}
