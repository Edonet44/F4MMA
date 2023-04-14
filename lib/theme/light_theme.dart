import 'package:flutter/material.dart';

class TemaChiaro {
  static final ThemeData tema = ThemeData.light().copyWith(
    primaryColor: Colors.blue,
    hintColor: Colors.red,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      headline2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(fontSize: 16.0),
      bodyText2: TextStyle(fontSize: 14.0),
    ),
  );
}