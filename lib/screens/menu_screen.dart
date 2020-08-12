import 'package:BhansaGhar/screens/sidebar/navdrawer.dart';
import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:BhansaGhar/widgets/category.dart';
import 'package:BhansaGhar/widgets/item.dart';
import 'package:BhansaGhar/widgets/menuitem_list.dart';
import 'package:BhansaGhar/widgets/searchbar.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey _scaffoldKey = new GlobalKey();
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
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
    );
  }
}
