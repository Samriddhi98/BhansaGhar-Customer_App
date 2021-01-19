import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    var total;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: deviceSize.width,
              height: 80.0,
              //  color: Colors.amber,
              child: ListTile(
                leading: Text('Cart Total',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    )),
                trailing: // Text("Rs. ${total.toString()}",
                    Text("Rs. ${total.toString()}",
                        style: TextStyle(
                          fontSize: 24.0,
                        )),
              ),
              
            ),
            SizedBox(height: 30,),
            Container(
              child: Center(
                child: Text("Location",
                style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
