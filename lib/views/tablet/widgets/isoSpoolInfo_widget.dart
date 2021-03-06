import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:onesystem/controllers/dataview_controller.dart';
import 'package:onesystem/models/globals.dart';
import 'package:onesystem/views/tablet/widgets/borderedText_widget.dart';
import 'package:onesystem/views/tablet/widgets/dropDown_widget.dart';
import 'package:onesystem/views/tablet/widgets/eButton_widget.dart';
import 'package:onesystem/views/tablet/widgets/headBox_widget.dart';

class IsoSpoolInfoWidget extends StatelessWidget {
  final String selectWF;

  const IsoSpoolInfoWidget({
    this.selectWF,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> dropdownItems = {
      'GQC-5': 'Muhammet ÖZTÜRK',
      'GQC-7': 'Hakan İLKAN',
      'GQC-19': 'Hacı Bayram SARIGÖZ',
      'GQC-20': 'Burak KEBAPÇIBAŞ',
      'GQC-28': 'Turay GELEŞ',
      'GQC-31': 'Oğuz KABA'
    };

    DataviewController dvc = Get.put(DataviewController());

    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Card(
                margin: EdgeInsets.all(2),
                child: Column(children: [
                  HeadBoxWidget(title: 'ISO / Spool Info'),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 6,
                              child: Row(children: [
                                Expanded(
                                    flex: 1,
                                    child: Column(children: [
                                      Expanded(
                                          child: Row(children: [
                                        Text('ISO No: '),
                                        BorderedText(
                                            text: '9100-3-57-CL-032-AA1-TA2')
                                      ])),
                                      Expanded(
                                          child: Row(children: [
                                        Text('Spool: '),
                                        BorderedText(text: 'S1', leftmargin: 8),
                                        Text('Active',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Global.green))
                                      ]))
                                    ])),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(children: [
                                      Row(children: [
                                        Text('ISO Rev.: '),
                                        BorderedText(text: '1A', leftmargin: 8),
                                        Text('Active',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Global.green)),
                                        Checkbox(
                                          value: true,
                                          onChanged: (value) {},
                                        ),
                                        Text('Date: '),
                                        Obx(() => BorderedText(
                                            text: selectWF == 'fitup'
                                                ? DateFormat("dd-MM-yyyy")
                                                    .format(DateTime.parse(dvc
                                                        .selectedDate1.value
                                                        .toString()))
                                                : DateFormat("dd-MM-yyyy")
                                                    .format(DateTime.parse(dvc
                                                        .selectedDate2.value
                                                        .toString())),
                                            leftmargin: 8)),
                                        IconButton(
                                            onPressed: () =>
                                                _selectDate(context, dvc),
                                            icon: Icon(Icons.date_range))
                                      ]),
                                      Row(children: [
                                        Text('GQC No: '),
                                        BorderedText(
                                            text: 'GQC-31', leftmargin: 8),
                                        Expanded(
                                            child: DropDownWidget(
                                          title: 'Select Personnel',
                                          enable: true,
                                          mode: Mode.MENU,
                                          select: 'GQC-31',
                                          search: false,
                                          items: dropdownItems.keys.toList(),
                                          changed: (value) {
                                            if (selectWF == 'fitup') {
                                              dvc.dropSelectQ1.value =
                                                  dropdownItems[value];
                                            } else {
                                              dvc.dropSelectQ2.value =
                                                  dropdownItems[value];
                                            }
                                          },
                                        )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 20, right: 50),
                                            child: Obx(() => Text(
                                                selectWF == 'fitup'
                                                    ? dvc.dropSelectQ1.value
                                                    : dvc.dropSelectQ2.value,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))))
                                      ])
                                    ]),
                                  ),
                                )
                              ])),
                          Expanded(
                              flex: 1,
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: EButtonWidget(
                                      color: Global.green,
                                      title: 'Approve',
                                      onClick: () {
                                        print('Kaydediliyor...');
                                      })))
                        ],
                      ),
                    ),
                  )
                ])))
      ],
    );
  }

  Future<void> _selectDate(BuildContext context, DataviewController dvc) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectWF == 'fitup'
            ? dvc.selectedDate1.value
            : dvc.selectedDate2.value,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    if (picked != null) if (selectWF == 'fitup') {
      dvc.selectedDate1.value = picked;
    } else {
      dvc.selectedDate2.value = picked;
    }
  }
}
