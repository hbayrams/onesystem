import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/models/globals.dart';
import 'package:onesystem/views/tablet/widgets/dropdown_widget.dart';
import 'package:onesystem/views/tablet/widgets/headBox_widget.dart';

class SelectRelease extends StatelessWidget {
  const SelectRelease({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Sol-Ust
        Expanded(
            flex: 1,
            child: Card(
              margin: EdgeInsets.all(2),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: HeadBoxWidget(title: 'Select Release'),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
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
                                child: Text('Cancel'),
                                style: ElevatedButton.styleFrom(
                                  primary: Global.medium,
                                ),
                                onPressed: null,
                              ),
                            ),
                          ),
                          // Expanded(
                          //   flex: 1,
                          //   child: Container(
                          //     height: Get.height / 23,
                          //     child: ElevatedButton(
                          //       child: Text('Cancel'),
                          //       style: ElevatedButton.styleFrom(
                          //         primary: Global.dark_red,
                          //       ),
                          //       onPressed: null,
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
        //Sol-Alt
        Expanded(
            flex: 8,
            child: Card(
                margin: EdgeInsets.all(2),
                child: Padding(
                  padding: const EdgeInsets.all(180.0),
                  child: Text('data'),
                ))),
        //   child: dbc.listForSpool.isEmpty
        //       ? Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //               Center(
        //                   child: Icon(Icons.view_list_rounded,
        //                       size: 50)),
        //               Text(
        //                   'To see the list, select a file number from the isometric search field',
        //                   softWrap: true)
        //             ])
        //       : DataGridWidget(
        //           colName: Global.listsSpool,
        //           title: 'Iso-Spool List',
        //           openDialog: false,
        //           dataSource: employeeDataSource1,
        //           tapFunc: (value) => gettingReleaseList(value),
        //         ),
        // ))
      ],
    );
  }
}
