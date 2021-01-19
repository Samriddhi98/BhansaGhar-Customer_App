import 'package:flutter/material.dart';

class FaqPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
          title: Text("FAQ"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  child: Text(
                    "How can I become a Bhansaghar home chef (Bhansaghar Partner)?",
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.50,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    "Download a Bhansaghar Partner app.After you contact us via the app,we will visit you and thoroughly examine your kitchen to see if it meets our high sanitary standards.If everything is as of healthy kitchen standards you can start selling food from the very next day.",
                    textAlign: TextAlign.start,
                    textScaleFactor: 1.0,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Text(
                    "Who decide the home chef work schedule?",
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.50,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    "The chef will decide their own schedule but they need to commit to the agreed-upon schedule(chef can however change the schedule)",
                    textAlign: TextAlign.start,
                    textScaleFactor: 1.0,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Text(
                    "Who is deemed responsible for the complaints/compliments on the food items sent to customers?",
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.50,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    "The home chefs are deemed solely responsible for handling the responses for their food.",
                    textAlign: TextAlign.start,
                    textScaleFactor: 1.0,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Text(
                    "How are the prices for the food items set?",
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.50,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    "The prices for the food items are set by the home chefs themselves.And menu is decided by themselves inclusive of platform charge.",
                    textAlign: TextAlign.start,
                    textScaleFactor: 1.0,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Text(
                    "Who will provide the packaging containers?",
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.50,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    "The home chef are responsible for not only their food but also for carefully packing their food for delivery.The packaging needs to be high standard quality with minimal use of plastics.",
                    textAlign: TextAlign.start,
                    textScaleFactor: 1.0,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
               
              ],
            ),
          ),
        ));
  }
}
