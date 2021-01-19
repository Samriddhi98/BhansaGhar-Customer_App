import 'package:flutter/material.dart';
import 'package:BhansaGhar/providers/foodproducts.dart';
import 'package:BhansaGhar/widgets/item.dart';

import 'package:provider/provider.dart';
import 'package:BhansaGhar/providers/foodproduct.dart';

class MenuList extends StatefulWidget {
  final String category;

  const MenuList({Key key, this.category}) : super(key: key);
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  List<Foodproduct> foodlist = [];
  String categoryName1;
  String category;
  String cat;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.category);
    this.cat = widget.category ?? "veg";

    Provider.of<FoodProductsList>(context, listen: false).getFoodData(cat);
    categoryName1 = widget.category ?? "All";
  }

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Foodproducts>(context);
    final productItem = productData.food;

    return Consumer<FoodProductsList>(
      builder: (context, value, _) {
        if (value.listOfProduct != null && value.listOfProduct.length != 0) {
          value.listOfProduct.forEach((c) {
            if (c.category.toLowerCase() ==
                categoryName1
                    // "veg"
                    .toLowerCase()) {
              foodlist.add(c);
            }
          });
          return Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  left: 10.0, right: 10.0, bottom: 10.0, top: 2.0),
              child: ListView.builder(
                  itemCount:
                      // foodlist.length,
                      value.listOfProduct.length,
                  itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                      value:
                          // widget.category != null && widget.category != "All"
                          //     ? foodlist[i]
                          //     :
                          value.listOfProduct[i],
                      // foodlist[i],
                      child: Container(
                          child: Column(
                        children: [
                          // Text(
                          //   widget.category == null ? "Null" : "cate",
                          // ),
                          MenuItem()
                        ],
                      )))),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blueGrey,
            ),
          );
        }
      },
    );
  }
}
