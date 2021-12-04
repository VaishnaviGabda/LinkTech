import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MyThemes {
  static final primary = HexColor("#0000FF");
  static final primaryColor = Colors.blue.shade300;
  static final primaryIconTheme = Colors.black;

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColorDark: primaryColor,
    colorScheme: ColorScheme.dark(primary: primary),
    accentColor: Colors.blue,
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(primary: primary),
  );
}
