import 'package:covatt/app.dart';
import 'package:covatt/services/get_it.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetItService.setupLocator();
  runApp(App());
}
