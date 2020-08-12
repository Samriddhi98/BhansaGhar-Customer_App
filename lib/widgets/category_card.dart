import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String categoryName;
  final String imagePath;

  FoodCard({this.categoryName,this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage(imagePath)),
              
            Text(categoryName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),)
          ]
        ),
      ),
      
    );
  }
}