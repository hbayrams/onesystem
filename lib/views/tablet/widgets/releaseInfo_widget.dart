import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/models/globals.dart';
import 'package:onesystem/views/tablet/widgets/borderedText_widget.dart';

class ReleaseInfo extends StatelessWidget {
  const ReleaseInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 1,
          child: Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 2),
              color: Global.medium,
              child: Text('Spool Release Info',
                  style: TextStyle(color: Global.white))),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Row(
              children: [
                Expanded(
                    flex: 4,
                    child: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BordersText(
                                text: '9100-3-57-CL-032-AA1-TA2',
                                leftmargin: 0),
                            Container(
                              //margin: EdgeInsets.only(right: 30),
                              child: Text('Active',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Global.green)),
                            ),
                            Container(
                                margin: EdgeInsets.only(right: 6),
                                //width: 80,
                                height: Get.height * .04,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Global.dark_red,
                                    ),
                                    onPressed: null,
                                    child: Text('Add Problem',
                                        maxLines: 2,
                                        textAlign: TextAlign.center)))
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Rev.No : '),
                            BordersText(text: '2A', leftmargin: 1),
                            Text('PED Category : '),
                            BordersText(text: '1', leftmargin: 1),
                            Text('Paint Code : '),
                            BordersText(text: 'A.II.B.2-2', leftmargin: 1)
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('View DWG : '),
                            Container(
                                height: Get.height * .04,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Global.medium,
                                    ),
                                    onPressed: () {},
                                    child: Text('See Isometric',
                                        maxLines: 2,
                                        textAlign: TextAlign.center))),
                            Container(
                                margin: EdgeInsets.only(right: 6),
                                height: Get.height * .04,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Global.medium,
                                    ),
                                    onPressed: () {},
                                    child: Text('See Original',
                                        maxLines: 2,
                                        textAlign: TextAlign.center)))
                          ])
                    ])),
                Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: Get.height / 10,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Release Spool',
                              maxLines: 2, textAlign: TextAlign.center)),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  addProblem() {
    Get.defaultDialog(
        barrierDismissible: false,
        title: 'Adding Problem Dialog',
        cancel: ElevatedButton(
            onPressed: () => Get.back(), child: Text('Close Dialog')));
  }
}
