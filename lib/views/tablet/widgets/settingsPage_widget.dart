import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/controllers/theme_controller.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<Demo> avengers;
  List<Demo> selectedAvengers;
  bool sort;

  @override
  void initState() {
    sort = false;
    selectedAvengers = [];
    avengers = Demo.getDemos();
    super.initState();
  }

  onSortColum(int columnIndex, bool ascending) {
    //if (columnIndex == 0) {
    if (ascending) {
      avengers.sort((a, b) => a.weapon.compareTo(b.name));
    } else {
      avengers.sort((a, b) => b.weapon.compareTo(a.name));
    }
  }
  //}

  @override
  Widget build(BuildContext context) {
    ThemeController tc = Get.put(ThemeController());
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Switch(
                  value: tc.darkTheme,
                  onChanged: (x) {
                    tc.changeThemeMode();
                    print('theme son durumu: ' + x.toString());
                    tc.darkTheme = !tc.darkTheme;
                  }),
              Text(
                tc.darkTheme ? 'Dark Theme Enabled' : 'Light Theme Enabled',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.access_alarm),
              title: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Text(tc.darkTheme.toString()),
                Text(Get.isDarkMode.toString()),
                Text("Screen Height: " + Get.height.toString()),
                Text("Screen Width: " + Get.width.toString()),
                Text("Is Device IOS?: " + GetPlatform.isIOS.toString()),
                Text("Is Device Android?: " + GetPlatform.isAndroid.toString()),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: DataTable(
                sortAscending: sort,
                sortColumnIndex: 1,
                columns: [
                  DataColumn(
                      label: Text("Name", style: TextStyle(fontSize: 16)),
                      numeric: false,
                      onSort: (columnIndex, ascending) {
                        setState(() {
                          sort = !sort;
                        });
                        onSortColum(columnIndex, ascending);
                      }),
                  DataColumn(
                    label: Text("Weapons", style: TextStyle(fontSize: 16)),
                    numeric: false,
                  ),
                  DataColumn(
                    label: Text("Year", style: TextStyle(fontSize: 16)),
                    numeric: true,
                  ),
                ],
                rows: avengers
                    .map(
                      (avenger) => DataRow(
                          selected: selectedAvengers.contains(avenger),
                          cells: [
                            DataCell(
                              Text(avenger.name),
                              onTap: () {
                                print('Selected ${avenger.name}');
                              },
                            ),
                            DataCell(
                              Text(avenger.weapon),
                            ),
                            DataCell(
                              Text(avenger.year.toString()),
                            ),
                          ]),
                    )
                    .toList(),
              ),
            ),
          ),
          ElevatedButton(
            child: Text('Test'),
            onPressed: () {
              Get.toNamed('t/releasePage');
            },
          ),
        ]);
  }
}

class Demo {
  String name;
  String weapon;
  int year;

  Demo({this.name, this.weapon, this.year});

  static List<Demo> getDemos() {
    return <Demo>[
      Demo(name: "Captain America", weapon: "Shield", year: 35),
      Demo(name: "Thor", weapon: "Mjolnir", year: 37),
      Demo(name: "Spiderman", weapon: "Web Shooters", year: 41),
      Demo(name: "Doctor Strange ", weapon: "Eye Of Agamotto", year: 55),
    ];
  }
}
