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
    DatabaseOperations dbc = Get.put(DatabaseOperations());

    return Container(
        color: tc.isColorChangeDW(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
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
                        child: Icon(Icons.change_circle,
                            color: Global.green, size: 25),
                      )),
                )
              ]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('User Name : ' + unameString,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Text(
                      'User Level : ' +
                          dbc.lisForSign.first.levels_id.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Text(
                      'User Actual : ' +
                          dbc.lisForSign.first.user_Actual.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              widgetLogout,
            ],
          ),
        ));
  }
}
