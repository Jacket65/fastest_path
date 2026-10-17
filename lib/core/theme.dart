import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.blueAccent, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.black,
        textStyle: const TextStyle(
          fontStyle: FontStyle.normal,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
