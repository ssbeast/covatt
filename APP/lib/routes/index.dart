import 'package:covatt/screens/admin_screen.dart';
import 'package:covatt/screens/family_screen.dart';
import 'package:covatt/screens/login.dart';
import 'package:covatt/screens/profile.dart';
import 'package:covatt/screens/FirstScreen/first_screen.dart';
import 'package:covatt/screens/wrapper.dart';
import 'package:covatt/screens/qr_screen.dart';
import 'package:flutter/material.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => Wrapper());
    case '/login':
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case '/profile':
      return MaterialPageRoute(builder: (_) => ProfileScreen());
    case '/first_screen':
      return MaterialPageRoute(builder: (_) => FirstScreen());
    case '/qr_screen':
      return MaterialPageRoute(builder: (_) => QrScreen());
    case '/admin_screen':
      return MaterialPageRoute(builder: (_) => AdminScreen());
    case '/family_screen':
      return MaterialPageRoute(builder: (_) => FamilyScreen());
    default:
      return MaterialPageRoute(builder: (_) => Wrapper());
  }
}
