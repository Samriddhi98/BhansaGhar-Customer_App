import 'package:BhansaGhar/screens/sidebar/navdrawer.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> with SingleTickerProviderStateMixin{
   



  @override
  Widget build(BuildContext context) {
    
    final deviceSize = MediaQuery.of(context).size;
    return  Container(
        margin: EdgeInsets.only(top: 15.0),
        width: deviceSize.width,
        height: 75.0,
        // color: Colors.red,
        child: Row(children: <Widget>[
          IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                 Scaffold.of(context).openDrawer();
              }),
          SizedBox(width: 5.0),
          Flexible(
            child: Container(
              width: 310.0,
              height: 50.0,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.red[200],
                        spreadRadius: 2.0,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 4.0)
                  ]),
              child: TextField(
                // controller: _textFieldController,
                decoration: InputDecoration(
                  //Add th Hint text here.
                  hintText: "Anything you want?",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  suffixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ]),
      );
    
  }
}
