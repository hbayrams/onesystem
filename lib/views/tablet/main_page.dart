import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/controllers/dataview_controller.dart';

class MainPage extends StatelessWidget {
  DataviewController dvc = Get.put(DataviewController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetX<DataviewController>(
            builder: (_) => Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      width: Get.width,
                                      //color: Colors.red,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Radio(
                                              value: 0,
                                              groupValue: dvc.radioValue,
                                              onChanged: (value) {
                                                dvc.radioValue = value;
                                                print("value: $value");
                                                print('value_getx: ' +
                                                    dvc.radioValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: DropdownButton<String>(
                                              value: dvc.ddValue,
                                              hint: Text(
                                                'Select List... ',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              onChanged: (String id) {
                                                dvc.ddValue = id;
                                                dvc.widgetEnabled = true;
                                                print("value: $id");
                                                print('value_getx: ' +
                                                    dvc.ddValue);
                                              },
                                              items: [
                                                for (var i = 1; i < 100; i++)
                                                  DropdownMenuItem<String>(
                                                    value: i.toString(),
                                                    child: Text(
                                                      "9100-3-52-CL-036-AB1-TA" +
                                                          i.toString(),
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Radio(
                                            value: 1,
                                            groupValue: dvc.radioValue,
                                            onChanged: (value) {
                                              dvc.radioValue = value;
                                              print("value: $value");
                                              print('value_getx: ' +
                                                  dvc.radioValue.toString());
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: DropdownButton<String>(
                                            value: dvc.ddValue,
                                            hint: Text(
                                              'Select List... ',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            onChanged: (String id) {
                                              dvc.ddValue = id;
                                              dvc.widgetEnabled = true;
                                              print("value: $id");
                                              print(
                                                  'value_getx: ' + dvc.ddValue);
                                            },
                                            items: [
                                              for (var i = 1; i < 100; i++)
                                                DropdownMenuItem<String>(
                                                  value: i.toString(),
                                                  child: Text(
                                                      "0000" + i.toString(),
                                                      style: TextStyle(
                                                          fontSize: 14)),
                                                ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text('Rev. : 1A'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                width: Get.width,
                                color: Colors.blueAccent,
                                child: Text('üstsol2'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: Get.height,
                          color: Colors.green,
                          child: Text('üstsağ'),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: Get.width,
                    color: Colors.amber,
                    child: Text('alt2'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
