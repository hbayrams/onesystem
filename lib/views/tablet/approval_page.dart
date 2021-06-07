import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/controllers/theme_controller.dart';
import 'package:onesystem/models/globals.dart';
import 'package:onesystem/views/tablet/widgets/fitupApproval_widget.dart';
import 'package:onesystem/views/tablet/widgets/weldApproval_widget.dart';

// ignore: must_be_immutable
class ApprovalPage extends StatelessWidget {
  ThemeController tc = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: tc.isColorChangeDW(),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('OneSystem > Approval Page',
                    style:
                        TextStyle(color: tc.isColorChangeWD(), fontSize: 16)),
                SizedBox(
                    width: 250, child: Divider(color: tc.isColorChangeWD()))
              ],
            ),
            centerTitle: true,
            toolbarHeight: 40,
            bottom: TabBar(
                isScrollable: false,
                indicatorColor: Global.focusedBlue,
                indicatorWeight: 3,
                tabs: [
                  Tab(
                      height: 50,
                      icon: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.design_services,
                                color: tc.isColorChangeWD(), size: 40),
                            SizedBox(width: 10),
                            Text('Fit-UP Approval',
                                style: TextStyle(
                                    color: tc.isColorChangeWD(), fontSize: 14))
                          ])),
                  Tab(
                      height: 50,
                      icon: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.upcoming,
                                color: tc.isColorChangeWD(), size: 40),
                            SizedBox(width: 10),
                            Text('Weld Approval',
                                style: TextStyle(
                                    color: tc.isColorChangeWD(), fontSize: 14))
                          ]))
                ]),
          ),
          body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [FitupApprovalWidget(), WeldApprovalWidget()]),
        ),
      ),
    );
  }
}
