import 'package:get/get.dart';

class DataviewController extends GetxController {
  // ignore: non_constant_identifier_names
  final fill_data = false.obs;
  // ignore: non_constant_identifier_names
  final fill_data1 = false.obs;
  // ignore: non_constant_identifier_names
  final widget_enabled = false.obs;
  // ignore: non_constant_identifier_names
  final dd_value = '1'.obs;
  final _radioValue = 1.obs;
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final dropSelect1 = 'Oğuz KABA'.obs;
  final dropSelect2 = 'Oğuz KABA'.obs;

  bool get fillData => fill_data.value;
  set fillData(bool value) => fill_data.value = value;

  bool get fillData1 => fill_data1.value;
  set fillData1(bool value) => fill_data1.value = value;

  String get ddValue => dd_value.value;
  set ddValue(String value) => dd_value.value = value;

  bool get widgetEnabled => widget_enabled.value;
  set widgetEnabled(bool value) => widget_enabled.value = value;

  int get radioValue => _radioValue.value;
  set radioValue(int value) => _radioValue.value = value;

  widgetFunc() {
    fillData = true;
    print(fillData.toString());
  }

  widgetFunc1() {
    fillData1 = true;
    print(fillData1.toString());
  }

  radioFunction(int value) {
    radioValue = value;
    switch (radioValue) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
    }
  }
}
