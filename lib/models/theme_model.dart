import 'package:flutter/material.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
      appBarTheme: AppBarTheme(
        brightness: Brightness.light,
        color: Colors.white,
      ),
      dataTableTheme: DataTableThemeData(),
      iconTheme: IconThemeData(color: Colors.black),
      brightness: Brightness.light,
      accentColor: Colors.pink,
      scaffoldBackgroundColor: Color(0xfff1f1f1));

  final darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      color: Colors.grey[900],
    ),
    iconTheme: IconThemeData(color: Colors.white),
    brightness: Brightness.dark,
    accentColor: Colors.pink,
  );
}
