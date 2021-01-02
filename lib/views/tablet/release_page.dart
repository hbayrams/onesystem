import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/controllers/dataview_controller.dart';
import 'package:onesystem/controllers/theme_controller.dart';
import 'package:onesystem/models/globals.dart';
//import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReleasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DataviewController dvc = Get.put(DataviewController());
    ThemeController tc = Get.put(ThemeController());
    return SafeArea(
      child: Scaffold(
        body: GetX<DataviewController>(
          builder: (_) => Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: double.infinity,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: DropdownButton<String>(
                                  value: dvc.ddValue,
                                  hint: Text(
                                    'Select List... ',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  onChanged: (String value) {
                                    dvc.ddValue = value;
                                    dvc.widgetEnabled = true;
                                    print("value: $value");
                                    print('value_getx: ' + dvc.ddValue);
                                  },
                                  items: [
                                    for (var i = 1; i < 10; i++)
                                      DropdownMenuItem<String>(
                                        value: i.toString(),
                                        child: Text(
                                          "RL-0000" + i.toString(),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 2,
                                child: RaisedButton(
                                  onPressed:
                                      dvc.widgetEnabled ? dvc.widgetFunc : null,
                                  child: Text('Select'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: ListView(
                          children: <Widget>[
                            Card(
                              child: DataTable(
                                //sortAscending: sort,
                                dividerThickness: 2,
                                sortColumnIndex: 1,
                                dataRowHeight: 30,
                                columns: [
                                  DataColumn(
                                    label: Text("Spool",
                                        style: TextStyle(fontSize: 15)),
                                    numeric: false,
                                  ),
                                  DataColumn(
                                    label: Text("Condition",
                                        style: TextStyle(fontSize: 15)),
                                    numeric: false,
                                  ),
                                ],
                                rows: [
                                  for (var i = 50; i < 150; i++)
                                    DataRow(
                                        //selected: selectedAvengers.contains(avenger),
                                        cells: [
                                          DataCell(
                                            Text('V' + i.toString()),
                                            onTap: dvc.widgetFunc1,
                                          ),
                                          DataCell(
                                            Text('-'),
                                            onTap: dvc.widgetFunc1,
                                          ),
                                        ]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  height: double.infinity,
                  //color: Colors.amber,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text('Orta 1-1'),
                      ),
                      Expanded(
                        flex: 7,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Card(
                              child: SingleChildScrollView(
                                child: DataTable(
                                  dataTextStyle: (TextStyle(
                                    fontSize: 16,
                                    color: tc.isColorChangeWD(),
                                  )),
                                  //sortAscending: sort,
                                  dividerThickness: 2,
                                  sortColumnIndex: 1,
                                  dataRowHeight: 30,
                                  columns: [
                                    DataColumn(
                                      label: Text("Spool",
                                          style: TextStyle(fontSize: 12)),
                                      numeric: false,
                                    ),
                                    DataColumn(
                                      label: Text("Joint",
                                          style: TextStyle(fontSize: 12)),
                                      numeric: false,
                                    ),
                                    DataColumn(
                                      label: Text("Spool",
                                          style: TextStyle(fontSize: 12)),
                                      numeric: false,
                                    ),
                                    DataColumn(
                                      label: Text("Joint",
                                          style: TextStyle(fontSize: 12)),
                                      numeric: false,
                                    ),
                                    DataColumn(
                                      label: Text("Item-1",
                                          style: TextStyle(fontSize: 12)),
                                      numeric: false,
                                    ),
                                    DataColumn(
                                      label: Text("Heat-1",
                                          style: TextStyle(fontSize: 12)),
                                      numeric: false,
                                    ),
                                    DataColumn(
                                      label: Text("Item-2",
                                          style: TextStyle(fontSize: 12)),
                                      numeric: false,
                                    ),
                                    DataColumn(
                                      label: Text("Heat-2",
                                          style: TextStyle(fontSize: 12)),
                                      numeric: false,
                                    ),
                                    DataColumn(
                                      label: Text("FitUpDate",
                                          style: TextStyle(fontSize: 12)),
                                      numeric: false,
                                    ),
                                    DataColumn(
                                      label: Text("Test",
                                          style: TextStyle(fontSize: 12)),
                                      numeric: false,
                                    ),
                                  ],
                                  rows: [
                                    for (var i = 0; i < 20; i++)
                                      DataRow(
                                          //selected: selectedAvengers.contains(avenger),
                                          cells: [
                                            DataCell(
                                              Text(dvc.fillData1 ? 'S1' : ''),
                                            ),
                                            DataCell(
                                              Text(dvc.fillData1
                                                  ? i.toString()
                                                  : ''),
                                            ),
                                            DataCell(
                                              Text(dvc.fillData1 ? 'S1' : ''),
                                            ),
                                            DataCell(
                                              Text(dvc.fillData1
                                                  ? i.toString()
                                                  : ''),
                                            ),
                                            DataCell(
                                              Text(dvc.fillData1 ? 'S1' : ''),
                                            ),
                                            DataCell(
                                              Text(dvc.fillData1
                                                  ? i.toString()
                                                  : ''),
                                            ),
                                            DataCell(
                                              Text(dvc.fillData1 ? 'S1' : ''),
                                            ),
                                            DataCell(
                                              Text(dvc.fillData1
                                                  ? i.toString()
                                                  : ''),
                                            ),
                                            DataCell(
                                              Text(dvc.fillData1 ? 'S1' : ''),
                                            ),
                                            DataCell(
                                              Text(dvc.fillData1
                                                  ? i.toString()
                                                  : ''),
                                            ),
                                          ]),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: double.infinity,
                  //color: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 9,
                        child: ListView(
                          children: <Widget>[
                            Card(
                              child: DataTable(
                                //sortAscending: sort,
                                dividerThickness: 2,
                                sortColumnIndex: 1,
                                dataRowHeight: 30,
                                columns: [
                                  DataColumn(
                                    label: Text("Spool",
                                        style: TextStyle(fontSize: 15)),
                                    numeric: false,
                                  ),
                                  DataColumn(
                                    label: Text("State",
                                        style: TextStyle(fontSize: 15)),
                                    numeric: false,
                                  ),
                                ],
                                rows: [
                                  for (var i = 0; i < 50; i++)
                                    DataRow(
                                        //selected: selectedAvengers.contains(avenger),
                                        cells: [
                                          DataCell(
                                            Text(dvc.fillData
                                                ? 'V' + i.toString()
                                                : ''),
                                          ),
                                          DataCell(
                                            Text(dvc.fillData ? '-' : ''),
                                          ),
                                        ]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RaisedButton(
                              onPressed: null,
                              child: Text('Release'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            RaisedButton(
                              onPressed: null,
                              child: Text('Cancel'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
