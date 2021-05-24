import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/controllers/database_controller.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class EmployeeDataSource1 extends DataGridSource {
  /// Creates the employee data source class with required details.
  DatabaseOperations dbc = Get.put(DatabaseOperations());
  // Map as = {};
  // List<dynamic> listforRow =<dynamic> [];
  // int j = 0;

  ///
  EmployeeDataSource1({List<dynamic> employeeData}) {
    print(employeeData.length.toString());

    // for (var z = 0; z < dbc.sonuc;z++) {
    //   as.clear();
    //   for (dynamic k = 0; k < 23; k++) {
    //     as[k] = employeeData[j];
    //     j += 1;
    //   }
    //   listforRow.add(as.entries.map((entry) => (entry.value)).toList());
    // }

    // print('Datalist boutu : ' +
    //     listforRow.length.toString() +
    //     'index 0 => ' +
    //     listforRow[1][1].toString());

    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              //for (var z = 0; z < 3; z++)
              for (var f = 1; f < 23; f++)
                DataGridCell(columnName: e[f].toString(), value: e[f]),
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
