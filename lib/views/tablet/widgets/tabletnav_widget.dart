import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/controllers/sharpref_controller.dart';
import 'package:onesystem/models/globals.dart';
import 'package:onesystem/views/tablet/widgets/dialog_widget.dart';

class TabletVerticalNavWidget extends StatefulWidget {
  @override
  _TabletVerticalNavWidgetState createState() =>
      _TabletVerticalNavWidgetState();
}

class _TabletVerticalNavWidgetState extends State<TabletVerticalNavWidget> {
  int _buttonCurrentIndex = 0;
  SharedPrefController sc = Get.put(SharedPrefController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: 70,
      height: Get.height,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _logoWidget(),
          _colButtons(),
          _logoutButton(),
        ],
      ),
    );
  }

  Widget _logoWidget() {
    return Container(
      width: 50,
      height: 50,
      child: Image.asset("assets/images/light2.png"),
    );
  }

  Widget _colSingleButton({IconData icon, Color borderColor, Color iconColor}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: Container(
        width: 70,
        child: Icon(
          icon,
          color: iconColor,
        ),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              width: 4,
              color: borderColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _colButtons() {
    return Container(
      child: Column(
        children: [
          InkWell(
              onTap: () {
                Get.toNamed('t/loginPage');
                setState(() {
                  _buttonCurrentIndex = 0;
                });
              },
              child: _colSingleButton(
                  icon: Icons.home,
                  iconColor: _buttonCurrentIndex == 0
                      ? Global.focusedBlue
                      : Global.light,
                  borderColor: _buttonCurrentIndex == 0
                      ? Global.focusedBlue
                      : Global.trnsp)),
          InkWell(
              onTap: () {
                Get.toNamed('t/settingsPage');
                setState(() {
                  _buttonCurrentIndex = 1;
                });
              },
              child: _colSingleButton(
                  icon: Icons.score,
                  iconColor: _buttonCurrentIndex == 1
                      ? Global.focusedBlue
                      : Global.light,
                  borderColor: _buttonCurrentIndex == 1
                      ? Global.focusedBlue
                      : Global.trnsp)),
          InkWell(
              onTap: () {
                Get.toNamed('t/releasePage');
                setState(() {
                  _buttonCurrentIndex = 2;
                });
              },
              child: _colSingleButton(
                  icon: Icons.calendar_today,
                  iconColor: _buttonCurrentIndex == 2
                      ? Global.focusedBlue
                      : Global.light,
                  borderColor: _buttonCurrentIndex == 2
                      ? Global.focusedBlue
                      : Global.trnsp)),
          InkWell(
              onTap: () {
                setState(() {
                  _buttonCurrentIndex = 3;
                });
              },
              child: _colSingleButton(
                  icon: Icons.pages,
                  iconColor: _buttonCurrentIndex == 3
                      ? Global.focusedBlue
                      : Global.light,
                  borderColor: _buttonCurrentIndex == 3
                      ? Global.focusedBlue
                      : Global.trnsp)),
          InkWell(
              onTap: () {
                setState(() {
                  _buttonCurrentIndex = 4;
                });
              },
              child: _colSingleButton(
                  icon: Icons.message,
                  iconColor: _buttonCurrentIndex == 4
                      ? Global.focusedBlue
                      : Global.light,
                  borderColor: _buttonCurrentIndex == 4
                      ? Global.focusedBlue
                      : Global.trnsp)),
          InkWell(
              onTap: () {
                setState(() {
                  _buttonCurrentIndex = 5;
                });
              },
              child: _colSingleButton(
                  icon: Icons.settings,
                  iconColor: _buttonCurrentIndex == 5
                      ? Global.focusedBlue
                      : Global.light,
                  borderColor: _buttonCurrentIndex == 5
                      ? Global.focusedBlue
                      : Global.trnsp)),
        ],
      ),
    );
  }

  Widget _logoutButton() {
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
}
