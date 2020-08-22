import 'package:BhansaGhar/screens/navdrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:BhansaGhar/widgets/category.dart';
import 'package:BhansaGhar/widgets/item.dart';
import 'package:BhansaGhar/widgets/menuitem_list.dart';
import 'package:BhansaGhar/widgets/searchbar.dart';

class MenuPage extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    Future<bool> _onBackPressed() {
  return showDialog(
    context: context,
    builder: (context) => new AlertDialog(
                  title: Text('Are you sure?'),
                  content: Text(
                    'Do you want to exit the App?',
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('No'),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                    FlatButton(
                      child: Text('Yes'),
                      onPressed: () {
                        SystemNavigator.pop();

                  
                      },
                    ),
                  ],
                )
  ) ??
      false;
}
    final GlobalKey _scaffoldKey = new GlobalKey();
    final deviceSize = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: _onBackPressed,
          child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomPadding: false,
        drawer: NavDrawer(),
        body: Column(
          children: <Widget>[
            SearchBar(),
            Category(),
           // SizedBox(height: 5.0),
            MenuList(),
            
          ],
        ),
      ),
    );
  }
}
