import 'package:flutter/material.dart';
import 'package:BhansaGhar/providers/foodproducts.dart';
import 'package:BhansaGhar/widgets/item.dart';

import 'package:provider/provider.dart';
import 'package:BhansaGhar/providers/foodproduct.dart';

class MenuList extends StatefulWidget {
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Foodproducts>(context);
    final productItem = productData.food;
    return Expanded(
          child: Container(
            
            margin: EdgeInsets.only(left:10.0,right:10.0,bottom: 10.0,top:2.0),
        child: ListView.builder(
          itemCount: productItem.length,
          itemBuilder: (ctx, i) =>  ChangeNotifierProvider.value(
            value:productItem[i],
            child: MenuItem())),
      ),
    );
  }
}
