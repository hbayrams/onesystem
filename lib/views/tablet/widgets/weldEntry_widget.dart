import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:onesystem/controllers/dataview_controller.dart';
import 'package:onesystem/controllers/theme_controller.dart';
import 'package:onesystem/models/globals.dart';
import 'package:onesystem/views/tablet/widgets/borderedContainer_widget.dart';
import 'package:onesystem/views/tablet/widgets/borderedText_widget.dart';
import 'package:onesystem/views/tablet/widgets/dropDown_widget.dart';
import 'package:onesystem/views/tablet/widgets/eButton_widget.dart';
import 'package:onesystem/views/tablet/widgets/headBox_widget.dart';

class WeldEntryWidget extends StatefulWidget {
  const WeldEntryWidget({Key key}) : super(key: key);

  @override
  _WeldEntryWidgetState createState() => _WeldEntryWidgetState();
}

class _WeldEntryWidgetState extends State<WeldEntryWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    List<String> dropdownItems = [];
    for (var i = 0; i < 100; i++)
      if (i < 10) {
        dropdownItems.add('E-00$i');
      } else {
        dropdownItems.add('E-0$i');
      }

    ThemeController tc = Get.put(ThemeController());
    DataviewController dvc = Get.put(DataviewController());
    //String dragText = '';

    return WillPopScope(
      onWillPop: () async {
        dvc.selectWelderC1.value = false;
        dvc.selectWelderC2.value = false;
        dvc.selectWelderR1.value = false;
        dvc.selectWelderR2.value = false;
        dvc.dragText.value = '';
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: tc.isColorChangeWD(),
          ),
          backgroundColor: tc.isColorChangeDW(),
          centerTitle: true,
          title: Text('OneSystem > Weld Entry',
              style: TextStyle(fontSize: 16, color: tc.isColorChangeWD())),
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Card(
                            child: Column(children: [
                          HeadBoxWidget(title: 'Weld Info'),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(children: [
                                          Text('Spool No :'),
                                          BorderedText(
                                              text: '2  ', leftmargin: 8),
                                          Checkbox(
                                              value: true,
                                              onChanged: (value) {}),
                                          Text('Date'),
                                          Obx(() => BorderedText(
                                              leftmargin: 8,
                                              text: DateFormat("dd-MM-yyyy")
                                                  .format(DateTime.parse(dvc
                                                      .selectedDate4.value
                                                      .toString())))),
                                          IconButton(
                                              onPressed: () =>
                                                  _selectDate(context, dvc),
                                              icon: Icon(Icons.date_range)),
                                          SizedBox(
                                            width: 120,
                                            child: DropDownWidget(
                                              title: 'Select Team',
                                              enable: true,
                                              mode: Mode.MENU,
                                              select: 'E-050',
                                              search: false,
                                              items: dropdownItems,
                                              changed: (value) {
                                                dvc.dropSelectT2.value = value;
                                              },
                                            ),
                                          ),
                                        ]),
                                      )),
                                      Expanded(
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Row(children: [
                                                Text('Weld No :'),
                                                BorderedText(
                                                    text: '1  ', leftmargin: 8),
                                                Text('Weld Type :'),
                                                BorderedText(
                                                    text: 'SW  ', leftmargin: 8)
                                              ]))),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: DragTarget(builder: (context,
                                      List<String> candidateData,
                                      rejectedData) {
                                    print(candidateData);
                                    return BorderedContainer(
                                        text:
                                            'If all welders are the same, drag them here');
                                  }, onWillAccept: (data) {
                                    return true;
                                  }, onAccept: (data) {
                                    dvc.dragText.value = data;
                                  }),
                                )
                              ],
                            ),
                          )
                        ])),
                      ),
                      Expanded(
                        flex: 4,
                        child: Card(
                            child: Container(
                                width: Get.width,
                                child: Obx(() => Column(
                                      children: [
                                        HeadBoxWidget(title: 'Welder Info'),
                                        Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Row(children: [
                                                Expanded(
                                                    child: Text('WPS: ',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                                Expanded(
                                                    flex: 3,
                                                    child: InkWell(
                                                      onTap: () {
                                                        dvc.selectWPS.value =
                                                            true;
                                                        dvc.selectWelderC1
                                                            .value = false;
                                                        dvc.selectWelderC2
                                                            .value = false;
                                                        dvc.selectWelderR1
                                                            .value = false;
                                                        dvc.selectWelderR2
                                                            .value = false;
                                                      },
                                                      child: BorderedContainer(
                                                          color: dvc.selectWPS
                                                                  .value
                                                              ? Global
                                                                  .light_green
                                                              : Colors
                                                                  .transparent,
                                                          text: 'GT-P010',
                                                          height:
                                                              double.infinity),
                                                    )),
                                                Expanded(
                                                    flex: 3,
                                                    child: BorderedContainer(
                                                        text: ' 141 ',
                                                        height:
                                                            double.infinity))
                                              ]),
                                            )),
                                        Expanded(
                                            flex: 3,
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Row(children: [
                                                  Expanded(
                                                      child: Text('Root: ',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                                  Expanded(
                                                      flex: 3,
                                                      child: InkWell(
                                                        onTap: () {
                                                          dvc.selectWelderR1
                                                              .value = true;
                                                          dvc.selectWPS.value =
                                                              false;
                                                          dvc.selectWelderC1
                                                              .value = false;
                                                          dvc.selectWelderC2
                                                              .value = false;
                                                          dvc.selectWelderR2
                                                              .value = false;
                                                        },
                                                        child: BorderedContainer(
                                                            color: dvc
                                                                    .selectWelderR1
                                                                    .value
                                                                ? Global
                                                                    .light_green
                                                                : Colors
                                                                    .transparent,
                                                            text: dvc
                                                                .dragText.value,
                                                            height: double
                                                                .infinity),
                                                      )),
                                                  Expanded(
                                                      flex: 3,
                                                      child: InkWell(
                                                        onTap: () {
                                                          dvc.selectWelderR2
                                                              .value = true;
                                                          dvc.selectWPS.value =
                                                              false;
                                                          dvc.selectWelderC1
                                                              .value = false;
                                                          dvc.selectWelderC2
                                                              .value = false;
                                                          dvc.selectWelderR1
                                                              .value = false;
                                                        },
                                                        child: BorderedContainer(
                                                            color: dvc
                                                                    .selectWelderR2
                                                                    .value
                                                                ? Global
                                                                    .light_green
                                                                : Colors
                                                                    .transparent,
                                                            text: dvc
                                                                .dragText.value,
                                                            height: double
                                                                .infinity),
                                                      ))
                                                ]))),
                                        Expanded(
                                            flex: 3,
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Row(children: [
                                                  Expanded(
                                                      child: Text('Cap: ',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                                  Expanded(
                                                    flex: 3,
                                                    child: InkWell(
                                                        onTap: () {
                                                          dvc.selectWelderC1
                                                              .value = true;
                                                          dvc.selectWPS.value =
                                                              false;
                                                          dvc.selectWelderC2
                                                              .value = false;
                                                          dvc.selectWelderR1
                                                              .value = false;
                                                          dvc.selectWelderR2
                                                              .value = false;
                                                        },
                                                        child: BorderedContainer(
                                                            color: dvc
                                                                    .selectWelderC1
                                                                    .value
                                                                ? Global
                                                                    .light_green
                                                                : Colors
                                                                    .transparent,
                                                            text: dvc
                                                                .dragText.value,
                                                            height: double
                                                                .infinity)),
                                                  ),
                                                  Expanded(
                                                      flex: 3,
                                                      child: InkWell(
                                                          onTap: () {
                                                            dvc.selectWelderC2
                                                                .value = true;
                                                            dvc.selectWelderC1
                                                                .value = false;
                                                            dvc.selectWPS
                                                                .value = false;
                                                            dvc.selectWelderR1
                                                                .value = false;
                                                            dvc.selectWelderR2
                                                                .value = false;
                                                          },
                                                          child: BorderedContainer(
                                                              color: dvc
                                                                      .selectWelderC2
                                                                      .value
                                                                  ? Global
                                                                      .light_green
                                                                  : Colors
                                                                      .transparent,
                                                              text: dvc.dragText
                                                                  .value,
                                                              height: double
                                                                  .infinity)))
                                                ]))),
                                        Expanded(
                                            flex: 1,
                                            child: Row(children: [
                                              Expanded(
                                                  child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8),
                                                child: EButtonWidget(
                                                    onClick: () {},
                                                    color: Global.dark_red,
                                                    title: 'Clean',
                                                    tcolor: Global.white),
                                              )),
                                              Expanded(
                                                  flex: 6,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 8),
                                                    child: EButtonWidget(
                                                        onClick: () {
                                                          //Veriyi kaydettikten sonra değisken icindeki bilgiyi sil...
                                                          dvc.dragText.value =
                                                              '';
                                                          Get.back();
                                                        },
                                                        color: Global.medium,
                                                        title: 'Save',
                                                        tcolor: Global.white),
                                                  ))
                                            ])),
                                      ],
                                    )))),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Card(
                      child: Container(
                          height: Get.height,
                          child: Column(
                            children: [
                              HeadBoxWidget(title: 'WPS'),
                              Expanded(child: Text('WPS Data')),
                            ],
                          )))),
              Expanded(
                  flex: 1,
                  child: Card(
                      child: Container(
                          height: Get.height,
                          child: Column(
                            children: [
                              HeadBoxWidget(title: 'Welder'),
                              Expanded(
                                  child: Draggable(
                                      data: 'GMT-001',
                                      feedback: Text('GMT-001',
                                          style: TextStyle(
                                              color: Global.focusedBlue)),
                                      child: Text('GMT-001'))),
                            ],
                          ))))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, DataviewController dvc) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: dvc.selectedDate4.value,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    if (picked != null) dvc.selectedDate4.value = picked;
  }
}
