import 'package:flutter/material.dart';

class OrderHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
  length: 2,
  child: MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          onTap: (index) {
           // Tab index when user select it, it start from zero
          },
          tabs: [
            Tab(text: "Active Orders",),
            Tab(text: "Order History",),
          ],
        ),
        title: Text('Your Orders'),
        backgroundColor:   Theme.of(context).primaryColor,
      ),
      body: TabBarView(
        children: [
          Center(
              child: Text(
            "No Active Orders",
            style: TextStyle(fontSize: 18),
          )),
          Center(
              child: Text(
            "No Order History",
            style: TextStyle(fontSize: 18),
          )),
        ],
      ),
    ),
  ),
);
    
  }
}