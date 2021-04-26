//widgets

import 'package:BhansaGhar/widgets/description.dart';
import 'package:cached_network_image/cached_network_image.dart';

//providers
import 'package:provider/provider.dart';
import 'package:BhansaGhar/providers/foodproducts.dart';
import 'package:BhansaGhar/providers/cart.dart';
import 'package:BhansaGhar/providers/foodproduct.dart';

import 'package:flutter/material.dart';

class ItemDetail extends StatefulWidget {
  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  // static const routeName = '/item-detail';

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context).settings.arguments as Map;
    print(product);
    final productId = product['id'];
    bool productfav = product['isfav'];
    print(productfav);
    // final isFav = product['isfav'];
    final loadedFood = Provider.of<FoodProductsList>(context, listen: false)
        .findById(productId);

    // final food = Provider.of<Foodproduct>(context,listen: false);
    final cart = Provider.of<Cart>(context);
    final deviceSize = MediaQuery.of(context).size;
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
        //  resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.yellow[700],
          elevation: 0.0,
          title: Text(
            loadedFood.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Builder(
          builder: (context) => SingleChildScrollView(
            reverse: false,
            child: Padding(
              padding: EdgeInsets.only(bottom: bottom),
              child: Container(
                height: deviceSize.height,
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        // The containers in the background
                        new Column(
                          children: <Widget>[
                            new Container(
                              padding: EdgeInsets.all(5.0),
                              height: deviceSize.height / 9,
                              color: Colors.yellow[700],
                              child: Align(
                                alignment: Alignment.topRight,
                              ),
                            ),
                            new Container(
                              height: deviceSize.height / 9,
                              color: Colors.yellow[700],
                            )
                          ],
                        ),
                        // The card widget with top padding,
                        // incase if you wanted bottom padding to work,
                        // set the `alignment` of container to Alignment.bottomCenter
                        new Container(
                          alignment: Alignment.topCenter,
                          padding: new EdgeInsets.only(right: 20.0, left: 20.0),
                          child: new Container(
                            height: 200.0,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.red,
                            child: CachedNetworkImage(
                              placeholder: (context, url) => Container(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              imageUrl:
                                  //   'http://192.168.1.121:5000/uploads/${loadedFood.image}',
                                  'http://10.0.2.2:5000/uploads/${loadedFood.image}',
                              //'http://172.25.0.174:5000/uploads/${loadedFood.image}',
                              fit: BoxFit.fill,
                            ),

                            // child: Image.network(
                            //   loadedFood.image,
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      padding:
                          EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
                      height: deviceSize.height / 9,
                      width: deviceSize.width,
                      // color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                loadedFood.title,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'By: ' "${loadedFood.chefdetail.name}",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'From:' "${loadedFood.chefdetail.location}",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ],
                          ),
                          Column(
                            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Rs.' "${loadedFood.price}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                              ),
                              Icon(
                                productfav
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 35.0,
                                color: Colors.yellow[700],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      height: 40.0,
                      width: 350.0,
                      child: GestureDetector(
                        onTap: () {
                          try {
                            cart.addItem(
                                loadedFood.id,
                                double.parse(loadedFood.price.toString()),
                                loadedFood.title,
                                loadedFood.image,
                                loadedFood.chefdetail);
                            cart.increaseCount(loadedFood.id);
                            cart.getTotalPrice();
                            Scaffold.of(context).hideCurrentSnackBar();
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Added item to Cart'),
                                duration: Duration(seconds: 2),
                                action: SnackBarAction(
                                    label: 'UNDO',
                                    textColor: Colors.white,
                                    onPressed: () {
                                      cart.removeSingleItem(loadedFood.id);
                                    }),
                              ),
                            );
                          } catch (e) {
                            Scaffold.of(context).hideCurrentSnackBar();
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e.message),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.black87,
                          color: Colors.yellow[700],
                          elevation: 7.0,
                          child: Center(
                              child: Text('ADD TO CART',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Expanded(child: Description(loadedFood.description)),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
