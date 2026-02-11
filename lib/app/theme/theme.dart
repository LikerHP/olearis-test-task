import 'package:flutter/material.dart';

ThemeData getTheme() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.lightBlue,
      titleTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
    ),
  );
}
