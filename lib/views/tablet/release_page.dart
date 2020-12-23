import 'package:flutter/material.dart';
import 'package:onesystem/models/globals.dart';

class ReleasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Global.white,
        body: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: double.infinity,
                color: Global.white,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DropdownButton(
                              elevation: 8,
                              hint: Text(
                                'Select...',
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
                            RaisedButton(
                              onPressed: null,
                              child: Text('Cancel'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 9,
                        child: DataTable(
                          //sortAscending: sort,
                          sortColumnIndex: 1,
                          columns: [
                            DataColumn(
                              label: Text("Release Spool",
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
                                      Text(i.toString()),
                                    ),
                                  ]),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: double.infinity,
                color: Colors.amber,
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text('Orta 1-1'),
                    ),
                    Expanded(
                      flex: 7,
                      child: Text('Orta 1-2'),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: double.infinity,
                color: Colors.grey,
                child: Column(
                  children: [
                    Expanded(
                      flex: 9,
                      child: Text('Sağ 1-1'),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text('Sağ 1-2'),
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
