import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:onesystem/models/globals.dart';

class NetController extends GetxController {
  Connectivity _connectivity = new Connectivity();

  final _isOnline = false.obs;

  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    startMonitoring();
  }

  bool get isOnline => _isOnline.value;

  startMonitoring() async {
    _connectivity.onConnectivityChanged.listen((
      ConnectivityResult result,
    ) async {
      if (result == ConnectivityResult.none) {
        _isOnline.value = false;
        netErrorDialog();
        // print('Change Dialog');
      } else {
        await _updateConnectionStatus().then((bool isConnected) {
          _isOnline.value = isConnected;
        });
      }
    });
  }

  Future<void> initConnectivity() async {
    try {
      var status = await _connectivity.checkConnectivity();

      if (status == ConnectivityResult.none) {
        _isOnline.value = false;
        netErrorDialog();
        // print('Init Dialog');
      } else {
        _isOnline.value = true;
      }
    } on PlatformException catch (e) {
      print("PlatformException: " + e.toString());
    }
  }

  Future<bool> _updateConnectionStatus() async {
    bool isConnected;
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
        Get.back();
      }
    } on SocketException catch (_) {
      isConnected = false;
      netErrorDialog();
      // print('Socket Dialog');
    }
    return isConnected;
  }
}

int d = 0;
Future netErrorDialog() async {
  d += 1;
  print('d= ' + d.toString());
  if (NetController().isOnline == false && d == 1) {
    return await Get.defaultDialog(
      onWillPop: () async => false,
      titleStyle: TextStyle(color: Global.dark_red),
      title: 'Connection Error..!',
      middleText:
          'You are not connected to the internet.\n Make sure Wi-Fi is or Mobile Data on, Airplane Mode is Off and try again.',
      barrierDismissible: false,
      // confirm: ElevatedButton(
      //     onPressed: () => Get.back(),
      //     child: Text('OK'),
      //     style: ElevatedButton.styleFrom(primary: Global.dark_red)),
    );
  } else {
    print('patladı AQ');
  }
  d = 0;
}
