import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("About Us"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                
                  child: Text(
                '"Not just a business, we create iMpact."'.toUpperCase(),
                textAlign: TextAlign.start,
                textScaleFactor: 2.0,
              ),),
              SizedBox(height: 50.0,),
                Container(
                  height: 400,
                      width: 400,
                      
                      padding: EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10.0),
                      color: Colors.blue[100],
                      child: Text(
                        "Many years back, you may have enjoyed preparing meals and bringing lunch to work. However, in the present days, where hectic work schedule dominates our lifes maintaining a healthy appeitite has become challenging. Fast food is what people usually opt for as they are convinently available. That is also what most online food delivery platforms serve. In all the rush and buzz of life, no matter how much we like eating fast foods at the end of the day we always want to have food that tastes and feels like home.BhansaGhar is here to give you just that. The market is filled with hungry customers willing to fare wholesome home-cooked food. With this app these customers can fulfill their craving for home cooked food at home or from work.Customers seeking to order healthy,homecooked food from BhansaGhar can simply visit our BhansaGhar Cutomer App , click on their choiced item and proceedto check out.The BhansaGhar delivery team then takes care of delivering the order.Additionally, BhansaGhar also provides an opportunity for home-cooks to become home-based entreprenaurs, by helping them learn the business ropes, increasing market reach for them and supporting their growth as entreprenaurs. For home cooks, especially housewifes wanting to turn their cooking passion into a business the BhansaGhar Chef App allows home cooks to register themselves, set their menus and start selling their food. They are notified for orders and once they have done preparing the delivery team handles the delivery. The chefs who use BhansaGhar's services are thoroughly vetted by the company for hygiene,quality, taste and consistency.BhansaGhar works on a comission basis from the chefs sales, but in exchange the homecooks need not worry paying sky high rent for premium kitchen locations, working with large overheads or spending head-earned capital on advertising.This service currently operates only within the Kathmandu Valley. In the times to come depending on the amount of impact BhansaGhar can make on the online food delivery business we plan on expanding this business to the major cities of the country and eventually throughout the nation.",
                      textAlign: TextAlign.start,
                      textScaleFactor: 1.15,
                      ),
                      
                      
                      
                      
                    ),
            ]
                  ),
                )
                
                

    );
          
        
        
  }
}
