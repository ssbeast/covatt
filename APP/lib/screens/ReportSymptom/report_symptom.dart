import 'package:covatt/common/custom_appbar.dart';
import 'package:covatt/common/custom_button.dart';
import 'package:covatt/common/custom_drawer.dart';
import 'package:covatt/models/user.dart';

import 'package:flutter/material.dart';

class ReportSymptom extends StatelessWidget {
  final UserData user;
  ReportSymptom(this.user);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(
          user: user,
        ),
        appBar: CustomAppBar(
          drawerkey: _scaffoldKey,
          title: "Covatt",
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: [
              SizedBox(
                height: 25.0,
              ),
              Text(
                "Rate Us",
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Wrap(
                spacing: MediaQuery.of(context).size.width / 3 - 40,
                direction: Axis.horizontal,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.sentiment_very_dissatisfied_sharp,
                      size: 60,
                    ),
                    onPressed: () {
                      print("very dissatisfied");
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.sentiment_satisfied,
                      size: 60,
                    ),
                    onPressed: () {
                      print("satisfied");
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.sentiment_very_satisfied,
                      size: 60,
                    ),
                    onPressed: () {
                      print("very satisfied");
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                color: Colors.white,
                child: TextField(
                  cursorColor: Colors.teal,
                  cursorHeight: 15.0,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: "Enter any Improvements/ Suggestions",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              CustomButton(
                accentColor: Colors.white,
                mainColor: Colors.teal,
                onpress: () {},
                text: "Submit",
              )
            ],
          ),
        ));
  }
}
