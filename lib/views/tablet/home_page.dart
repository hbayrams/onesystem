import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Row(
          children: [
            RaisedButton(
              child: Text('LoginPage'),
              onPressed: () => Get.toNamed('t/loginPage'),
            ),
            RaisedButton(
              child: Text('ReleasePage'),
              onPressed: () => Get.toNamed('t/releasePage'),
            ),
          ],
        ),
      ),
    );
  }
}
