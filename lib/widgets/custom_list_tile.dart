import 'package:flutter/material.dart';

import 'edit_detail_alert_box.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final String title;

  CustomListTile({this.icon, this.text, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Theme.of(context).accentColor,
          ),
          SizedBox(width: 15.0),
          Flexible(
              flex: 2,
              child: Container(
                  alignment: Alignment.centerLeft,
                  // color: Colors.blue,
                  child: Text(
                    '$text',
                    style: TextStyle(fontSize: 16.0),
                  ))),
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              //  color: Colors.amber,
              height: 20.0,
              width: 50.0,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) => EditAlertBox(title: title));
                },
                child: Text(
                  'Change',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
