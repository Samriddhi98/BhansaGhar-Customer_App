import 'package:BhansaGhar/Api/OrderService.dart';
import 'package:BhansaGhar/providers/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class LocatorPage extends StatefulWidget {
  @override
  _LocatorPageState createState() => _LocatorPageState();
}

class _LocatorPageState extends State<LocatorPage> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  var locationMessage = "";
  var location = "";
  var lat;
  var long;

  void getCurrentLocation() async {
    var position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator().getLastKnownPosition();
    print(lastPosition);
    lat = position.latitude;
    long = position.longitude;

    print("$lat , $long");

    setState(() {
      locationMessage = "Latitude : $lat , Longitude : $long";
    });

    //getLocation(lat, long);
  }

  var addresses, first;
  void getLocation(double longitude, double latitude) async {
    // getCurrentLocation();
    final coordinates = new Coordinates(
      latitude,
      longitude,
    );
    addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);

    setState(() {
      first = addresses.first;
      location = first.addressLine;
    });
    print("location name${first.featureName} : ${first.addressLine}");
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final cart = Provider.of<Cart>(context);
    int total = cart.totalPrice;
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(
          'Set Location',
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
            Navigator.of(context).pushNamed('/orderpage');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: deviceSize.width,
                  height: 80.0,
                  //  color: Colors.amber,
                  child: ListTile(
                    leading: Text('Your Cart Total is',
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
                SizedBox(
                  height: 50,
                ),
                Icon(
                  Icons.location_on,
                  size: 46.0,
                  color: Colors.amber,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Get user Location",
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                // Text(locationMessage),
                Text(location),
                FlatButton(
                  onPressed: () {
                    print('locationmessage:$locationMessage');
                    print('location$location');
                    getCurrentLocation();
                    getLocation(long, lat);
                  },
                  color: Colors.amber[500],
                  child: Text("Get Current Location",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                // Container(
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Text("Phone Number"),
                //       SizedBox(
                //         height: 20,
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: TextFormField(
                //           inputFormatters: [
                //             LengthLimitingTextInputFormatter(10)
                //           ],
                //           keyboardType: TextInputType.number,
                //           decoration: InputDecoration(
                //             border: OutlineInputBorder(
                //                 borderSide: BorderSide(
                //               color: Colors.green,
                //             )),
                //             enabledBorder: OutlineInputBorder(
                //                 borderRadius: const BorderRadius.all(
                //                     Radius.circular(7.0)),
                //                 borderSide: BorderSide(
                //                   color: Colors.green,
                //                 )),
                //             // labelText: 'Name',
                //             hintText: 'Your Phone Number',
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 70,
                ),
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
                          child: Text('Confirm Order',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ))),
                    ),
                  ),
                  onTap: () {
                    String chefId = cart.items.values.toList()[0].chefid;
                    OrderService()
                        .addToOrder(
                            chefId: chefId, cart: cart, location: location)
                        .then((value) {
                      if (value.statusCode == 201) {
                        Fluttertoast.showToast(
                          msg: 'Your order has been placed',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 10.0,
                        );
                      }
                    });
                    // final snackBar = SnackBar(
                    //   content: Text('Your Order has been placed'),
                    //   duration: Duration(seconds: 1),
                    //   action: SnackBarAction(
                    //     label: 'Undo',
                    //     onPressed: () {
                    //       // Some code to undo the change.
                    //     },
                    //   ),
                    // );
                    // _key.currentState.showSnackBar(snackBar);
                  },
                ),

                // OrderService()
                //     .addToOrderCheckout(value.orderModelId, cart)
                //     .then((value) => null);

                //  print('order id: ${value.data['id']}');
                // saveOrderIdTopref(value.data['id']);
                // OrderService().

                //  Navigator.of(context).pushNamed('/locatorpage');

                // Center(
                //   child: RaisedButton(
                //     child: Text(
                //       'Confirm',
                //       style: TextStyle(fontSize: 15.0),
                //     ),
                //     textColor: Colors.white,
                //     color: Colors.redAccent,
                //     //padding: EdgeInsets.all(8.0),
                //     splashColor: Colors.grey,
                //     onPressed: () {
                //       final snackBar = SnackBar(
                //         content: Text('Hey! Order has been conformed.'),
                //         duration: Duration(seconds: 1),
                //         action: SnackBarAction(
                //           label: 'Undo',
                //           onPressed: () {
                //             // Some code to undo the change.
                //           },
                //         ),
                //       );
                //       _key.currentState.showSnackBar(snackBar);
                //     },
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
