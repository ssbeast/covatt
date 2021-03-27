import 'package:covatt/services/get_it.dart';
import 'package:covatt/services/navigation_service.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  final NavigationService _navigationService =
      get_it_instance_const<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: FlatButton(
          child: Text("Click Me"),
          onPressed: () {
            _navigationService.navigateTo('/first_screen');
          },
          color: Colors.white,
        ),
      )),
    );
  }
}
