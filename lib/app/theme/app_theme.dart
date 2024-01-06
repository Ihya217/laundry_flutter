import 'package:flutter/material.dart';

class AppTheme {
  ThemeData lightTheme() {
    return ThemeData(
      primaryColor: const Color(0xFF141D31),
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}
