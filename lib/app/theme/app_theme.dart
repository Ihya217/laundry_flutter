import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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

  ThemeData darkTheme() {
    return ThemeData(
      primaryColor: const Color.fromARGB(255, 38, 38, 38),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.white,
          textStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.normal,
          fontSize: 13,
          color: Colors.white,
        ),
        titleSmall: GoogleFonts.poppins(
          textStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w300, fontSize: 13, color: Colors.white),
        ),
        titleMedium: GoogleFonts.poppins(
          textStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.normal, fontSize: 20, color: Colors.white),
        ),
        titleLarge: GoogleFonts.poppins(
          textStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.normal, fontSize: 35, color: Colors.white),
        ),
        bodyMedium: GoogleFonts.poppins(
          textStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),
        ),
        bodyLarge: GoogleFonts.poppins(
          textStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Get.theme.highlightColor),
        ),
        labelSmall: GoogleFonts.poppins(
          textStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, fontSize: 13, color: Colors.white),
        ),
        labelLarge: GoogleFonts.poppins(
          textStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
        ),
      ),
      highlightColor: Color.fromARGB(255, 253, 255, 163),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 241, 241, 241),
        ),
      ),
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0), // Atur border radius
        ),
      ),
    );
  }
}
