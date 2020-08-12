import 'package:flutter/material.dart';

class Description extends StatefulWidget {

  final String detail;

  Description(this.detail);

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description>
    with SingleTickerProviderStateMixin {


  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Container(
          child: new TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            indicatorColor: Colors.redAccent,
            labelColor: Theme.of(context).accentColor,
            unselectedLabelColor: Colors.redAccent,
            controller: _controller,
            tabs: [
              new Tab(
                text: 'Details',
              ),
              new Tab(
                text: 'Review',
              ),
            ],
          ),
        ),
        new Container(
          height: 140.0,
          child: new TabBarView(
            controller: _controller,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10.0),
                height: 100.0,
                child: Text(
                    widget.detail),
                //  color: Colors.red,
              ),
              Column(children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 2.0, left: 5.0, right: 5.0),
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: new Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ),
                ButtonTheme(
                  minWidth: 45.0,
                  height: 25.0,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: EdgeInsets.only(right: 10.0),
                      child: FlatButton(
                        color: Colors.amber,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'POST',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                )
              ]),
              /* child: new ListTile(
                  leading: const Icon(Icons.location_on),
                  title: new Text('Latitude: 48.09342\nLongitude: 11.23403'),
                  trailing: new IconButton(
                      icon: const Icon(Icons.my_location), onPressed: () {}),
                ), */
            ],
          ),
        ),
      ],
    );
  }
}
