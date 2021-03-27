import 'package:covatt/services/get_it.dart';
import 'package:covatt/services/navigation_service.dart';
import 'package:covatt/utils/constants.dart';
import 'package:covatt/routes/index.dart' as route_generator;
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      title: 'covatt',
      navigatorKey: get_it_instance_const<NavigationService>().navigatorKey,
      onGenerateRoute: route_generator.routes,
      initialRoute: '/splash_screen',
    );
  }
}
