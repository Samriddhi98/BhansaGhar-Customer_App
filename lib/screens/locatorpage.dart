import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

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
  }

  var addresses, first;
  void getLocation(double longitude, double latitude) async {
    final coordinates = new Coordinates(
      latitude,
      longitude,
    );
    addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);

    setState(() {
      first = addresses.first;
      location = "Location : ${first.addressLine}";
    });
    print("location name${first.featureName} : ${first.addressLine}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120,
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
                Text(locationMessage),
                Text(location),
                FlatButton(
                  onPressed: () {
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
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Phone Number"),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.green,
                            )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(7.0)),
                                borderSide: BorderSide(
                                  color: Colors.green,
                                )),
                            // labelText: 'Name',
                            hintText: 'Your Phone Number',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Center(
                  child: RaisedButton(
                    child: Text(
                      'Confirm',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    textColor: Colors.white,
                    color: Colors.redAccent,
                    //padding: EdgeInsets.all(8.0),
                    splashColor: Colors.grey,
                    onPressed: () {
                      final snackBar = SnackBar(
                        content: Text('Hey! Order has been conformed.'),
                        duration: Duration(seconds: 1),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );
                      _key.currentState.showSnackBar(snackBar);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
