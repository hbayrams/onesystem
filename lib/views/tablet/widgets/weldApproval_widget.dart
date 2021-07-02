import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/controllers/database_controller.dart';
import 'package:onesystem/models/datasource.dart';
import 'package:onesystem/models/globals.dart';
import 'package:onesystem/models/mysql_query.dart';
import 'package:onesystem/views/tablet/widgets/datagrid_widget.dart';
import 'package:onesystem/views/tablet/widgets/headBox_widget.dart';
import 'package:onesystem/views/tablet/widgets/isoSpoolInfo_widget.dart';
import 'package:onesystem/views/tablet/widgets/weldEntry_widget.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class WeldApprovalWidget extends StatefulWidget {
  WeldApprovalWidget({Key key}) : super(key: key);

  @override
  _WeldApprovalWidgetState createState() => _WeldApprovalWidgetState();
}

class _WeldApprovalWidgetState extends State<WeldApprovalWidget>
    with AutomaticKeepAliveClientMixin<WeldApprovalWidget> {
  DatabaseController dbc = Get.put(DatabaseController());
  EmployeeDataSource employeeDataSource;
  final DataGridController _dataGridController = DataGridController();
  int selectedIndex;
  dynamic fileno, spoolno, weldno, type = '';

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Obx(() => Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Card(
                            margin: EdgeInsets.all(2),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  HeadBoxWidget(
                                      title:
                                          'Spool Items (${dbc.listForFileSpool.length.toString()})'), //count eklenecek
                                  Expanded(
                                      child: RefreshIndicator(
                                    onRefresh: () => _refreshData(dbc),
                                    child: ListView.separated(
                                      padding: EdgeInsets.all(2),
                                      itemCount: dbc.listForFileSpool.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          onTap: () {
                                            selectedIndex = index;
                                            spoolno = dbc
                                                .listForFileSpool[selectedIndex]
                                                .toString()
                                                .split('-')[1];
                                            fileno = dbc
                                                .listForFileSpool[selectedIndex]
                                                .toString()
                                                .split('-')[0];
                                            gettingWeldCopy(
                                                dbc, fileno, spoolno);
                                          },
                                          tileColor: selectedIndex == index
                                              ? Global.sky_blue
                                              : null,
                                          selectedTileColor: Global.sky_blue,
                                          title: Center(
                                              child: Text(dbc
                                                  .listForFileSpool[index]
                                                  .toString())),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return Divider(height: 1);
                                      },
                                    ),
                                  ))
                                ]))),
                    Expanded(
                        flex: 7,
                        child: Container(
                            child: Column(
                          children: [
                            Expanded(
                                child: IsoSpoolInfoWidget(selectWF: 'weld')),
                            Expanded(
                                flex: 4,
                                child: Card(
                                    margin: EdgeInsets.all(2),
                                    child: dbc.listForWeldCopy.isEmpty
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                                Center(
                                                    child: Icon(
                                                        Icons.view_list_rounded,
                                                        size: 50)),
                                                Text(
                                                    'To see the list, select a file number from the spool search field')
                                              ])
                                        : DataGridWidget(
                                            doubleTapFunc: (value) =>
                                                openWeldEntry(value),
                                            controller: _dataGridController,
                                            colName: Global.listsWeld,
                                            title: 'Weld List',
                                            openDialog: false,
                                            dataSource: employeeDataSource)))
                          ],
                        )))
                  ],
                ))));
  }

  Future<void> _refreshData(DatabaseController dbc) async {
    print('refreshing data...');
    await dbc.getFileNoSpool(query: MysqlQuery().queryList['getFileNoSpool']);
  }

  Future<void> gettingWeldCopy(dbc, fileno, spoolno) async {
    await dbc.getWeldCopy(
        selectWF: 'weld',
        fno: fileno,
        sno: spoolno,
        query: MysqlQuery().queryList['getWeld']);
    print('Yüklenen db buytu: ${dbc.listForWeldCopy.length.toString()}');
    employeeDataSource = EmployeeDataSource(
      employeeData: dbc.listForWeldCopy,
      listForFields: dbc.listForFields,
    );
  }

  Future<void> openWeldEntry(DataGridCellDoubleTapDetails details) async {
    if (details.rowColumnIndex.rowIndex != 0) {
      weldno = dbc.listForWeldCopy[details.rowColumnIndex.rowIndex - 1]['weld']
          .toString();
      type = dbc.listForWeldCopy[details.rowColumnIndex.rowIndex - 1]['type']
          .toString();
      print(spoolno + weldno + type);
      Get.to(WeldEntryWidget(sno: spoolno, wno: weldno, type: type));
    }
  }

  @override
  bool get wantKeepAlive => true;
}
