import 'package:flutter/material.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
      useMaterial3: true,
      primaryColorDark: ColorPalette.black,
      primaryColorLight: ColorPalette.black00,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFF9F8FD),
      primaryColor: ColorPalette.ceruleanBlue,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.black,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        labelLarge: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
        labelMedium: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
        labelSmall: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
      ));

  static ThemeData darkTheme = ThemeData.dark().copyWith(
      useMaterial3: true,
      primaryColorDark: ColorPalette.black00,
      primaryColorLight: ColorPalette.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Color(0xFF262626),
      primaryColor: ColorPalette.crimsonRed,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        labelLarge: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
        labelMedium: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
        labelSmall: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
      ));
}
