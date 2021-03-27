import 'package:covatt/common/custom_appbar.dart';
import 'package:covatt/common/custom_button.dart';
import 'package:covatt/common/custom_drawer.dart';
import 'package:covatt/models/user.dart';
import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  final UserData user;
  FeedbackScreen(this.user);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(user: user),
      appBar: CustomAppBar(
        drawerkey: _scaffoldKey,
        title: "Covatt",
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    color: Colors.white,
                    child: TextField(
                      maxLines: 18,
                      cursorColor: Colors.teal,
                      cursorHeight: 25,
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                      cursorWidth: 5,
                      decoration: InputDecoration(
                        hintText: "Enter your valuable feedback",
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  CustomButton(
                    accentColor: Colors.white,
                    mainColor: Colors.teal,
                    text: "Submit",
                    onpress: () {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
