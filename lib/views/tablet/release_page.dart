import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/controllers/dataview_controller.dart';
import 'package:onesystem/controllers/theme_controller.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReleasePage extends StatefulWidget {
  @override
  _ReleasePageState createState() => _ReleasePageState();
}

final List<Employee> _employees = <Employee>[];

final EmployeeDataSource _employeeDataSource = EmployeeDataSource();

class _ReleasePageState extends State<ReleasePage> {
  @override
  void initState() {
    super.initState();
    populateData();
  }

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
                      //Expanded(
                      //flex: 9,
                      // child: ListView(
                      //   children: <Widget>[
                      //     Card(
                      //       child: DataTable(
                      //         //sortAscending: sort,
                      //         dividerThickness: 2,
                      //         sortColumnIndex: 1,
                      //         dataRowHeight: 30,
                      //         columns: [
                      //           DataColumn(
                      //             label: Text("Spool",
                      //                 style: TextStyle(fontSize: 15)),
                      //             numeric: false,
                      //           ),
                      //           DataColumn(
                      //             label: Text("Condition",
                      //                 style: TextStyle(fontSize: 15)),
                      //             numeric: false,
                      //           ),
                      //         ],
                      //         rows: [
                      //           for (var i = 50; i < 150; i++)
                      //             DataRow(
                      //                 //selected: selectedAvengers.contains(avenger),
                      //                 cells: [
                      //                   DataCell(
                      //                     Text('V' + i.toString()),
                      //                     onTap: dvc.widgetFunc1,
                      //                   ),
                      //                   DataCell(
                      //                     Text('-'),
                      //                     onTap: dvc.widgetFunc1,
                      //                   ),
                      //                 ]),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      //),
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
                        child: SfDataGrid(isScrollbarAlwaysShown:true,
                          source: _employeeDataSource,
                          columns: <GridColumn>[
                            GridNumericColumn(
                                mappingName: 'id', headerText: 'ID'),
                            GridTextColumn(
                                mappingName: 'name', headerText: 'Name'),
                            GridTextColumn(
                                mappingName: 'designation',
                                headerText: 'Designation'),
                            GridNumericColumn(
                                mappingName: 'salary', headerText: 'Salary'),
                            GridNumericColumn(
                                mappingName: 'salary', headerText: 'Salary'),
                            GridNumericColumn(
                                mappingName: 'salary', headerText: 'Salary'),
                            GridNumericColumn(
                                mappingName: 'salary', headerText: 'Salary'),
                            GridNumericColumn(
                                mappingName: 'salary', headerText: 'Salary'),
                            GridNumericColumn(
                                mappingName: 'salary', headerText: 'Salary'),
                            GridNumericColumn(
                                mappingName: 'salary', headerText: 'Salary'),
                            GridNumericColumn(
                                mappingName: 'salary', headerText: 'Salary'),
                          ],
                        ),
                        //ListView(
                        //     scrollDirection: Axis.horizontal,
                        //     children: <Widget>[
                        //       Card(
                        //         child: SingleChildScrollView(
                        //           child: DataTable(
                        //             dataTextStyle: (TextStyle(
                        //               fontSize: 16,
                        //               color: tc.isColorChangeWD(),
                        //             )),
                        //             //sortAscending: sort,
                        //             dividerThickness: 2,
                        //             sortColumnIndex: 1,
                        //             dataRowHeight: 30,
                        //             columns: [
                        //               DataColumn(
                        //                 label: Text("Spool",
                        //                     style: TextStyle(fontSize: 12)),
                        //                 numeric: false,
                        //               ),
                        //               DataColumn(
                        //                 label: Text("Joint",
                        //                     style: TextStyle(fontSize: 12)),
                        //                 numeric: false,
                        //               ),
                        //               DataColumn(
                        //                 label: Text("Spool",
                        //                     style: TextStyle(fontSize: 12)),
                        //                 numeric: false,
                        //               ),
                        //               DataColumn(
                        //                 label: Text("Joint",
                        //                     style: TextStyle(fontSize: 12)),
                        //                 numeric: false,
                        //               ),
                        //               DataColumn(
                        //                 label: Text("Item-1",
                        //                     style: TextStyle(fontSize: 12)),
                        //                 numeric: false,
                        //               ),
                        //               DataColumn(
                        //                 label: Text("Heat-1",
                        //                     style: TextStyle(fontSize: 12)),
                        //                 numeric: false,
                        //               ),
                        //               DataColumn(
                        //                 label: Text("Item-2",
                        //                     style: TextStyle(fontSize: 12)),
                        //                 numeric: false,
                        //               ),
                        //               DataColumn(
                        //                 label: Text("Heat-2",
                        //                     style: TextStyle(fontSize: 12)),
                        //                 numeric: false,
                        //               ),
                        //               DataColumn(
                        //                 label: Text("FitUpDate",
                        //                     style: TextStyle(fontSize: 12)),
                        //                 numeric: false,
                        //               ),
                        //               DataColumn(
                        //                 label: Text("Test",
                        //                     style: TextStyle(fontSize: 12)),
                        //                 numeric: false,
                        //               ),
                        //             ],
                        //             rows: [
                        //               for (var i = 0; i < 20; i++)
                        //                 DataRow(
                        //                     //selected: selectedAvengers.contains(avenger),
                        //                     cells: [
                        //                       DataCell(
                        //                         Text(dvc.fillData1 ? 'S1' : ''),
                        //                       ),
                        //                       DataCell(
                        //                         Text(dvc.fillData1
                        //                             ? i.toString()
                        //                             : ''),
                        //                       ),
                        //                       DataCell(
                        //                         Text(dvc.fillData1 ? 'S1' : ''),
                        //                       ),
                        //                       DataCell(
                        //                         Text(dvc.fillData1
                        //                             ? i.toString()
                        //                             : ''),
                        //                       ),
                        //                       DataCell(
                        //                         Text(dvc.fillData1 ? 'S1' : ''),
                        //                       ),
                        //                       DataCell(
                        //                         Text(dvc.fillData1
                        //                             ? i.toString()
                        //                             : ''),
                        //                       ),
                        //                       DataCell(
                        //                         Text(dvc.fillData1 ? 'S1' : ''),
                        //                       ),
                        //                       DataCell(
                        //                         Text(dvc.fillData1
                        //                             ? i.toString()
                        //                             : ''),
                        //                       ),
                        //                       DataCell(
                        //                         Text(dvc.fillData1 ? 'S1' : ''),
                        //                       ),
                        //                       DataCell(
                        //                         Text(dvc.fillData1
                        //                             ? i.toString()
                        //                             : ''),
                        //                       ),
                        //                     ]),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
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
                      // Expanded(
                      //   flex: 9,
                      //   child: ListView(
                      //     children: <Widget>[
                      //       Card(
                      //         child: DataTable(
                      //           //sortAscending: sort,
                      //           dividerThickness: 2,
                      //           sortColumnIndex: 1,
                      //           dataRowHeight: 30,
                      //           columns: [
                      //             DataColumn(
                      //               label: Text("Spool",
                      //                   style: TextStyle(fontSize: 15)),
                      //               numeric: false,
                      //             ),
                      //             DataColumn(
                      //               label: Text("State",
                      //                   style: TextStyle(fontSize: 15)),
                      //               numeric: false,
                      //             ),
                      //           ],
                      //           rows: [
                      //             for (var i = 0; i < 50; i++)
                      //               DataRow(
                      //                   //selected: selectedAvengers.contains(avenger),
                      //                   cells: [
                      //                     DataCell(
                      //                       Text(dvc.fillData
                      //                           ? 'V' + i.toString()
                      //                           : ''),
                      //                     ),
                      //                     DataCell(
                      //                       Text(dvc.fillData ? '-' : ''),
                      //                     ),
                      //                   ]),
                      //           ],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
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

void populateData() {
  _employees.add(Employee(10001, 'James', 'Project Lead', 20000, 20000, 20000,
      20000, 20000, 20000, 20000, 20000));
  _employees.add(Employee(10002, 'Kathryn', 'Manager', 30000, 20000, 20000,
      20000, 20000, 20000, 20000, 20000));
  _employees.add(Employee(10003, 'Lara', 'Developer', 15000, 20000, 20000,
      20000, 20000, 20000, 20000, 20000));
  _employees.add(Employee(10004, 'Michael', 'Designer', 15000, 20000, 20000,
      20000, 20000, 20000, 20000, 20000));
  _employees.add(Employee(10005, 'Martin', 'Developer', 15000, 20000, 20000,
      20000, 20000, 20000, 20000, 20000));
  _employees.add(Employee(10006, 'Newberry', 'Developer', 15000, 20000, 20000,
      20000, 20000, 20000, 20000, 20000));
  _employees.add(Employee(10007, 'Balnc', 'Developer', 15000, 20000, 20000,
      20000, 20000, 20000, 20000, 20000));
  _employees.add(Employee(10008, 'Perry', 'Developer', 15000, 20000, 20000,
      20000, 20000, 20000, 20000, 20000));
  _employees.add(Employee(10009, 'Gable', 'Developer', 15000, 20000, 20000,
      20000, 20000, 20000, 20000, 20000));
  _employees.add(Employee(10010, 'Grimes', 'Developer', 15000, 20000, 20000,
      20000, 20000, 20000, 20000, 20000));
  _employees.add(Employee(10001, 'James', 'Project Lead', 20000, 20000, 20000,
      20000, 20000, 20000, 20000, 20000));
  _employees.add(Employee(10002, 'Kathryn', 'Manager', 30000, 20000, 20000,
      20000, 20000, 20000, 20000, 20000));
  _employees.add(Employee(10003, 'Lara', 'Developer', 15000, 20000, 20000,
      20000, 20000, 20000, 20000, 20000));
  _employees.add(Employee(10004, 'Michael', 'Designer', 15000, 20000, 20000,
      20000, 20000, 20000, 20000, 20000));
  _employees.add(Employee(10005, 'Martin', 'Developer', 15000, 20000, 20000,
      20000, 20000, 20000, 20000, 20000));
  _employees.add(Employee(10006, 'Newberry', 'Developer', 15000, 20000, 20000,
      20000, 20000, 20000, 20000, 20000));
  _employees.add(Employee(10007, 'Balnc', 'Developer', 15000, 20000, 20000,
      20000, 20000, 20000, 20000, 20000));
  _employees.add(Employee(10008, 'Perry', 'Developer', 15000, 20000, 20000,
      20000, 20000, 20000, 20000, 20000));
  _employees.add(Employee(10009, 'Gable', 'Developer', 15000, 20000, 20000,
      20000, 20000, 20000, 20000, 20000));
  _employees.add(Employee(10010, 'Grimes', 'Developer', 15000, 20000, 20000,
      20000, 20000, 20000, 20000, 20000));
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Employee {
  /// Creates the employee class with required details.
  Employee(
      this.id,
      this.name,
      this.designation,
      this.salary,
      this.salary2,
      this.salary3,
      this.salary4,
      this.salary5,
      this.salary6,
      this.salary7,
      this.salary8);

  /// Id of an employee.
  final int id;

  /// Name of an employee.
  final String name;

  /// Designation of an employee.
  final String designation;

  /// Salary of an employee.
  final int salary;

  /// Salary of an employee.
  final int salary2;

  /// Salary of an employee.
  final int salary3;

  /// Salary of an employee.
  final int salary4;

  /// Salary of an employee.
  final int salary5;

  /// Salary of an employee.
  final int salary6;

  /// Salary of an employee.
  final int salary7;

  /// Salary of an employee.
  final int salary8;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource<Employee> {
  @override
  List<Employee> get dataSource => _employees;

  @override
  Object getValue(Employee employee, String columnName) {
    switch (columnName) {
      case 'id':
        return employee.id;
        break;
      case 'name':
        return employee.name;
        break;
      case 'salary':
        return employee.salary;
        break;
      case 'designation':
        return employee.designation;
        break;
      default:
        return ' ';
        break;
    }
  }
}
