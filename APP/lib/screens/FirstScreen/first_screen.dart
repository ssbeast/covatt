import 'package:covatt/common/custom_appbar.dart';
import 'package:covatt/common/custom_bottom_navigation.dart';
import 'package:covatt/common/custom_drawer.dart';
import 'package:covatt/screens/FirstScreen/first_screen_body.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int bottomNavigationIndex = 0;

  void setBottonNavigationIndex(index) {
    setState(() {
      bottomNavigationIndex = index;
    });
  }

  final List<Widget> array = [FirstScreenBody(), Container(), Container()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(
        name: "Madhav Bansal",
        subtitle: "Vaccinator",
        imageURL:
            "https://firebasestorage.googleapis.com/v0/b/flutter-firebase-323ef.appspot.com/o/DSC_0537.JPG.png?alt=media&token=162ca151-adaa-426c-a4d3-54db1f3199cc",
      ),
      appBar: CustomAppBar(
        drawerkey: _scaffoldKey,
        title: "Covatt",
      ),
      body: array[bottomNavigationIndex],
      bottomNavigationBar: CustomBottomNavigation(
        setBottomNavigationIndex: setBottonNavigationIndex,
        bottomNavigationIndex: bottomNavigationIndex,
      ),
    );
  }
}