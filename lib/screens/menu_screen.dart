import 'package:BhansaGhar/models/category_model.dart';
import 'package:BhansaGhar/providers/category_data.dart';
import 'package:BhansaGhar/providers/foodproduct.dart';
import 'package:BhansaGhar/screens/navdrawer.dart';
import 'package:BhansaGhar/screens/searchpage.dart';
import 'package:BhansaGhar/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:BhansaGhar/widgets/category.dart';
import 'package:BhansaGhar/widgets/item.dart';
import 'package:BhansaGhar/widgets/menuitem_list.dart';
import 'package:BhansaGhar/widgets/searchbar.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List<Widget> catlist;
  List<CategoryItems> cat = categories;
  List<Foodproduct> all = [];
  List<Foodproduct> nonveg = [];
  List<Foodproduct> veg = [];
  List<Foodproduct> breakfast = [];
  List<Foodproduct> lunch = [];
  List<Foodproduct> dinner = [];

  // final GlobalKey _scaffoldKey = new GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<FoodProductsList>(context, listen: false).getFoodData("all");

    super.initState();
    tabController = TabController(length: cat.length, vsync: this);
    this.catlist = cat.map((e) {
      return Tab(
        icon: Image.asset(
          e.imagePath,
          height: 15,
        ),
        text: e.categoryName,
      );
    }).toList();
  }

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
                  )) ??
          false;
    }

    final deviceSize = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        // key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        drawer: NavDrawer(),
        body: Column(
          children: <Widget>[
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
                child: SearchBar()),
            TabBar(
              isScrollable: true,
              tabs: catlist,
              controller: tabController,
            ),
            Consumer<FoodProductsList>(
              builder: (context, value, _) {
                if (value.listOfProduct != null &&
                    value.listOfProduct.length != 0) {
                  // value.listOfProduct.forEach((c) {
                  //   if (c.category.toLowerCase() ==
                  //       categoryName1
                  //           // "veg"
                  //           .toLowerCase()) {
                  //     foodlist.add(c);
                  //   }
                  // });
                  for (Foodproduct f in value.listOfProduct) {
                    all.add(f);
                    print("adasdf");
                    if (f.category == "veg") {
                      print("asd");
                      veg.add(f);
                    } else if (f.category == "non-veg") {
                      nonveg.add(f);
                    } else if (f.category == "breakfast") {
                      breakfast.add(f);
                    } else if (f.category == "lunch") {
                      lunch.add(f);
                    } else if (f.category == "dinner") {
                      dinner.add(f);
                    }
                  }

                  return Container(
                    height: deviceSize.height * 0.5,
                    child: Column(
                      children: [
                        Expanded(
                          child:
                              TabBarView(controller: tabController, children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.8,
                              child: ListView.builder(
                                  itemCount: all.length,
                                  // all.length,
                                  itemBuilder: (ctx, i) {
                                    // print(all[i].category);
                                    return ChangeNotifierProvider.value(
                                        value:
                                            // widget.category != null && widget.category != "All"
                                            //     ? foodlist[i]
                                            //     :
                                            // all[i],
                                            all[i],
                                        child: Container(
                                            child: Column(
                                          children: [
                                            // Text(
                                            //   widget.category == null ? "Null" : "cate",
                                            // ),
                                            MenuItem()
                                          ],
                                        )));
                                  }),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: ListView.builder(
                                  itemCount: nonveg.length,
                                  // all.length,
                                  itemBuilder: (ctx, i) {
                                    // print(all[i].category);
                                    return ChangeNotifierProvider.value(
                                        value: nonveg[i],
                                        child: Container(
                                            child: Column(
                                          children: [MenuItem()],
                                        )));
                                  }),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: ListView.builder(
                                  itemCount: veg.length,
                                  // all.length,
                                  itemBuilder: (ctx, i) {
                                    // print(all[i].category);
                                    return ChangeNotifierProvider.value(
                                        value: veg[i],
                                        child: Container(
                                            child: Column(
                                          children: [MenuItem()],
                                        )));
                                  }),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: ListView.builder(
                                  itemCount: breakfast.length,
                                  // all.length,
                                  itemBuilder: (ctx, i) {
                                    // print(all[i].category);
                                    return ChangeNotifierProvider.value(
                                        value: breakfast[i],
                                        child: Container(
                                            child: Column(
                                          children: [MenuItem()],
                                        )));
                                  }),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: ListView.builder(
                                  itemCount: lunch.length,
                                  // all.length,
                                  itemBuilder: (ctx, i) {
                                    // print(all[i].category);
                                    return ChangeNotifierProvider.value(
                                        value: lunch[i],
                                        child: Container(
                                            child: Column(
                                          children: [MenuItem()],
                                        )));
                                  }),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: ListView.builder(
                                  itemCount: dinner.length,
                                  // all.length,
                                  itemBuilder: (ctx, i) {
                                    // print(all[i].category);
                                    return ChangeNotifierProvider.value(
                                        value: dinner[i],
                                        child: Container(
                                            child: Column(
                                          children: [MenuItem()],
                                        )));
                                  }),
                            )
                          ]),
                        ),
                      ],
                    ),
                  );

                  // return Expanded(
                  //   child: Container(
                  //     margin: EdgeInsets.only(
                  //         left: 10.0, right: 10.0, bottom: 10.0, top: 2.0),
                  //     child: ListView.builder(
                  //         itemCount:
                  //             // foodlist.length,
                  //             value.listOfProduct.length,
                  //         itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                  //             value:
                  //                 // widget.category != null && widget.category != "All"
                  //                 //     ? foodlist[i]
                  //                 //     :
                  //                 value.listOfProduct[i],
                  //             // foodlist[i],
                  //             child: Container(
                  //                 child: Column(
                  //               children: [
                  //                 // Text(
                  //                 //   widget.category == null ? "Null" : "cate",
                  //                 // ),
                  //                 MenuItem()
                  //               ],
                  //             )))),
                  //   ),
                  // );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.blueGrey,
                    ),
                  );
                }
              },
            ),

            // SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class MenuPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: Text('MenuPage'),),
//     );
//   }
// }
