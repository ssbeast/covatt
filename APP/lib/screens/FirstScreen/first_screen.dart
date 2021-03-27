import 'package:covatt/common/custom_appbar.dart';
import 'package:covatt/common/custom_bottom_navigation.dart';
import 'package:covatt/common/custom_drawer.dart';
import 'package:covatt/models/user.dart';
import 'package:covatt/screens/FirstScreen/first_screen_body.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  final UserData user;
  FirstScreen(this.user);
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

  @override
  Widget build(BuildContext context) {
    final List<Widget> array = [
      FirstScreenBody(user: widget.user),
      Container(),
      Container()
    ];
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(
        user: widget.user,
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
