import 'package:flutter/material.dart';

class TemaScuro {
  static final ThemeData tema = ThemeData.dark().copyWith(
    primaryColor: Colors.blue,
    hintColor: Colors.red,
    backgroundColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
      headline2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
      bodyText1: TextStyle(fontSize: 16.0, color: Colors.white),
      bodyText2: TextStyle(fontSize: 14.0, color: Colors.white),
    ),
  );
}