import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class ThemeController extends GetxController {
  final _darkTheme = false.obs;
  GetStorage box = GetStorage();

  bool get darkTheme => _darkTheme.value;
  set darkTheme(bool value) => _darkTheme.value = value;

  @override
  onInit() {
    super.onInit();
    GetStorage box = GetStorage();
    if (box.read("darkTheme") != null) {
      _darkTheme.value = box.read("darkTheme");
    }
  }

  void strwrite(value) {
    box.write('darkTheme', value);
  }
}
