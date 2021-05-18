import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/controllers/database_controller.dart';
import 'package:onesystem/controllers/dataview_controller.dart';
import 'package:onesystem/controllers/theme_controller.dart';
import 'package:onesystem/models/datasource_spoollist.dart';
import 'package:onesystem/models/globals.dart';
import 'package:onesystem/models/spoollist_model.dart';
import 'package:onesystem/views/tablet/widgets/datagrid_widget.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DataviewController dvc = Get.put(DataviewController());

  ThemeController tc = Get.put(ThemeController());

  DatabaseOperations dbc = Get.put(DatabaseOperations());

  List<SpoolListModel> employees = <SpoolListModel>[];

  EmployeeDataSource employeeDataSource;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetX<DataviewController>(
            builder: (_) => Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.all(2),
                                decoration:
                                    BoxDecoration(border: Border.all(width: 1)),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width: Get.width,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Radio(
                                                  value: 0,
                                                  groupValue: dvc.radioValue,
                                                  onChanged: (value) {
                                                    dvc.radioValue = value;
                                                    print("value: $value");
                                                    print('value_getx: ' +
                                                        dvc.radioValue
                                                            .toString());
                                                  },
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: DropdownSearch(
                                                  dropdownSearchDecoration:
                                                      InputDecoration(
                                                          isDense: true,
                                                          isCollapsed: true,
                                                          border:
                                                              InputBorder.none,
                                                          contentPadding:
                                                              EdgeInsets.all(
                                                                  1)),
                                                  popupTitle: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child:
                                                        Text('Select ISO No'),
                                                  ),
                                                  autoValidateMode:
                                                      AutovalidateMode.always,

                                                  showSearchBox: true,
                                                  //label: 'Select File No',
                                                  items: [
                                                    'YASDJAH',
                                                    'OPOFDKOGKD'
                                                  ],
                                                  selectedItem: 'Select ISO No',
                                                  onChanged: print,
                                                  // validator: (String item) {
                                                  //   if (item == null)
                                                  //     return "Required field";
                                                  //   else if (item == "Select File No")
                                                  //     return "Invalid item";
                                                  //   else
                                                  //     return null;
                                                  // },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              child: Radio(
                                                value: 1,
                                                groupValue: dvc.radioValue,
                                                onChanged: (value) {
                                                  dvc.radioValue = value;
                                                  print("value: $value");
                                                  print('value_getx: ' +
                                                      dvc.radioValue
                                                          .toString());
                                                },
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: DropdownSearch(
                                              dropdownSearchDecoration:
                                                  InputDecoration(
                                                      border: InputBorder.none,
                                                      contentPadding:
                                                          EdgeInsets.all(1)),
                                              popupTitle: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text('Select File No'),
                                              ),
                                              autoValidateMode:
                                                  AutovalidateMode.always,
                                              showSearchBox: true,
                                              //label: 'Select File No',
                                              items: ['F00001', 'F00002'],
                                              selectedItem: 'Select File No',
                                              onChanged: (fno) async {
                                                await dbc.getSpool(fno: fno);
                                                employees = dbc.listem2;
                                                print(
                                                    'Yüklenen db buytu: ${dbc.listem2.length.toString()}');
                                                employeeDataSource =
                                                    EmployeeDataSource(
                                                        employeeData:
                                                            employees);
                                              },
                                              // validator: (String item) {
                                              //   if (item == null)
                                              //     return "Required field";
                                              //   else if (item == "Select File No")
                                              //     return "Invalid item";
                                              //   else
                                              //     return null;
                                              // },
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              'Rev. : 1A',
                                              style: TextStyle(
                                                  color: Global.focusedBlue,
                                                  fontWeight: FontWeight.bold),
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
                              flex: 2,
                              child: Container(
                                margin: EdgeInsets.all(2),
                                decoration:
                                    BoxDecoration(border: Border.all(width: 1)),
                                child: Container(
                                  width: Get.width,
                                  color: Colors.blueAccent,
                                  child: Text('üstsol2'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: Get.height,
                          child: dbc.listem2.length < 1
                              ? null
                              : DataGridWidget(
                                  title: 'Spool List',
                                  openDialog: false,
                                  dataSource: employeeDataSource,
                                  tapFunc: (DataGridCellDoubleTapDetails details) {
                                    print(details.rowColumnIndex.toString());
                                  },
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: Get.width,
                    child: dbc.listem2.length < 1
                        ? null
                        : DataGridWidget(
                            title: 'Weld List',
                            openDialog: false,
                            dataSource: employeeDataSource),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
