import 'package:flutter/material.dart';

class ReleasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Global.white,
        body: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                height: double.infinity,
                // color: Global.white,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DropdownButton(
                              elevation: 8,
                              hint: Text(
                                'Select spool...',
                                style: TextStyle(fontSize: 12),
                              ),
                              onChanged: (value) {
                                print("value: $value");
                              },
                              items: [
                                DropdownMenuItem<String>(
                                  value: "1",
                                  child: Text(
                                    "First",
                                  ),
                                ),
                                DropdownMenuItem<String>(
                                  value: "2",
                                  child: Text(
                                    "Second",
                                  ),
                                ),
                              ],
                            ),
                            RaisedButton(
                              onPressed: null,
                              child: Text('Select'),
                            ),
                            // RaisedButton(
                            //   onPressed: null,
                            //   child: Text('Cancel'),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: SingleChildScrollView(
                        child: DataTable(
                          //sortAscending: sort,
                          columnSpacing: 100,
                          dividerThickness: 2,
                          sortColumnIndex: 1,
                          dataRowHeight: 20,
                          columns: [
                            DataColumn(
                              label:
                                  Text("Spool", style: TextStyle(fontSize: 12)),
                              numeric: false,
                            ),
                            DataColumn(
                              label:
                                  Text("State", style: TextStyle(fontSize: 12)),
                              numeric: false,
                            ),
                          ],
                          rows: [
                            for (var i = 0; i < 50; i++)
                              DataRow(
                                  //selected: selectedAvengers.contains(avenger),
                                  cells: [
                                    DataCell(
                                      Text('V' + i.toString()),
                                    ),
                                    DataCell(
                                      Text('-'),
                                    ),
                                  ]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
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
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        // scrollDirection: Axis.vertical,
                        child: DataTable(
                          //sortAscending: sort,
                          dividerThickness: 2,
                          sortColumnIndex: 1,
                          dataRowHeight: 20,
                          columns: [
                            DataColumn(
                              label:
                                  Text("Spool", style: TextStyle(fontSize: 12)),
                              numeric: false,
                            ),
                            DataColumn(
                              label:
                                  Text("Joint", style: TextStyle(fontSize: 12)),
                              numeric: false,
                            ),
                            DataColumn(
                              label:
                                  Text("Spool", style: TextStyle(fontSize: 12)),
                              numeric: false,
                            ),
                            DataColumn(
                              label:
                                  Text("Joint", style: TextStyle(fontSize: 12)),
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
                          ],
                          rows: [
                            for (var i = 0; i < 20; i++)
                              DataRow(
                                  //selected: selectedAvengers.contains(avenger),
                                  cells: [
                                    DataCell(
                                      Text('S1'),
                                    ),
                                    DataCell(
                                      Text(i.toString()),
                                    ),
                                    DataCell(
                                      Text('S1'),
                                    ),
                                    DataCell(
                                      Text(i.toString()),
                                    ),
                                    DataCell(
                                      Text('S1'),
                                    ),
                                    DataCell(
                                      Text(i.toString()),
                                    ),
                                    DataCell(
                                      Text('S1'),
                                    ),
                                    DataCell(
                                      Text(i.toString()),
                                    ),
                                    DataCell(
                                      Text(i.toString()),
                                    ),
                                  ]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: double.infinity,
                //color: Colors.grey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 9,
                      child: SingleChildScrollView(
                        child: DataTable(
                          //sortAscending: sort,
                          columnSpacing: 100,
                          dividerThickness: 2,
                          sortColumnIndex: 1,
                          dataRowHeight: 20,
                          columns: [
                            DataColumn(
                              label:
                                  Text("Spool", style: TextStyle(fontSize: 12)),
                              numeric: false,
                            ),
                            DataColumn(
                              label:
                                  Text("State", style: TextStyle(fontSize: 12)),
                              numeric: false,
                            ),
                          ],
                          rows: [
                            for (var i = 0; i < 50; i++)
                              DataRow(
                                  //selected: selectedAvengers.contains(avenger),
                                  cells: [
                                    DataCell(
                                      Text('V' + i.toString()),
                                    ),
                                    DataCell(
                                      Text('-'),
                                    ),
                                  ]),
                          ],
                        ),
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
                          SizedBox(width: 20,),
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
    );
  }
}
