import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/controllers/database_controller.dart';
import 'package:onesystem/controllers/theme_controller.dart';
import 'package:onesystem/models/globals.dart';

class ProfilePage extends StatelessWidget {
  final Widget widgetLogout;
  final String pString, unameString;

  ProfilePage({Key key, this.widgetLogout, this.pString, this.unameString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController tc = Get.put(ThemeController());
    DatabaseController dbc = Get.put(DatabaseController());

    return SafeArea(
        child: Scaffold(
      body: Obx(
        () => Container(
          child: Padding(
            padding: const EdgeInsets.all(50),
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
                Expanded(flex: 1, child: widgetLogout),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget getUserInfo(DatabaseController dbc, ThemeController tc) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Profile Details',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Stack(alignment: Alignment.bottomRight, children: [
          Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: Global.focusedBlue, shape: BoxShape.circle),
              child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Global.trnsp,
                  backgroundImage: NetworkImage(pString))),
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
                title: Text('User Name:  ' + unameString.toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              ListTile(
                leading: Icon(Icons.leaderboard),
                title: Text(
                    'User Level:  ' + dbc.lisForSign.first.levels_id.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text(
                    'User Actual : ' +
                        dbc.lisForSign.first.user_Actual.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              ListTile(
                leading: Icon(Icons.home_work),
                title: Text('Department : ' + 'Quality',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              )
            ]))
      ],
    );
  }
}

Widget getUserSettings(ThemeController tc) {
  String _chosenValue;
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text('Settings',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      Icon(Icons.settings, size: 90),
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
              _chosenValue = value;
            },
          ),
          Switch(
              value: tc.darkTheme,
              onChanged: (x) {
                tc.changeThemeMode();
                print('theme son durumu: ' + x.toString());
                tc.darkTheme = !tc.darkTheme;
              }),
          Text(tc.darkTheme ? 'Dark Theme Enabled' : 'Light Theme Enabled'),
        ],
      ),
      ElevatedButton(
        child: Text('Close'),
        onPressed: () => Get.back(),
      )
    ],
  );
}
