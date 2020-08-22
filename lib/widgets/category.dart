import 'package:flutter/material.dart';

//data
import 'package:BhansaGhar/providers/category_data.dart';

//model
import 'package:BhansaGhar/models/category_model.dart';

import 'category_card.dart';

class Category extends StatelessWidget {
  final List<CategoryItems> _categories = categories;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      width: deviceSize.width,
      height: 120.0,
      margin: EdgeInsets.only(top: 10.0,bottom:20.0),
        // color: Colors.redAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding
          (
            padding:EdgeInsets.only(left:5.0),
      child: Text('What we serve',style: TextStyle(fontWeight: FontWeight.bold,fontSize:15.0),)),
        
          Container(
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              itemBuilder: (BuildContext context, int index) {
                return FoodCard(
                  categoryName: _categories[index].categoryName,
                  imagePath: _categories[index].imagePath,
                );
              },
            ),
          ),
          
        ],
      ),
    );
  }
}
