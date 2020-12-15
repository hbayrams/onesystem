import 'package:flutter/material.dart';
import 'package:onesystem/models/theme_model.dart';

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
    return Scaffold(
        appBar: AppBar(
          title: Text("Theme Switcher"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Consumer<ThemeNotifier>(
                  builder: (context, notifier, child) => SwitchListTile(
                    title: Text("Dark Mode"),
                    onChanged: (value) {
                      notifier.toggleTheme();
                    },
                    value: notifier.darkTheme,
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.access_alarm),
                    title: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
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
                          label:
                              Text("Weapons", style: TextStyle(fontSize: 16)),
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
              ]),
        ));
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