import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onesystem/controllers/theme_controller.dart';

class DenemePage extends StatelessWidget {
  ThemeController tc = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetX<ThemeController>(
            builder: (_) => Row(
              children: [
                Switch(
                    value: tc.darkTheme,
                    onChanged: (x) {
                      tc.changeThemeMode();
                      print('theme son durumu: ' + x.toString());
                      tc.darkTheme = !tc.darkTheme;
                    }),
                Text(
                  tc.darkTheme ? 'Dark Theme Enabled' : 'Light Theme Enabled',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
