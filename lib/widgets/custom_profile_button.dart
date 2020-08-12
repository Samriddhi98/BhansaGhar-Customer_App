import 'package:flutter/material.dart';

class ProfileIconButton extends StatelessWidget {
  final IconData icon;
  final String text;

  ProfileIconButton({this.icon,this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 30.0,
        width: 100.0,
        // color: Colors.purple,
        child: Row(children: <Widget>[
          Icon(
            icon,
            color: Theme.of(context).accentColor,
          ),
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor),
          )
        ]),
      ),
    );
  }
}
