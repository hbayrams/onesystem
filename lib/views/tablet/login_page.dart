import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/controllers/login_controller.dart';
import 'package:onesystem/controllers/sharpref_controller.dart';
import 'package:onesystem/views/tablet/settings_page.dart';
import 'package:onesystem/views/tablet/widgets/deneme.dart';

class LoginPage extends StatelessWidget {
  LoginController _c = Get.put(LoginController());
  SharedPrefModel _c2 = Get.put(SharedPrefModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Login Page'),
      ),
      body:Container(
      width:Get.width,
      //color: Colors.white70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(onPressed: () {
            _c.onSavedPassword(_c.password + '1');
            _c2.isRemember = true;
            Get.to(DenemePage());
          }),
          Obx(() => Text(_c2.isLogin.toString())),
          Obx(() => Text(_c.isVisible.toString())),
          Obx(() => Text(_c.uname.toString())),
          Obx(() => Text(_c.password.toString())),
          
        ],
      ),
    ),);
  }
}
