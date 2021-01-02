import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/models/globals.dart';

class TabletVerticalNavWidget extends StatefulWidget {
  @override
  _TabletVerticalNavWidgetState createState() =>
      _TabletVerticalNavWidgetState();
}

class _TabletVerticalNavWidgetState extends State<TabletVerticalNavWidget> {
  int _buttonCurrentIndex = 0;

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
              width: 2,
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
                  icon: Icons.widgets,
                  iconColor: _buttonCurrentIndex == 0
                      ? Global.focusedBlue
                      : Colors.black,
                  borderColor: _buttonCurrentIndex == 0
                      ? Global.focusedBlue
                      : Colors.transparent)),
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
                      : Colors.black,
                  borderColor: _buttonCurrentIndex == 1
                      ? Global.focusedBlue
                      : Colors.transparent)),
          InkWell(
            onTap: () {
              setState(() {
                _buttonCurrentIndex = 2;
              });
            },
            child: _colSingleButton(
                icon: Icons.calendar_today,
                iconColor: _buttonCurrentIndex == 2
                    ? Global.focusedBlue
                    : Colors.black,
                borderColor: _buttonCurrentIndex == 2
                    ? Global.focusedBlue
                    : Colors.transparent),
          ),
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
                    : Colors.black,
                borderColor: _buttonCurrentIndex == 3
                    ? Global.focusedBlue
                    : Colors.transparent),
          ),
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
                    : Colors.black,
                borderColor: _buttonCurrentIndex == 4
                    ? Global.focusedBlue
                    : Colors.transparent),
          ),
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
                    : Colors.black,
                borderColor: _buttonCurrentIndex == 5
                    ? Global.focusedBlue
                    : Colors.transparent),
          ),
        ],
      ),
    );
  }

  Widget _logoutButton() {
    return Icon(
      Icons.exit_to_app,
      color: Global.focusedBlue,
    );
  }
}
