import 'package:BhansaGhar/widgets/favouritescard.dart';
import 'package:flutter/material.dart';

class Myfavorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
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
                itemCount: 2,
               // itemBuilder: (ctx, i) => FavouritesCard(),
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
                
             