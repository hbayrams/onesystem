import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/controllers/database_controller.dart';
import 'package:onesystem/controllers/theme_controller.dart';
import 'package:onesystem/models/globals.dart';

class ProfilePage extends StatefulWidget {
  final Widget widgetLogout;
  final String pString, unameString;

  ProfilePage({Key key, this.widgetLogout, this.pString, this.unameString})
      : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    ThemeController tc = Get.put(ThemeController());
    DatabaseOperations dbc = Get.put(DatabaseOperations());

    return Obx(() => Container(
          color: tc.isColorChangeDW(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 8, 50, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 6,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(flex: 1, child: getUserInfo(dbc, tc)),
                        Expanded(flex: 1, child: getUserSettings(tc))
                      ]),
                ),
                Expanded(flex: 1, child: widget.widgetLogout),
              ],
            ),
          ),
        ));
  }

  Widget getUserSettings(ThemeController tc) {
    String _chosenValue;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('Settings',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: tc.isColorChangeWD())),
        Icon(Icons.settings, size: 90, color: tc.isColorChangeWD()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: _chosenValue,
              //elevation: 5,
              style: TextStyle(color: Colors.black),

              items: <String>[
                'Light Mode',
                'Dark Mode',
                'System',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    children: [
                      Icon(Icons.dark_mode),
                      SizedBox(width: 10),
                      Text(value),
                    ],
                  ),
                );
              }).toList(),
              hint: Text("Change Theme",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              onChanged: (String value) {
                setState(() {
                  _chosenValue = value;
                });
              },
            ),
            Switch(
                value: tc.darkTheme,
                onChanged: (x) {
                  tc.changeThemeMode();
                  print('theme son durumu: ' + x.toString());
                  tc.darkTheme = !tc.darkTheme;
                }),
            Text(
              tc.darkTheme ? 'Dark Theme Enabled' : 'Light Theme Enabled',
              style: TextStyle(color: tc.isColorChangeWD()),
            ),
          ],
        ),
        ElevatedButton(
          child: Text('Test'),
          onPressed: () {},
        )
      ],
    );
  }

  Widget getUserInfo(DatabaseOperations dbc, ThemeController tc) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Profile Details',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: tc.isColorChangeWD())),
        Stack(alignment: Alignment.bottomRight, children: [
          Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: Global.focusedBlue, shape: BoxShape.circle),
              child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Global.trnsp,
                  backgroundImage: NetworkImage(widget.pString))),
          Positioned(
            top: 45,
            left: 45,
            child: IconButton(
                onPressed: () {
                  print('object');
                },
                icon: Container(
                  decoration: BoxDecoration(
                      color: Global.white, shape: BoxShape.circle),
                  child:
                      Icon(Icons.change_circle, color: Global.green, size: 25),
                )),
          )
        ]),
        Container(
            width: Get.width / 4,
            child: Column(children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text('User Name:  ' + widget.unameString.toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: tc.isColorChangeWD())),
              ),
              ListTile(
                leading: Icon(Icons.leaderboard),
                title: Text(
                    'User Level:  ' + dbc.lisForSign.first.levels_id.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: tc.isColorChangeWD())),
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text(
                    'User Actual : ' +
                        dbc.lisForSign.first.user_Actual.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: tc.isColorChangeWD())),
              )
            ]))
      ],
    );
  }
}
