
import 'package:flutter/material.dart';

ThemeData getTheme(){
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      elevation: 2,
      backgroundColor: Colors.blue,
      titleTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
    ),
  );
}