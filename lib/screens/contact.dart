import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Our Contact"),
      ),
      body: Container(
        height: 400,
        width: 400,
        padding: EdgeInsets.all(10),
        margin: const EdgeInsets.all(15.0),
        color: Colors.blue[100],
        child: Column(
          children: [
            rowWithContent("9863330414/9860197955", Icons.call),
            rowWithContent("bhansaghar@gmail.com", Icons.email),
            rowWithContent("Kathmandu", Icons.location_city),
            rowWithContent("Sun-Sat 9 a.m-7:00 p.m.", Icons.schedule),
          ],
        ),
      ),
    );
  }

  Widget rowWithContent(String text, IconData icon) {
    return Container(
      height: 80,
      child: Row(
        children: [
          // flex: 2,
          Icon(
            icon,
            size: 30.0,
          ),

          SizedBox(
            width: 40.0,
          ),

          // flex: 3,
          Text(
            text,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 20.0),
            //textScaleFactor: 1.0,
          ),
        ],
      ),
    );
  }
}
