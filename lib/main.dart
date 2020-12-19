import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onesystem/controllers/theme_controller.dart';
import 'package:onesystem/models/navigator.dart';
import 'package:onesystem/models/theme_model.dart';

// var routes = <String, WidgetBuilder>{
//   "pages/home": (BuildContext context) => HomePage(),
//   "pages/about": (BuildContext context) => AboutPage(),
//   "pages/settings": (BuildContext context) => SettingsPage(),
//   "pages/login_help": (BuildContext context) => LoginHelpPage(),
//   "pages/login": (BuildContext context) => LoginPage(),
// };
Future<void> main() async {
  await GetStorage.init();
  runApp(MyApp());
}

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
      initialRoute: 't/loginPage',
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme, 
      themeMode: ThemeController().getThemeMode(),
    );
  }
}
