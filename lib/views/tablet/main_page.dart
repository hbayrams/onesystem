import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/controllers/database_controller.dart';
import 'package:onesystem/controllers/dataview_controller.dart';
import 'package:onesystem/controllers/theme_controller.dart';
import 'package:onesystem/models/datasource.dart';
import 'package:onesystem/models/globals.dart';
import 'package:onesystem/models/mysql_query.dart';
import 'package:onesystem/views/tablet/widgets/datagrid_widget.dart';
import 'package:onesystem/views/tablet/widgets/dropdown_widget.dart';
import 'package:onesystem/views/tablet/widgets/isoInfo_widget.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin<MainPage> {
  DataviewController dvc = Get.put(DataviewController());
  ThemeController tc = Get.put(ThemeController());
  DatabaseOperations dbc = Get.put(DatabaseOperations());
  EmployeeDataSource employeeDataSource1, employeeDataSource2;

  dynamic fileno, spoolno = '';

  @override
  void initState() {
    print('MainPage initsate');
    super.initState();
  }

  @override
  void dispose() {
    print('MainPage dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(5.0),
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
                                decoration: getBox(tc),
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
                                                  },
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(right: 5),
                                                alignment: Alignment.centerLeft,
                                                child: DropDownWidget(
                                                  select: fileno,
                                                  enable: dvc.radioValue == 0
                                                      ? true
                                                      : false,
                                                  title: 'Select Iso NO',
                                                  changed: (value) {
                                                    gettingSpool(value);
                                                  },
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
                                                },
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: DropDownWidget(
                                                select: fileno,
                                                enable: dvc.radioValue == 1
                                                    ? true
                                                    : false,
                                                title: 'Select File NO',
                                                changed: (value) =>
                                                    gettingSpool(value)),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0),
                                              child: Text(
                                                'Rev. : 1A',
                                                style: TextStyle(
                                                    color: Global.focusedBlue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
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
                                width: Get.width,
                                margin: EdgeInsets.all(2),
                                padding: EdgeInsets.fromLTRB(15, 20, 5, 5),
                                decoration: getBox(tc),
                                child: ISOInfoWidget(),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.all(2),
                          padding: EdgeInsets.all(5),
                          decoration: getBox(tc),
                          height: Get.height,
                          child: dbc.listForSpool.isEmpty
                              ? null
                              : DataGridWidget(
                                  colName: Global.listsSpool,
                                  title: 'Spool List',
                                  openDialog: false,
                                  dataSource: employeeDataSource1,
                                  tapFunc: (value) => gettingWeld(value),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(2),
                    decoration: getBox(tc),
                    width: Get.width,
                    child: dbc.listForWeld.isEmpty
                        ? null
                        : DataGridWidget(
                            colName: Global.listsWeld,
                            title: 'Weld List',
                            openDialog: false,
                            dataSource: employeeDataSource2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration getBox(ThemeController tc) {
    return BoxDecoration(
      color: tc.isColorChangeDW(),
      borderRadius: BorderRadius.circular(0),
      boxShadow: [
        BoxShadow(
          spreadRadius: -3,
          color: Global.extra_light,
          blurRadius: 5,
        ),
      ],
    );
  }

  Future<void> gettingSpool(fno) async {
    {
      dbc.listForWeld.clear();
      setState(() {
        fileno = fno;
      });
      if (fno != '') {
        await dbc.getSpool(fno: fno, query: MysqlQuery().queryList['getSpool']);
      } else {
        await null;
      }

      print(dbc.listForFields.length.toString() +
          'Yüklenen db buytu: ${dbc.listForSpool.length.toString()}');
      employeeDataSource1 = EmployeeDataSource(
          employeeData: dbc.listForSpool, listForFields: dbc.listForFields);
    }
  }

  Future<void> gettingWeld(DataGridCellTapDetails details) async {
    {
      spoolno = dbc.listForSpool[details.rowColumnIndex.rowIndex - 1]['spool']
          .toString();
      print('Seçilen file-spool: ' +
          fileno.toString() +
          '-' +
          spoolno.toString());
      await dbc.getWeld(
          fno: fileno, sno: spoolno, query: MysqlQuery().queryList['getWeld']);
      print('Yüklenen db buytu: ${dbc.listForWeld.length.toString()}');
      employeeDataSource2 = EmployeeDataSource(
          employeeData: dbc.listForWeld, listForFields: dbc.listForFields);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
