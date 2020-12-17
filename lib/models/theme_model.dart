import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

ThemeData light = ThemeData(
    dataTableTheme: DataTableThemeData(),
    iconTheme: IconThemeData(color: Colors.black),
    brightness: Brightness.light,
    primarySwatch: Colors.teal,
    accentColor: Colors.pink,
    scaffoldBackgroundColor: Color(0xfff1f1f1));

ThemeData dark = ThemeData(
  iconTheme: IconThemeData(color: Colors.white),
  brightness: Brightness.dark,
  primarySwatch: Colors.indigo,
  accentColor: Colors.pink,
);
