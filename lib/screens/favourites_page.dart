import 'package:BhansaGhar/Api/FavouriteService.dart';
import 'package:BhansaGhar/providers/foodproduct.dart';
import 'package:BhansaGhar/widgets/favourite_card.dart';
import 'package:BhansaGhar/widgets/favouritescard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//providers
import 'package:BhansaGhar/providers/favourites.dart';

// class Myfavorites extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final deviceSize = MediaQuery.of(context).size;

//     final likedFood = Provider.of<Favourites>(context, listen: false);

//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Your Favourites',
//             style: TextStyle(
//               color: Colors.black,
//             ),
//           ),
//           centerTitle: true,
//           backgroundColor: Colors.white,
//           elevation: 0.0,
//         ),
//         body: Column(
//           children: <Widget>[
//             Container(
//               height: 300.0,
//               width: deviceSize.width,
//               //     color: Colors.red,
//               child: ListView.builder(
//                 itemCount: likedFood.items.length,
//                 itemBuilder: (ctx, i) => FavouritesCard(
//                   likedFood.items[i].id,
//                   likedFood.items[i].price,
//                   likedFood.items[i].title,
//                   likedFood.items[i].chefname,
//                   likedFood.items[i].image,
//                 ),
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 10.0,
//                 ),
//                 scrollDirection: Axis.vertical,
//               ),
//             ),
//           ],
//         ));
//   }
// }

class MyFavorites extends StatefulWidget {
  @override
  _MyFavoritesState createState() => _MyFavoritesState();
}

class _MyFavoritesState extends State<MyFavorites> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favorites List'),
      ),
      body: FutureBuilder<List<Favourites>>(
        future: FavService().getFavoriteFood(),
        builder: (context, favfood) {
          print('favfood data ${favfood.data}');
          if (favfood.data == null) {
            return Container();
          } else {
            // if (favfood.data != null) {
            return ListView.builder(
                itemCount: favfood.data.length,
                itemBuilder: (context, index) {
                  Favourites favItems = favfood.data[index];
                  //  print('items:${favItems.name}');
                  return Container(
                    // color: Colors.blue,
                    //margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
                    margin: EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 200.0,
                            width: deviceSize.width,
                            color: Colors.red,
                            // child: Image.network(
                            //   // "https://bhansagharapi.herokuapp.com/uploads/${favItems.image}",
                            //   fit: BoxFit.cover,
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
                              // child: IconButton(
                              //     icon: Icon(favItems.isFavourite
                              //         ? Icons.favorite
                              //         : Icons.favorite_border),
                              //     onPressed: () {
                              //       //       // if (_formkey.currentState.validate()) {
                              //       //       // FavService()
                              //       //       //     .addToFavourite(product.id)
                              //       //       //     .then((value) {
                              //       //       //   if (value.statusCode == 200) {
                              //       //       //     product.toggleFavouriteStatus();
                              //       //       //   } else if (value.statusCode == 400) {
                              //       //       //     print("eereafsdfasdfadsf");
                              //       //       //     print(value.data['error']);
                              //       //       //   }
                              //       //       // });
                              //     }),
                            ),
                          ),
                          Positioned(
                            left: 0.0,
                            bottom: 0.0,
                            child: Container(
                              height: 60.0,
                              // width: 380.0,
                              width: deviceSize.width,
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
                                      // 'name',

                                      favItems.favouriteId.name ?? 'name',
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
                                    //       '(' +
                                    //           favItems.rating.toString() +
                                    //           'Reviews)',
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
                                      'price',
                                      // 'Rs. ${favItems.food.price.toString()}',
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
                  );
                });
            //  } else if closing
          }
        },
      ),
    );
  }
}
