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
    Icons.layers,
    Icons.design_services,
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
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.2),
                blurRadius: 2,
                offset: Offset(0.5, 0.0),
                spreadRadius: 2)
          ],
        ),
        width: 75,
        height: Get.height,
        child: NavigationRail(
          backgroundColor: tc.isColorChangeDW(),
          labelType: NavigationRailLabelType.selected,
          groupAlignment: 0,
          onDestinationSelected: (int index) {
            pc.pindex = index;
            pc.pageindex(index);
          },
          leading: _navLogo(sc, tc),
          destinations: [
            for (var i = 0; i < navIcon.length; i++)
              NavigationRailDestination(
                  icon: Icon(navIcon[i], color: tc.isColorChangeWD()),
                  label: Text(
                    navList[i],
                    style: TextStyle(color: Global.focusedBlue),
                  ),
                  selectedIcon: Icon(navIcon[i], color: Global.focusedBlue)),
          ],
          selectedIndex: pc.pindex,
          trailing: Column(
            children: [
              _leadingwidget(sc, tc),
              //_logoutButton(sc),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _navLogo(SharedPrefController sc, ThemeController tc) {
  return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Image.asset(tc.isSavedDarkMode()
              ? "assets/images/dark2.png"
              : "assets/images/light2.png"),
          Divider(color: tc.isColorChangeWD())
        ],
      ));
}

Widget _leadingwidget(SharedPrefController sc, ThemeController tc) {
  return Padding(
    padding: const EdgeInsets.only(top: 70, left: 5, right: 5),
    child: Column(
      children: [
        Divider(color: tc.isColorChangeWD()),
        CircleAvatar(
            backgroundColor: Global.focusedBlue,
            radius: 20,
            child: Icon(Icons.people, size: 30, color: Global.white)),
        // SizedBox(
        //   height: 10,
        // ),
        // Text(sc.uname, style: TextStyle(fontWeight: FontWeight.bold))
      ],
    ),
  );
}

Widget _logoutButton(SharedPrefController sc) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
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
        ),
        Text('Logout', style: TextStyle(fontWeight: FontWeight.bold))
      ],
    ),
  );
}
