import 'package:flutter/cupertino.dart';

//modal
import 'package:BhansaGhar/providers/foodproduct.dart';

class Foodproducts with ChangeNotifier{
  final List<Foodproduct> _food = [
  Foodproduct(
    id: '1',
    title: 'Veg Daal Bhat',
    description: 'daal bhat tarkari',
    chefname: 'Ram Thapa',
    address: 'Kalimati',
    image: 'assets/images/food1.jpg',
    category: ['All','Veg','Dinner'],
    price: 100.0,
    rating: 99.0,
  ),
   Foodproduct(
    id: '2',
    title: 'Bara',
    description: 'lentil pancake',
    chefname: 'Bina Maharjan',
    address: 'Kuleshwor',
    image: 'assets/images/food1.jpg',
    category: ['All','Veg','Lunch'],
    price: 50.0,
    rating: 80.0,
  ),
   Foodproduct(
    id: '3',
    title: 'French Toast ',
    description: 'with cheese',
    chefname: 'Sarmila Pant',
    address: 'Pulchowk',
    image: 'assets/images/food1.jpg',
    category: ['All','Breakfast'],
    price: 100.0,
    rating: 99.0,
  ),
   Foodproduct(
    id: '4',
    title: 'Malpa Swari',
    description: 'daal bhat tarkari',
    chefname: 'Hari Bahadur',
    address: 'Kalanki',
    image: 'assets/images/food1.jpg',
    category: ['All','Breakfast'],
    price: 100.0,
    rating: 99.0,
  ),
];


  List<Foodproduct> get food { 
    return _food;
  }

  Foodproduct findById(String id){
  return _food.firstWhere((prod) => prod.id == id);
}

}