import 'package:flutter/material.dart';
import 'package:onesystem/models/spoollist_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({List<SpoolListModel> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              //for (var i = 0; i < Global.lists.length; i++)   ///kontrol edilecek......
              DataGridCell(columnName: ' activity', value: e.activity),
              DataGridCell(columnName: 'blasting', value: e.blasting),
              DataGridCell(columnName: 'blastingDate', value: e.blastingDate),
              DataGridCell(columnName: 'cleaning', value: e.cleaning),
              DataGridCell(columnName: 'cleaningR', value: e.cleaningR),
              DataGridCell(columnName: 'fabrication', value: e.fabrication),
              DataGridCell(columnName: 'finalReport', value: e.finalReport),
              DataGridCell(columnName: 'galv', value: e.galv),
              DataGridCell(columnName: 'galvNo', value: e.galvNo),
              DataGridCell(columnName: 'paint', value: e.paint),
              DataGridCell(columnName: 'paintNo', value: e.paintNo),
              DataGridCell(columnName: 'pipeClass', value: e.pipeClass),
              DataGridCell(columnName: 'pressTest', value: e.pressTest),
              DataGridCell(columnName: 'presstestNo', value: e.presstestNo),
              DataGridCell(columnName: 'release', value: e.release),
              DataGridCell(columnName: 'rubber', value: e.rubber),
              DataGridCell(columnName: 'rubberR', value: e.rubberR),
              DataGridCell(columnName: 'shipDate', value: e.shipDate),
              DataGridCell(columnName: 'shipNo', value: e.shipNo),
              DataGridCell(columnName: 'spool', value: e.spool),
              DataGridCell(columnName: 'weldlogDate', value: e.weldlogDate),
              DataGridCell(columnName: 'weldlogNo', value: e.weldlogNo)
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
