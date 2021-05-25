import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource(
      {List<dynamic> employeeData, List<dynamic> listForFields}) {
    print(employeeData.length.toString());

    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              //for (var z = 0; z < 3; z++)
              for (var f = 1; f < listForFields.length; f++)
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
