import 'package:flutter/material.dart';
import 'package:onesystem/models/globals.dart';
import 'package:onesystem/views/tablet/widgets/box_widget.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// The home page of the application which hosts the datagrid.
class DataGridWidget extends StatefulWidget {
  /// Creates the home page.
  DataGridWidget({Key key}) : super(key: key);

  @override
  _DataGridWidgetState createState() => _DataGridWidgetState();
}

class _DataGridWidgetState extends State<DataGridWidget> {
  List<Employee> employees = <Employee>[];
  EmployeeDataSource employeeDataSource;

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: SfDataGrid(
        headerGridLinesVisibility: GridLinesVisibility.both,
        allowPullToRefresh: true,
        defaultColumnWidth: 105,
        source: employeeDataSource,
        columnWidthMode: ColumnWidthMode.none,
        gridLinesVisibility: GridLinesVisibility.both,
        headerRowHeight: 40,
        rowHeight: 30,
        columns: <GridColumn>[
          GridTextColumn(
              columnName: 'id',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'ID',
                  ))),
          GridTextColumn(
              columnName: 'name',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Name'))),
          GridTextColumn(
              columnName: 'designation',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Designation',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridTextColumn(
              columnName: 'salary',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Salary'))),
          GridTextColumn(
              columnName: 'salary1',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Salary1'))),
          GridTextColumn(
              columnName: 'salary2',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Salary2'))),
          GridTextColumn(
              columnName: 'salary3',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Salary3'))),
          GridTextColumn(
              columnName: 'salary4',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Salary4'))),
          GridTextColumn(
              columnName: 'salary5',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Salary5'))),
        ],
      ),
    );
  }

  List<Employee> getEmployeeData() {
    return [
      Employee(10001, 'James', 'Project Lead', 20000, 20000, 20000, 20000,
          20000, 20000),
      Employee(10002, 'Kathryn', 'Manager', 30000, 30000, 30000, 30000, 30000,
          30000),
      Employee(
          10003, 'Lara', 'Developer', 15000, 15000, 15000, 15000, 15000, 15000),
      Employee(10004, 'Michael', 'Designer', 15000, 15000, 15000, 15000, 15000,
          15000),
      Employee(10005, 'Martin', 'Developer', 15000, 15000, 15000, 15000, 15000,
          15000),
      Employee(10006, 'Newberry', 'Developer', 15000, 15000, 15000, 15000,
          15000, 15000),
      Employee(10007, 'Balnc', 'Developer', 15000, 15000, 15000, 15000, 15000,
          15000),
      Employee(10008, 'Perry', 'Developer', 15000, 15000, 15000, 15000, 15000,
          15000),
      Employee(10009, 'Gable', 'Developer', 15000, 15000, 15000, 15000, 15000,
          15000),
      Employee(10010, 'Grimes', 'Developer', 15000, 15000, 15000, 15000, 15000,
          15000),
      Employee(10010, 'Grimes', 'Developer', 15000, 15000, 15000, 15000, 15000,
          15000),
      Employee(10010, 'Grimes', 'Developer', 15000, 15000, 15000, 15000, 15000,
          15000),
      Employee(10010, 'Grimes', 'Developer', 15000, 15000, 15000, 15000, 15000,
          15000)
    ];
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Employee {
  /// Creates the employee class with required details.
  Employee(this.id, this.name, this.designation, this.salary, this.salary1,
      this.salary2, this.salary3, this.salary4, this.salary5);

  /// Id of an employee.
  final int id;

  /// Name of an employee.
  final String name;

  /// Designation of an employee.
  final String designation;

  /// Salary of an employee.
  final int salary;
  final int salary1;
  final int salary2;
  final int salary3;
  final int salary4;
  final int salary5;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(
                  columnName: 'designation', value: e.designation),
              DataGridCell<int>(columnName: 'salary', value: e.salary),
              DataGridCell<int>(columnName: 'salary1', value: e.salary1),
              DataGridCell<int>(columnName: 'salary2', value: e.salary2),
              DataGridCell<int>(columnName: 'salary3', value: e.salary3),
              DataGridCell<int>(columnName: 'salary4', value: e.salary4),
              DataGridCell<int>(columnName: 'salary5', value: e.salary5)
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
