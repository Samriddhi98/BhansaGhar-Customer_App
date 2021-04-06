import 'package:BhansaGhar/Api/ApiService.dart';
import 'package:BhansaGhar/models/chefmodel.dart';
import 'package:flutter/material.dart';

class ChefPage extends StatefulWidget {
  @override
  _ChefPageState createState() => _ChefPageState();
}

class _ChefPageState extends State<ChefPage> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pushNamed('/main-screen');
        return;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Connected Chefs'),
        ),
        body: FutureBuilder<List<ChefModel>>(
          future: ApiService().getChefDetails(),
          builder: (context, chefData) {
            if (chefData.data != null) {
              return ListView.builder(
                itemCount: chefData.data.length,
                itemBuilder: (context, index) {
                  ChefModel chef = chefData.data[index];
                  return Container(
                      height: deviceSize.height / 4,
                      child: Card(
                        elevation: 5.0,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Container(
                                width: deviceSize.width / 3,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                width: deviceSize.width / 2,
                                color: Colors.blue,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      chef.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0),
                                    ),
                                    Text(
                                      'Price:',
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                    Text(
                                      'Ordered By:',
                                      style: TextStyle(),
                                    ),
                                    Text(
                                      'Time:',
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                },
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
