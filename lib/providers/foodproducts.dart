import 'package:BhansaGhar/models/chefmodel.dart';
import 'package:flutter/cupertino.dart';

//modal
import 'package:BhansaGhar/providers/foodproduct.dart';

class Foodproducts with ChangeNotifier {
  final List<Foodproduct> _food = [
    Foodproduct(
      id: '1',
      title: 'Veg Daal Bhat',
      description: 'daal bhat tarkari',
      chefdetail: ChefModel(
          id: "5ffe90ba9bfa920004262bdd",
          name: "Sarita Sharma",
          location: "mahapal,lalitpur"),

      // address: 'Kalimati',
      image: 'assets/images/food1.jpg',
      type: ['All', 'Veg', 'Dinner'],
      category: "All",
      price: 100,
      rating: 99.0,
    ),
    Foodproduct(
      id: '2',
      title: 'Bara',
      description: 'lentil pancake',
      chefdetail: ChefModel(
          id: "5ffe90ba9bfa920004262bdd",
          name: "Sarita Sharma",
          location: "mahapal,lalitpur"),
      // address: 'Kuleshwor',
      image: 'assets/images/food1.jpg',
      type: ['All', 'Veg', 'Dinner'],
      category: "All",
      price: 50,
      rating: 80.0,
    ),
    Foodproduct(
      id: '3',
      title: 'French Toast ',
      description: 'with cheese',
      chefdetail: ChefModel(
          id: "5ffe90ba9bfa920004262bdd",
          name: "Sarita Sharma",
          location: "mahapal,lalitpur"),
      // address: 'Pulchowk',
      image: 'assets/images/food1.jpg',
      type: ['All', 'Veg', 'Dinner'],
      category: "All",
      price: 70,
      rating: 99.0,
    ),
    Foodproduct(
      id: '4',
      title: 'Malpa Swari',
      description: 'daal bhat tarkari',
      chefdetail: ChefModel(
          id: "5ffe90ba9bfa920004262bdd",
          name: "Sarita Sharma",
          location: "mahapal,lalitpur"),
      // address: 'Kalanki',
      image: 'assets/images/food1.jpg',
      type: ['All', 'Veg', 'Dinner'],
      category: "All",
      price: 80,
      rating: 99.0,
    ),
  ];

  List<Foodproduct> get food {
    return _food;
  }

  Foodproduct findById(String id) {
    return _food.firstWhere((prod) => prod.id == id);
  }
}
