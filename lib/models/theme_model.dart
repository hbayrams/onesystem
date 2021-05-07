import 'package:flutter/material.dart';
import 'package:onesystem/models/globals.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      color: Colors.white,
    ),
    // dataTableTheme: DataTableThemeData(dataTextStyle:TextStyle(fontSize: 20,color: Global.dark)),
    iconTheme: IconThemeData(color: Colors.black),
    brightness: Brightness.light,
    accentColor: Colors.pink,
    scaffoldBackgroundColor: Color(0xfff1f1f1),
  );

  final darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      color: Colors.grey[900],
    ),
    // dataTableTheme: DataTableThemeData(
    //   dataTextStyle:TextStyle(fontSize: 20,color: Global.white,),
    // dataRowColor: MaterialStateColor.resolveWith((states) => Global.dark),
    // headingRowColor: MaterialStateColor.resolveWith((states) => Global.dark),
    //),
    iconTheme: IconThemeData(color: Colors.white),
    brightness: Brightness.dark,
    accentColor: Colors.pink,
  );
}
