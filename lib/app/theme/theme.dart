import 'package:flutter/material.dart';

ThemeData getTheme() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      shadowColor: Colors.black,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.lightBlue,
      scrolledUnderElevation: 4,
      elevation: 4,
      titleTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
    ),
  );
}
