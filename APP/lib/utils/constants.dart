import 'package:flutter/material.dart';

final ThemeData themeData = new ThemeData(
  scaffoldBackgroundColor: Color(0xFFE5E5E5),
  colorScheme: ColorScheme.light(
      secondary: Color(0xFF39B9FF),
      background: Color(0xFF141127),
      primary: Color(0xFF00BFA5),
      primaryVariant: Color(0xFF2B2746),
      secondaryVariant: Color(0xFFEEEEEE) // Light purple
      ),
  fontFamily: 'Heebo',
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
    bodyText2: TextStyle(
      fontSize: 13,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
    subtitle1: TextStyle(
      fontSize: 12,
      color: Colors.white.withOpacity(0.35),
      fontWeight: FontWeight.w300,
    ),
    subtitle2: TextStyle(
      fontSize: 10,
      color: Colors.white.withOpacity(0.35),
      fontWeight: FontWeight.w300,
    ),
    headline2: TextStyle(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    headline3: TextStyle(
      fontSize: 13,
      color: Colors.white,
      fontWeight: FontWeight.w300,
    ),
    headline4: TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
    headline5: TextStyle(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    headline6: TextStyle(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
  ),
);
