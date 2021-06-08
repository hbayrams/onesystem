import 'package:flutter/material.dart';
import 'package:onesystem/views/tablet/widgets/headBox_widget.dart';

class FitupApprovalWidget extends StatelessWidget {
  const FitupApprovalWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(2.0),
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
                    child: Container(
                        child: Column(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Card(
                                margin: EdgeInsets.all(2),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      HeadBoxWidget(
                                          title:
                                              'ISO / Spool Info'), //count eklenecek
                                      Container()
                                    ]))),
                        Expanded(
                            flex: 4,
                            child: Card(
                                margin: EdgeInsets.all(2),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      HeadBoxWidget(
                                          title: 'Weld List'), //count eklenecek
                                      Container()
                                    ])))
                      ],
                    )))
              ],
            )));
  }
}
