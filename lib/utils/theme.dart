import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Colors.red;
  static const Color darkThemeTextColor = Colors.white;
  static const Color lightThemeTextcolor = Colors.black;
  static final lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      headline1: TextStyle(color: lightThemeTextcolor, fontSize: 24),
      headline2: TextStyle(color: lightThemeTextcolor, fontSize: 22),
      headline3: TextStyle(color: lightThemeTextcolor, fontSize: 20),
      headline4: TextStyle(color: lightThemeTextcolor, fontSize: 18),
      headline5: TextStyle(color: lightThemeTextcolor, fontSize: 16),
      headline6: TextStyle(color: lightThemeTextcolor, fontSize: 14),
      bodyText1: TextStyle(color: lightThemeTextcolor, fontSize: 12),
      bodyText2: TextStyle(color: lightThemeTextcolor, fontSize: 10),
    ),
  );
  static final darkTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Color(0xff141d26),
    textTheme: TextTheme(
      headline1: TextStyle(color: darkThemeTextColor),
      headline2: TextStyle(color: darkThemeTextColor),
      headline3: TextStyle(color: darkThemeTextColor),
      headline4: TextStyle(color: darkThemeTextColor),
      headline5: TextStyle(color: darkThemeTextColor),
      headline6: TextStyle(color: darkThemeTextColor),
      bodyText1: TextStyle(color: darkThemeTextColor),
      bodyText2: TextStyle(color: darkThemeTextColor),
    ),
  );
}
