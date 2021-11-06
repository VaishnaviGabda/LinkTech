import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MyThemes {
  static final primary = HexColor("#0000FF");
  static final primaryColor = HexColor("#0000FF");

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColorDark: primaryColor,
    accentColor: HexColor("#0000FF"),
    colorScheme: ColorScheme.dark(primary: primary),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(primary: primary),
  );
}
