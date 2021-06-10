import 'package:flutter/material.dart';
import 'package:onesystem/views/tablet/widgets/headBox_widget.dart';
import 'package:onesystem/views/tablet/widgets/isoSpoolInfo_widget.dart';

class WeldApprovalWidget extends StatelessWidget {
  const WeldApprovalWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Card(
                        margin: EdgeInsets.all(2),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HeadBoxWidget(
                                  title:
                                      'Spool Items (count*)'), //count eklenecek
                              Container()
                            ]))),
                Expanded(
                    flex: 7,
                    child:
                        Container(child: IsoSpoolInfoWidget(selectWF: 'weld')))
              ],
            )));
  }
}
