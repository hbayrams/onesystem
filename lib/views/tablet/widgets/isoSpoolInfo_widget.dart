import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:onesystem/controllers/dataview_controller.dart';
import 'package:onesystem/models/globals.dart';
import 'package:onesystem/views/tablet/widgets/borderedText_widget.dart';
import 'package:onesystem/views/tablet/widgets/dropdown_widget.dart';
import 'package:onesystem/views/tablet/widgets/ebutton_widget.dart';
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
                  Expanded(
                      flex: 1, child: HeadBoxWidget(title: 'ISO / Spool Info')),
                  Expanded(
                    flex: 4,
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
                                          flex: 1,
                                          child: Row(children: [
                                            Text('ISO No: '),
                                            BorderedText(
                                                text:
                                                    '9100-3-57-CL-032-AA1-TA2',
                                                leftmargin: 0)
                                          ])),
                                      Expanded(
                                          flex: 1,
                                          child: Row(children: [
                                            Text('Spool: '),
                                            BorderedText(
                                                text: 'S1', leftmargin: 8),
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
                                      Expanded(
                                          flex: 1,
                                          child: Row(children: [
                                            Text('ISO Rev.: '),
                                            BorderedText(
                                                text: '1A', leftmargin: 8),
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
                                                text: DateFormat("dd-MM-yyyy")
                                                    .format(DateTime.parse(dvc
                                                        .selectedDate.value
                                                        .toString())),
                                                leftmargin: 8)),
                                            IconButton(
                                                onPressed: () =>
                                                    _selectDate(context, dvc),
                                                icon: Icon(Icons.date_range))
                                          ])),
                                      Expanded(
                                          flex: 1,
                                          child: Row(children: [
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
                                              items:
                                                  dropdownItems.keys.toList(),
                                              changed: (value) {
                                                if (this.selectWF == 'fitup') {
                                                  dvc.dropSelect1.value =
                                                      dropdownItems[value];
                                                } else {
                                                  dvc.dropSelect2.value =
                                                      dropdownItems[value];
                                                }
                                              },
                                            )),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 20, right: 50),
                                                child: Obx(() => Text(
                                                    selectWF == 'fitup'
                                                        ? dvc.dropSelect1.value
                                                        : dvc.dropSelect2.value,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold))))
                                          ]))
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
                                      onClick: () {})))
                        ],
                      ),
                    ),
                  )
                ]))),
        Expanded(
            flex: 4,
            child: Card(
                margin: EdgeInsets.all(2),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HeadBoxWidget(title: 'Weld List'),
                      Container()
                    ])))
      ],
    );
  }

  Future<void> _selectDate(BuildContext context, DataviewController dvc) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: dvc.selectedDate.value,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    if (picked != null && picked != dvc.selectedDate.value)
      dvc.selectedDate.value = picked;
  }
}
