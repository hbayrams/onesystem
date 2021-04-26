import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

class NetController extends GetxController {
  final _checkOnline = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await _internetConnectivity();
  }

  bool get checkOnline => _checkOnline.value;
  set checkOnline(bool value) => _checkOnline.value = value;

  Future _internetConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _checkOnline.value = false;
      print(checkOnline.toString());
    } else {
      _checkOnline.value = true;
      print(checkOnline.toString());
    }
  }
}
