import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onesystem/controllers/theme_controller.dart';

class DenemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeController tc = Get.put(ThemeController());
    GetStorage box = GetStorage();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetX<ThemeController>(
              builder: (_) => Row(
                    children: [
                      Switch(
                        value: tc.darkTheme,
                        onChanged: (value) {
                          if (box.read("darkTheme")) {
                            Get.changeTheme(ThemeData.light());
                          } else {
                            Get.changeTheme(ThemeData.dark());
                          }
                          tc.darkTheme = !tc.darkTheme;
                          tc.strwrite(tc.darkTheme);
                        },
                      ),
                      Text('Theme : ' + box.read("darkTheme").toString()),
                    ],
                  )),
        ],
      ),
    );
  }
}
