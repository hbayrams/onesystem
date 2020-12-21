import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/models/globals.dart';

class RButtonWidget extends StatelessWidget {
  final String title;
  final Color color;
  final Function onClick;

  const RButtonWidget({Key key, this.title, this.color, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height* .06,
      width: Get.width * .3,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        onPressed: onClick,
        color: color,
        child: Text(title,style: TextStyle(color: Global.white,fontSize: 18)),
      ),
    );
  }
}
