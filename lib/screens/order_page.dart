import 'package:BhansaGhar/Api/OrderService.dart';
import 'package:BhansaGhar/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

//custom widgets
import 'package:BhansaGhar/widgets/order_card.dart';

//providers
import 'package:BhansaGhar/providers/counter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'checkout.dart';
import 'locatorpage.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String chefId;

  saveOrderIdTopref(String orderId) async {
    print('OrderID:' + orderId);
    var preference = await SharedPreferences.getInstance();
    preference.setString("OrderID", orderId);
  }

  @override
  Widget build(BuildContext context) {
    // final counterModel = Provider.of<Counter>(context);
    final cart = Provider.of<Cart>(context);
    List<CartItem> cartItem = [];
    print('cart items:$cart');

    final deviceSize = MediaQuery.of(context).size;
    int total = cart.totalPrice;

    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pushNamed('/main-screen');
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Your Food Cart',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushNamed('/main-screen');
            },
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 400.0,
              width: deviceSize.width,
              //     color: Colors.red,
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, i) => ChangeNotifierProvider<Counter>(
                  create: (context) => Counter(),

                  child: OrderCard(
                    cart.items.values.toList()[i].id,
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].price,
                    cart.items.values.toList()[i].quantity,
                    cart.items.values.toList()[i].title,
                    cart.items.values.toList()[i].image,
                  ),
                  //  chefId = cart.items.values[i].chefid,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                scrollDirection: Axis.vertical,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              width: deviceSize.width,
              height: 80.0,
              //  color: Colors.amber,
              child: ListTile(
                leading: Text('Cart Total',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    )),
                trailing: // Text("Rs. ${total.toString()}",
                    Text("Rs. ${total.toString()}",
                        style: TextStyle(
                          fontSize: 18.0,
                        )),
              ),
            ),
            SizedBox(height: 10.0),
            GestureDetector(
              child: Container(
                height: 40.0,
                width: 350.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  shadowColor: Colors.yellow[700],
                  color: Colors.yellow[700],
                  elevation: 7.0,
                  child: Center(
                      child: Text('Proceed to CHECKOUT',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ))),
                ),
              ),
              onTap: () {
                if (cart.items.length == 0) {
                  Fluttertoast.showToast(
                    msg: 'Your cart is empty',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.grey,
                    textColor: Colors.white,
                    fontSize: 10.0,
                  );
                } else {
                  chefId = cart.items.values.toList()[0].chefid;

                  // OrderService().addToOrder(chefId).then((value) {
                  //   print('order ID:${value.orderModelId}');
                  //   // OrderService()
                  //   //     .addToOrderCheckout(value.orderModelId, cart)
                  //   //     .then((value) => null);

                  //   //  print('order id: ${value.data['id']}');
                  //   // saveOrderIdTopref(value.data['id']);
                  //   // OrderService().
                  // });

                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocatorPage()));
                  Navigator.of(context).pushNamed('/locatorpage');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
