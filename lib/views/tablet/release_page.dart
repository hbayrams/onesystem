import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/controllers/dataview_controller.dart';
import 'package:onesystem/controllers/theme_controller.dart';
import 'package:onesystem/views/tablet/widgets/spooldatagrid_widget.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReleasePage extends StatefulWidget {
  @override
  _ReleasePageState createState() => _ReleasePageState();
}

class _ReleasePageState extends State<ReleasePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DataviewController dvc = Get.put(DataviewController());
    ThemeController tc = Get.put(ThemeController());
    return SafeArea(
      child: Scaffold(
        body: GetX<DataviewController>(
          builder: (_) => Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: double.infinity,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: DropdownButton<String>(
                                  value: dvc.ddValue,
                                  hint: Text(
                                    'Select List... ',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  onChanged: (String value) {
                                    dvc.ddValue = value;
                                    dvc.widgetEnabled = true;
                                    print("value: $value");
                                    print('value_getx: ' + dvc.ddValue);
                                  },
                                  items: [
                                    for (var i = 1; i < 10; i++)
                                      DropdownMenuItem<String>(
                                        value: i.toString(),
                                        child: Text(
                                          "RL-0000" + i.toString(),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 2,
                                child: RaisedButton(
                                  onPressed:
                                      dvc.widgetEnabled ? dvc.widgetFunc : null,
                                  child: Text('Select'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  height: double.infinity,
                  //color: Colors.amber,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text('Orta 1-1'),
                      ),
                      Expanded(
                        flex: 7,
                        child: SpoolDataGridWidget(
                            title: 'Weld Info', openDialog: false),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: double.infinity,
                  //color: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RaisedButton(
                              onPressed: null,
                              child: Text('Release'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            RaisedButton(
                              onPressed: null,
                              child: Text('Cancel'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
