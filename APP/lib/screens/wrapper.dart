import 'package:covatt/common/custom_appbar.dart';
import 'package:covatt/services/get_it.dart';
import 'package:covatt/services/navigation_service.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final NavigationService _navigationService =
      get_it_instance_const<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // drawer: CustomDrawer(
      //   name: "Madhav Bansal",
      //   subtitle: "Vaccinator",
      //   imageURL:
      //       "https://firebasestorage.googleapis.com/v0/b/flutter-firebase-323ef.appspot.com/o/DSC_0537.JPG.png?alt=media&token=162ca151-adaa-426c-a4d3-54db1f3199cc",
      // ),
      appBar: CustomAppBar(
        drawerkey: _scaffoldKey,
        title: "Covatt",
      ),
      body: Container(
          child: Center(
        child: TextButton(
          child: Text("Click Me"),
          onPressed: () {
            _navigationService.navigateTo('/first_screen');
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white)),
        ),
      )),
    );
  }
}
