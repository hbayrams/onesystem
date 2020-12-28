import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onesystem/controllers/sharpref_controller.dart';
import 'package:onesystem/controllers/theme_controller.dart';
import 'package:onesystem/models/navigator.dart';
import 'package:onesystem/models/theme_model.dart';
import 'package:responsive_builder/responsive_builder.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(MyApp());
}

//GetStorage Path:/data/data/com.example.onesystem/app_flutter/GetStorage.gs
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.native,
      getPages: MyNavigator.route,
      initialRoute: SharedPrefController().getShared(),
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: ThemeController().getThemeMode(),
    );
  }
}
