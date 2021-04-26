import 'package:BhansaGhar/Api/ApiService.dart';
import 'package:BhansaGhar/Api/FavouriteService.dart';
import 'package:BhansaGhar/providers/favourites.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';
import 'package:BhansaGhar/providers/foodproduct.dart';
import 'package:BhansaGhar/providers/foodproducts.dart';
import 'package:BhansaGhar/providers/cart.dart';

import 'package:BhansaGhar/screens/itemdetail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../locator.dart';

class MenuItem extends StatefulWidget {
  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  String token;

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Foodproduct>(context, listen: false);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Foodproducts(),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/item-detail',
              arguments: {"id": product.id, "isfav": product.isFavourite});
        },
        child: Container(
          key: _formkey,
          margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 200.0,
                  width: 380.0,
                  // color: Colors.red,
                  child: CachedNetworkImage(
                    placeholder: (context, url) => Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    imageUrl:
                        //   'http://192.168.2.229:5000/uploads/${product.image}',
                        'http://10.0.2.2:5000/uploads//${product.image}',
                    // 'http://172.25.0.174:5000/uploads//${product.image}',
                    fit: BoxFit.fill,
                  ),
                  //Image.network(

                  //   "https://bhansagharapi.herokuapp.com/uploads/${product.image}",
                  // ),
                ),
                Positioned(
                  left: 20.0,
                  child: Container(
                    width: 40.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                        color: Colors.yellow[700],
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        )),
                    child: Consumer<Foodproduct>(
                      builder: (ctx, product, _) => IconButton(
                          icon: Icon(product.isFavourite
                              ? Icons.favorite
                              : Icons.favorite_border),
                          onPressed: () {
                            // if (_formkey.currentState.validate()) {
                            if (!product.isFavourite) {
                              FavService()
                                  .addToFavourite(product.id)
                                  .then((value) {
                                if (value.statusCode == 201) {
                                  print('status ok in item page');
                                  product.toggleFavouriteStatus();
                                  setState(() {});
                                  Fluttertoast.showToast(
                                    msg: 'Added to Favourite',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.grey,
                                    textColor: Colors.white,
                                    fontSize: 10.0,
                                  );
                                } else if (value.statusCode == 400) {
                                  print("eereafsdfasdfadsf");
                                  print(value.data['error']);
                                }
                              });
                            } else {
                              FavService()
                                  .removeFromFavourite(product.id)
                                  .then((value) {
                                if (value.statusCode == 201) {
                                  print('status ok in item page');
                                  product.toggleFavouriteStatus();
                                  setState(() {});
                                } else if (value.statusCode == 400) {
                                  print("eereafsdfasdfadsf");
                                  print(value.data['error']);
                                }
                              });
                            }

                            // setState(() {
                            //   product.isFavourite = !product.isFavourite;
                            // });
                            // } else {
                            //   print("not validated");
                            // }
                          }),
                    ),
                  ),
                ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  child: Container(
                    height: 60.0,
                    width: 380.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black, Colors.black38],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                    ),
                  ),
                ),
                Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  right: 10.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            product.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Row(
                          //   children: <Widget>[
                          //     Icon(
                          //       Icons.star,
                          //       color: Theme.of(context).primaryColor,
                          //       size: 16.0,
                          //     ),
                          //     Icon(
                          //       Icons.star,
                          //       color: Theme.of(context).primaryColor,
                          //       size: 16.0,
                          //     ),
                          //     Icon(
                          //       Icons.star,
                          //       color: Theme.of(context).primaryColor,
                          //       size: 16.0,
                          //     ),
                          //     Icon(
                          //       Icons.star,
                          //       color: Theme.of(context).primaryColor,
                          //       size: 16.0,
                          //     ),
                          //     Icon(
                          //       Icons.star,
                          //       color: Theme.of(context).primaryColor,
                          //       size: 16.0,
                          //     ),
                          //     SizedBox(width: 10.0),
                          //     Text(
                          //       '(' + product.rating.toString() + 'Reviews)',
                          //       style: TextStyle(
                          //         color: Colors.grey,
                          //       ),
                          //     )
                          //   ],
                          // )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            'Rs. ${product.price.toString()}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.yellowAccent,
                              fontSize: 18.0,
                            ),
                          ),
                          Text(
                            'Min Order',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
