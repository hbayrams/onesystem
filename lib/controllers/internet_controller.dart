import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:onesystem/views/tablet/widgets/dialog_widget.dart';

class NetController extends GetxController {
  void InternetConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Get.dialog(
        ShowDialogWidget(
          title: 'Exit',
          tbtn1: 'OK',
          tbtn2: 'CANCEL',
          text1: 'Close the application.',
          text2: 'Would you like to approve of this message?',
          onPressed: () => Get,
        ),
        barrierDismissible: false,
      );
    }
  }
}
