import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/controllers/database_controller.dart';
import 'package:onesystem/models/globals.dart';
import 'package:onesystem/models/mysql_query.dart';
import 'package:onesystem/views/tablet/widgets/headBox_widget.dart';
import 'package:onesystem/views/tablet/widgets/isoSpoolInfo_widget.dart';

class FitupApprovalWidget extends StatelessWidget {
  const FitupApprovalWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DatabaseController dbc = Get.put(DatabaseController());
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Card(
                        margin: EdgeInsets.all(2),
                        child: Obx(() => Column(
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
                                ])))),
                Expanded(
                    flex: 7,
                    child: Container(
                        child: Column(
                      children: [
                        Expanded(child: IsoSpoolInfoWidget(selectWF: 'fitup')),
                        Expanded(
                            flex: 4,
                            child: Card(
                                margin: EdgeInsets.all(2),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      HeadBoxWidget(title: 'Weld List'),
                                      Container()
                                    ])))
                      ],
                    )))
              ],
            )));
  }

  Future<void> _refreshData(DatabaseController dbc) async {
    print('refreshing data...');
    await dbc.getFileNoSpool(query: MysqlQuery().queryList['getFileNoSpool']);
  }
}
