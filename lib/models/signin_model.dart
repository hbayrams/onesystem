import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/controllers/database_controller.dart';
import 'package:onesystem/controllers/login_controller.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SigninModel {
  int id, levels_id, user_Actual;
  String user_Name, user_Password;
  //bool login;

  SigninModel(
      this.user_Name, this.user_Password, this.levels_id, this.user_Actual,
      {this.id});
}

List<SigninModel> getEmployeeData() {
  return [
    SigninModel('tumVeriler[0].user_Name', 'tumVeriler[0].user_Password', 1, 2)
  ];
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({List<SigninModel> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'user_Name', value: e.user_Name),
              DataGridCell<String>(
                  columnName: 'user_Password', value: e.user_Password),
              DataGridCell<int>(columnName: 'Levels_id', value: e.levels_id),
              DataGridCell<int>(columnName: 'user_Actual', value: e.user_Actual)
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
