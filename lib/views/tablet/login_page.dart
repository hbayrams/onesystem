import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/models/login_model.dart';
import 'package:onesystem/models/shared_pref_helper.dart';

class LoginPage extends StatelessWidget {
  LoginModel _c = Get.put(LoginModel());
  SharedPrefModel _c2 = Get.put(SharedPrefModel());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(onPressed: () {
            _c.onSavedPassword(_c.password + '1');
            _c2.isRemember=true;
          }),
          Obx(() => Text(_c2.isLogin.toString())),
          Obx(() => Text(_c.isVisible.toString())),
          Obx(() => Text(_c.uname.toString())),
          Obx(() => Text(_c.password.toString())),
        ],
      ),
    );
  }
}
