import 'package:flutter/material.dart';

Color primaryColor = const Color.fromARGB(255, 44, 100, 45);
Color secundaryColor = Colors.white;
Color primaryColorLigth = Colors.black;

class CeibaTheme {
  static ThemeData generarTheme() {
    return ThemeData(
      colorScheme: const ColorScheme.light().copyWith(primary: primaryColor),
      primaryColor: primaryColor,
      primaryColorDark: primaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
      ),
      buttonTheme: ButtonThemeData(buttonColor: primaryColor),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: primaryColor),
    );
  }
}
