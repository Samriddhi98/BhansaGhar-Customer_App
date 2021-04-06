import 'package:BhansaGhar/widgets/custom_list_tile.dart';
import 'package:BhansaGhar/widgets/custom_profile_button.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: Container(
        height: deviceSize.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
                //  color: Colors.red,
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                reverse: false,
                child: Padding(
                  padding: EdgeInsets.only(bottom: bottom),
                  child: Container(
                    padding:
                        EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                    //   color: Colors.lightBlue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                height: 120.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(60.0),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 3.0,
                                        offset: Offset(0, 4.0),
                                        color: Colors.black38)
                                  ],
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/food1.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20.0),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    ProfileIconButton(
                                        icon: Icons.file_upload,
                                        text: 'New Image'),
                                    SizedBox(height: 10.0),
                                    ProfileIconButton(
                                      icon: Icons.delete,
                                      text: 'Delete',
                                    ),
                                  ]),
                            ]),
                        SizedBox(height: 15.0),
                        Text(
                          'Account',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Card(
                          elevation: 5.0,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 5.0,
                                right: 15.0,
                                left: 15.0,
                                bottom: 15.0),
                            child: Column(
                              children: <Widget>[
                                TextFormField(),
                                TextFormField(),
                                TextFormField(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 70.0,
              // color: Colors.yellow,
              child: GestureDetector(
                onTap: () {},
                child: Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: CustomListTile(
                      icon: Icons.delete_forever,
                      text: 'Remove Account',
                    ),
                  ),
                ),
              ),
            ),

            /*  
            ), */
          ],
        ),
      ),
    );
  }
}
