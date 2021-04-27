import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/controllers/internet_controller.dart';
import 'package:onesystem/views/tablet/widgets/tabletcontent_widget2.dart';
import 'package:onesystem/views/tablet/widgets/tabletnav_widget2.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePageTablet extends StatelessWidget {
  NetController nc = Get.put(NetController());
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (_, sizingInformation) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              child: Row(
                children: [
                  //TabletVerticalNavWidget(),
                  TabNavWidget(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: BodyContentTabletWidget2(
                        sizingInformation: sizingInformation,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
