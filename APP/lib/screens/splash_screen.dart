import 'dart:convert';
import 'package:covatt/models/user.dart';
import 'package:covatt/screens/AuthenticationScreen/login.dart';
import 'package:covatt/screens/FirstScreen/first_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserData user;

  @override
  void initState() {
    super.initState();
    _checkUser().then((res) {
      setState(() {
        user = res;
        print(user.id);
      });
    });
  }

  _checkUser() async {
    if (_auth.currentUser != null) {
      var id = _auth.currentUser.uid;
      var url = Uri.parse("http://localhost:3000/covatt-api/v1/user/" + id);
      var response = await http.get(url);
      var body = jsonDecode(response.body);
      return UserData.fromJson(body['data'][0]);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return FirstScreen(user);
    } else {
      return LoginScreen();
    }
  }
}
