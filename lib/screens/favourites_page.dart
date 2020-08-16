
import 'package:BhansaGhar/widgets/favouritescard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//providers
import 'package:BhansaGhar/providers/favourites.dart';

class Myfavorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final likedFood = Provider.of<Favourites>(context);
    return Scaffold(
        appBar: AppBar(
        title: Text(
          'Your Favourites',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Column(children: <Widget>[
         Container(
            height: 300.0,
            width: deviceSize.width,
            //     color: Colors.red,
              child: ListView.builder(
                itemCount: likedFood.items.length,
               itemBuilder: (ctx, i) => FavouritesCard(
                 likedFood.items[i].id,
                  likedFood.items[i].price,
                  likedFood.items[i].title,
                  likedFood.items[i].chefname,
                  likedFood.items[i].image,
               ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                ),
                                scrollDirection: Axis.vertical,
                              ),
                            
                          ),
                      ],)
                    );
                  }
                }
                
             