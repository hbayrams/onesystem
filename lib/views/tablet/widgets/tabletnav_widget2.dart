import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/controllers/page_controller.dart';
import 'package:onesystem/controllers/sharpref_controller.dart';
import 'package:onesystem/controllers/theme_controller.dart';
import 'package:onesystem/models/globals.dart';
import 'package:onesystem/views/tablet/widgets/dialog_widget.dart';

class TabNavWidget extends StatelessWidget {
  final navList = [
    'Main',
    'Material',
    'Approval',
    'NDT',
    'Release',
    //'Shipping',
    'Settings'
  ];
  final List<IconData> navIcon = [
    Icons.widgets,
    Icons.design_services,
    Icons.layers,
    Icons.warning,
    Icons.assignment,
    //Icons.swap_horiz,
    Icons.settings
  ];
  @override
  Widget build(BuildContext context) {
    SharedPrefController sc = Get.put(SharedPrefController());
    PagesController pc = Get.put(PagesController());
    ThemeController tc = Get.put(ThemeController());
    return Obx(
      () => Container(
        width: 70,
        height: Get.height,
        child: NavigationRail(
          groupAlignment: 0,
          onDestinationSelected: (int index) {
            pc.pindex = index;
          },
          leading: Image.asset("assets/images/light2.png"),
          trailing: _logoutButton(sc),
          destinations: [
            for (var i = 0; i < navIcon.length; i++)
              NavigationRailDestination(
                  icon: Icon(navIcon[i], color: tc.isColorChangeWD()),
                  label: Text(navList[i]),
                  selectedIcon: Icon(navIcon[i], color: Global.focusedBlue)),
          ],
          selectedIndex: pc.pindex,
        ),
      ),
    );
  }
}

Widget _logoutButton(SharedPrefController sc) {
  return InkWell(
    onTap: () => Get.dialog(
        ShowDialogWidget(
            title: 'Logout',
            tbtn1: 'OK',
            tbtn2: 'CANCEL',
            text1: 'Do you check out the account?',
            text2: 'Account preferences will be reset!',
            onPressed: () {
              sc.isLogin = false;
              Get.offNamed('t/loginPage');
              print('Çıkış yapıldı: ' + sc.uname);
            }),
        transitionDuration: Duration(milliseconds: 300),
        barrierDismissible: false),
    child: Icon(
      Icons.exit_to_app,
      color: Global.dark_red,
    ),
  );
}
