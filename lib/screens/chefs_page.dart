import 'package:flutter/material.dart';

class ChefPage extends StatefulWidget {
  @override
  _ChefPageState createState() => _ChefPageState();
}

class _ChefPageState extends State<ChefPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.of(context).pushNamed('/main-screen');
      },
          child: Center(
        child:Text('ChefPage'),
      ),
    );
  }
}