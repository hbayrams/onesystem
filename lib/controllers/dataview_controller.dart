import 'package:get/get.dart';

class DataviewController extends GetxController {
  final fill_data = false.obs;
  final widget_enabled = false.obs;

  bool get fillData => fill_data.value;
  set fillData(bool value) => fill_data.value = value;

  bool get widgetEnabled => widget_enabled.value;
  set widgetEnabled(bool value) => widget_enabled.value = value;

  widgetFunc() {
    fillData = true;
    print(fillData.toString());
  }
}
