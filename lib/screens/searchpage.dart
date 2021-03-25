import 'package:BhansaGhar/providers/foodproduct.dart';
import 'package:BhansaGhar/widgets/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Foodproduct> list = [];
  TextEditingController title = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
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
                    controller: title,
                    decoration: InputDecoration(
                      //Add th Hint text here.
                      hintText: "Anything you want?",
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      suffixIcon: InkWell(
                          onTap: () {
                            list.clear();
                            Foodproduct a = Provider.of<FoodProductsList>(
                                    context,
                                    listen: false)
                                .findByname(title.text);
                            if (a != null) {
                              print(a.chefname);
                              setState(() {
                                list.add(a);
                              });
                            }
                          },
                          child: Icon(Icons.search)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        if (list[index].price != null) {
                          return ChangeNotifierProvider.value(
                                        value: list[0],
                                        child: Container(
                                            child: Column(
                                          children: [MenuItem()],
                                        )));
                        } else {
                          return Text("No Found");
                        }
                      }),
                )
              ]),
        ),
      )),
    );
  }
}
