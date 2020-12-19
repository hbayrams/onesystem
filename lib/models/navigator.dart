import 'package:get/get.dart';
import 'package:onesystem/views/tablet/about_page.dart';
import 'package:onesystem/views/tablet/home_page.dart';
import 'package:onesystem/views/tablet/login_help_page.dart';
import 'package:onesystem/views/tablet/login_page.dart';
import 'package:onesystem/views/tablet/settings_page.dart';

class MyNavigator {
  static final route = [
    GetPage(name: 't/loginPage', page: () => LoginPage()),
    GetPage(name: 't/homePage', page: () => HomePage()),
    GetPage(name: 't/aboutPage', page: () => AboutPage()),
    GetPage(name: 't/loginHelpPage', page: () => LoginHelpPage()),
    GetPage(name: 't/settingsPage', page: () => SettingsPage()),
  ];
}
