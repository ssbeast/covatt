import 'package:covatt/screens/admin_screen.dart';
import 'package:covatt/screens/family_screen.dart';
import 'package:covatt/screens/AuthenticationScreen/login.dart';
import 'package:covatt/screens/Feedback/feedback.dart';
import 'package:covatt/screens/OtpCheck/otpcheck.dart';
import 'package:covatt/screens/Profile/profile.dart';
import 'package:covatt/screens/AuthenticationScreen/register.dart';
import 'package:covatt/screens/FirstScreen/first_screen.dart';
import 'package:covatt/screens/ReportSymptom/report_symptom.dart';
import 'package:covatt/screens/splash_screen.dart';
import 'package:covatt/screens/wrapper.dart';
import 'package:covatt/screens/qr_screen.dart';
import 'package:flutter/material.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => Wrapper());
    case '/splash_screen':
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case '/register':
      return MaterialPageRoute(builder: (_) => RegisterScreen());
    case '/login':
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case '/feedback':
      Map<String, dynamic> params = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(builder: (_) => FeedbackScreen(params['user']));
    case '/reportSymptom':
      Map<String, dynamic> params = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(builder: (_) => ReportSymptom(params['user']));
    case '/otpcheck':
      Map<String, dynamic> params = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
          builder: (_) => OtpCheck(params['numberHolder']));
    case '/profile':
      Map<String, dynamic> params = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
          builder: (_) => ProfileScreen(params['numberHolder']));
    case '/first_screen':
      Map<String, dynamic> params = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(builder: (_) => FirstScreen(params['user']));
    case '/qr_screen':
      return MaterialPageRoute(builder: (_) => QrScreen());
    case '/admin_screen':
      Map<String, dynamic> params = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(builder: (_) => AdminScreen(params['user']));
    case '/family_screen':
      Map<String, dynamic> params = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(builder: (_) => FamilyScreen(params['user']));

    default:
      return MaterialPageRoute(builder: (_) => Wrapper());
  }
}
