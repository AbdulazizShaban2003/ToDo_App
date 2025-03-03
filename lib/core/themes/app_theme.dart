import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      background: Colors.white,
      secondary: Colors.green,
    ),
    primaryColor: Colors.blue,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Colors.black,
        fontSize: 45,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        color: Color.fromARGB(255, 234, 234, 234),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      displayMedium: TextStyle(color: Colors.white, fontSize: 21),
      titleSmall: TextStyle(
        fontSize: 40,
        color: Colors.black,
        fontWeight: FontWeight.w300,
      ),
      headlineMedium: TextStyle(color: Colors.grey, fontSize: 17),
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 60,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
