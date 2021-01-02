import 'package:flutter/material.dart';
import 'package:onesystem/views/tablet/widgets/tabletcontent_widget.dart';
import 'package:onesystem/views/tablet/widgets/tabletnav_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePageTablet extends StatelessWidget {
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
                  TabletVerticalNavWidget(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: BodyContentTabletWidget(
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
