import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _getStorage = GetStorage();
  final storageKey = 'isDarkmode';
  final _darkTheme = false.obs;

  @override
  onInit() {
    super.onInit();
    GetStorage box = GetStorage();
    if (box.read(storageKey) != null) {
      _darkTheme.value = box.read(storageKey);
    }
  }

  bool get darkTheme => _darkTheme.value;
  set darkTheme(bool value) => _darkTheme.value = value;

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  bool isSavedDarkMode() {
    return _getStorage.read(storageKey) ?? false;
  }

  void saveThemeMode(bool isDarkMode) {
    _getStorage.write(storageKey, isDarkMode);
  }

  void changeThemeMode() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(!isSavedDarkMode());
  }
}
