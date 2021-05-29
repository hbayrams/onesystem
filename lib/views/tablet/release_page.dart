import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/controllers/database_controller.dart';
import 'package:onesystem/controllers/dataview_controller.dart';
import 'package:onesystem/controllers/theme_controller.dart';
import 'package:onesystem/models/datasource.dart';
import 'package:onesystem/models/globals.dart';
import 'package:onesystem/views/tablet/widgets/dropdown_widget.dart';

class ReleasePage extends StatefulWidget {
  @override
  _ReleasePageState createState() => _ReleasePageState();
}

class _ReleasePageState extends State<ReleasePage>
    with AutomaticKeepAliveClientMixin<ReleasePage> {
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
                  Column(
                children: [
                  //Sol-Ust
                  Expanded(
                      flex: 1,
                      child: getBox(
                          tc,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 5),
                                    child: DropDownWidget(
                                        enable: true, title: 'Select List'),
                                  )),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.only(right: 5),
                                  height: Get.height / 23,
                                  child: ElevatedButton(
                                    child: Text('Select'),
                                    style: ElevatedButton.styleFrom(
                                      primary: Global.medium,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: Get.height / 23,
                                  child: ElevatedButton(
                                    child: Text('Cancel'),
                                    style: ElevatedButton.styleFrom(
                                      primary: Global.dark_red,
                                    ),
                                    onPressed: null,
                                  ),
                                ),
                              )
                            ],
                          ))),
                  //Sol-Alt
                  Expanded(flex: 10, child: getBox(tc, Text('Sol-Alt'))),
                ],
              ),
            ),
            //Orta kolon
            Expanded(
              flex: 3,
              child:
                  //Orta kolonu 2 ye böl...
                  Column(
                children: [
                  //Orta-Ust
                  Expanded(flex: 1, child: getBox(tc, Text('Orta-Ust'))),
                  //Orta-Alt
                  Expanded(flex: 4, child: getBox(tc, Text('Orta-Alt')))
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
                  Expanded(flex: 4, child: getBox(tc, Text('Sağ-Ust'))),
                  //Sağ-Alt
                  Expanded(
                      flex: 1,
                      child: getBox(
                          tc,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                height: Get.height / 13,
                                width: Get.width / 10,
                                child: ElevatedButton(
                                  child: Text('Select'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Global.medium,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              Container(
                                height: Get.height / 13,
                                width: Get.width / 10,
                                child: ElevatedButton(
                                  child: Text('Cancel'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Global.dark_red,
                                  ),
                                  onPressed: null,
                                ),
                              )
                            ],
                          )))
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  Container getBox(ThemeController tc, Widget child) {
    return Container(
      width: Get.width,
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.all(5),
      child: child,
      decoration: BoxDecoration(
        color: tc.isColorChangeDW(),
        borderRadius: BorderRadius.circular(0),
        boxShadow: [
          BoxShadow(
            spreadRadius: -3,
            color: Global.extra_light,
            blurRadius: 5,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
