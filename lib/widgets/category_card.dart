import 'package:BhansaGhar/widgets/menuitem_list.dart';
import 'package:flutter/material.dart';

import 'item.dart';

class FoodCard extends StatefulWidget {
  final String categoryName;
  final String imagePath;

  FoodCard({this.categoryName,this.imagePath});

  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        MenuList();
      },
          child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage(widget.imagePath)),
                
              Text(widget.categoryName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),)
            ]
          ),
        ),
        
      ),
    );
  }
}