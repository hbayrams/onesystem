import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/controllers/dataview_controller.dart';
import 'package:onesystem/controllers/theme_controller.dart';
import 'package:onesystem/models/globals.dart';
import 'package:onesystem/views/tablet/widgets/fitupApproval_widget.dart';
import 'package:onesystem/views/tablet/widgets/weldApproval_widget.dart';

// ignore: must_be_immutable
class ApprovalPage extends StatefulWidget {
  @override
  _ApprovalPageState createState() => _ApprovalPageState();
}

class _ApprovalPageState extends State<ApprovalPage>
    with AutomaticKeepAliveClientMixin<ApprovalPage> {
  ThemeController tc = Get.put(ThemeController());
  DataviewController dvc = Get.put(DataviewController());

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      initialIndex: 0,
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
            toolbarHeight: 93,
            bottom: PreferredSize(
              preferredSize: Size(Get.width, 50),
              child: TabBar(
                  labelColor: Global.focusedBlue,
                  unselectedLabelColor: Colors.black26,
                  isScrollable: false,
                  indicatorColor: Global.focusedBlue,
                  indicatorWeight: 3,
                  tabs: [
                    Tab(
                        icon: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Icon(Icons.design_services, size: 30),
                          SizedBox(width: 10),
                          Text('Fit-UP Approval',
                              style: TextStyle(fontSize: 14))
                        ])),
                    Tab(
                        //height: 50,
                        icon: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Icon(Icons.upcoming, size: 30),
                          SizedBox(width: 10),
                          Text('Weld Approval', style: TextStyle(fontSize: 14))
                        ]))
                  ]),
            ),
          ),
          body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [FitupApprovalWidget(), WeldApprovalWidget()]),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
