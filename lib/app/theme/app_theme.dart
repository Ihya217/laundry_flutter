import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTheme {
  ThemeData lightTheme() {
    return ThemeData(
      primaryColor: const Color(0xFF141D31),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: const Color(
              0xFF141D31), // Ganti warna background sesuai kebutuhan
          onPrimary: Colors.white, // Ganti warna teks sesuai kebutuhan
        ),
      ),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0), // Atur border radius
        ),
      ),
    );
  }
}
