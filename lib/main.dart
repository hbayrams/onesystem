import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'views/tablet/login_page.dart';

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
      //theme: notifier.darkTheme ? dark : light,
      home: LoginPage(),
      //routes: routes,
    );
  }
}
