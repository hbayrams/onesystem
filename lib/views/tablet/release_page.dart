import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/controllers/database_controller.dart';
import 'package:onesystem/controllers/dataview_controller.dart';
import 'package:onesystem/controllers/theme_controller.dart';
import 'package:onesystem/models/datasource.dart';
import 'package:onesystem/models/globals.dart';
import 'package:onesystem/views/tablet/widgets/headBox_widget.dart';
import 'package:onesystem/views/tablet/widgets/releaseInfo_widget.dart';
import 'package:onesystem/views/tablet/widgets/selectRelease_widget.dart';

class ReleasePage extends StatefulWidget {
  @override
  _ReleasePageState createState() => _ReleasePageState();
}

class _ReleasePageState extends State<ReleasePage>
    with AutomaticKeepAliveClientMixin<ReleasePage> {
  DataviewController dvc = Get.put(DataviewController());
  ThemeController tc = Get.put(ThemeController());
  DatabaseController dbc = Get.put(DatabaseController());
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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            backgroundColor: tc.isColorChangeDW(),
            centerTitle: true,
            title: Text('OneSystem > Release Page',
                style: TextStyle(color: tc.isColorChangeWD(), fontSize: 16)),
            toolbarHeight: 25),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(children: [
            //Sol kolon
            Expanded(
              flex: 2,
              child:
                  //Sol kolonu 2 ye böl...
                  SelectRelease(),
            ),
            //Orta kolon
            Expanded(
              flex: 4,
              child:
                  //Orta kolonu 2 ye böl...
                  Column(
                children: [
                  //Orta-Ust
                  Expanded(
                      flex: 2,
                      child: Card(
                        margin: EdgeInsets.all(2),
                        child: ReleaseInfo(),
                      )),
                  //Orta-Alt
                  Expanded(
                      flex: 7,
                      child: Card(
                          margin: EdgeInsets.all(2),
                          child: Container(
                              width: double.infinity, child: Text('Orta-Alt'))))
                ],
              ),
            ),
            //Sağ kolon
            Expanded(
              flex: 2,
              child:
                  //Sağ kolonu 2 ye böl...
                  Column(
                children: [
                  //Sağ-Ust
                  Expanded(
                      flex: 4,
                      child: Card(
                          margin: EdgeInsets.all(2),
                          child: Container(
                              width: double.infinity, child: Text('Sağ-Ust')))),
                  //Sağ-Alt
                  Expanded(
                      flex: 1,
                      child: Card(
                        margin: EdgeInsets.all(2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            HeadBoxWidget(title: 'Change Released Condition'),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(right: 5),
                                    height: Get.height / 13,
                                    width: Get.width / 10,
                                    child: ElevatedButton(
                                      child: Text('Release'),
                                      style: ElevatedButton.styleFrom(
                                        primary: Global.medium,
                                      ),
                                      onPressed: () {},
                                    )),
                                Container(
                                    height: Get.height / 13,
                                    width: Get.width / 10,
                                    child: ElevatedButton(
                                        child: Text('Cancel Release',
                                            textAlign: TextAlign.center),
                                        style: ElevatedButton.styleFrom(
                                          primary: Global.dark_red,
                                        ),
                                        onPressed: null))
                              ],
                            ))
                          ],
                        ),
                      ))
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  gettingReleaseList(value) {}
}
