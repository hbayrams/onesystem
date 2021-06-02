import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownWidget extends StatelessWidget {
  final String title, select;
  final Function changed;
  final bool enable;
  final List<String> items;

  const DropDownWidget(
      {Key key, this.title, this.select, this.changed, this.enable, this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 22,
      child: DropdownSearch(
        enabled: enable,
        dropdownSearchDecoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10, 0, 5, 0), isDense: true),
        popupTitle: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title),
        ),
        autoValidateMode: AutovalidateMode.always,
        showSearchBox: true,
        autoFocusSearchBox: true,
        items: items,
        //['F00001', 'F00002', 'F00003', 'F00004'],
        //['YASDJAH', 'OPOFDKOGKD'],
        selectedItem: select == null ? title : select,
        onChanged: changed,
        mode: Mode.MENU,
      ),
    );
  }
}
