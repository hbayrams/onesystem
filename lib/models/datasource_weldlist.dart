import 'package:flutter/material.dart';
import 'package:onesystem/models/signin_model.dart';
import 'package:onesystem/models/weldlist_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class EmployeeDataSource2 extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource2({List<WeldListModel> employeeData2}) {
    _employeeData2 = employeeData2
        .map<DataGridRow>((e) => DataGridRow(cells: [
              //for (var i = 0; i < Global.lists.length; i++)   ///kontrol edilecek......
              DataGridCell(columnName: 'weld', value: e.weld),
              DataGridCell(columnName: 'activity', value: e.activity),
              DataGridCell(columnName: 'location', value: e.location),
              DataGridCell(columnName: 'material', value: e.material),
              DataGridCell(columnName: 'type', value: e.type),
              DataGridCell(columnName: 'size', value: e.size),
              DataGridCell(columnName: 'thick', value: e.thick),
              DataGridCell(columnName: 'item1', value: e.item1),
              DataGridCell(columnName: 'item1_c', value: e.item1_c),
              DataGridCell(columnName: 'item1_heat', value: e.item1_heat),
              DataGridCell(columnName: 'item2', value: e.item2),
              DataGridCell(columnName: 'item2_c', value: e.item2_c),
              DataGridCell(columnName: 'item2_heat', value: e.item2_heat),
              DataGridCell(columnName: 'fitup', value: e.fitup),
              DataGridCell(columnName: 'welder', value: e.welder),
              DataGridCell(columnName: 'weldDate', value: e.weldDate),
              DataGridCell(columnName: 'vt', value: e.vt),
              DataGridCell(columnName: 'vtDate', value: e.vtDate),
              DataGridCell(columnName: 'rt', value: e.rt),
              DataGridCell(columnName: 'rtDate', value: e.rtDate),
              DataGridCell(columnName: 'rtResult', value: e.rtResult),
              DataGridCell(columnName: 'ut', value: e.ut),
              DataGridCell(columnName: 'utDate', value: e.utDate),
              DataGridCell(columnName: 'mt', value: e.mt),
              DataGridCell(columnName: 'mtDate', value: e.mtDate),
              DataGridCell(columnName: 'pt', value: e.pt),
              DataGridCell(columnName: 'ptDate', value: e.ptDate),
              DataGridCell(columnName: 'ft', value: e.ft),
              DataGridCell(columnName: 'ftDate', value: e.ftDate),
              DataGridCell(columnName: 'rpd', value: e.rpd),
              DataGridCell(columnName: 'rpdDate', value: e.rpdDate),
              DataGridCell(columnName: 'pwht', value: e.pwht),
              DataGridCell(columnName: 'pwhtDate', value: e.pwhtDate),
              DataGridCell(columnName: 'ht', value: e.ht),
              DataGridCell(columnName: 'htDate', value: e.htDate),
              DataGridCell(columnName: 'pmi', value: e.pmi),
              DataGridCell(columnName: 'pmiDate', value: e.pmiDate),
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData2 = [];

  @override
  List<DataGridRow> get rows => _employeeData2;

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
