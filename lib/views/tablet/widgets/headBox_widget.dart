import 'package:flutter/material.dart';
import 'package:onesystem/models/globals.dart';

class HeadBoxWidget extends StatelessWidget {
  final String title;
  const HeadBoxWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Global.medium,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3), topRight: Radius.circular(3))),
        height: 28,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 2),
        child: Text(title, style: TextStyle(color: Global.white)));
  }
}
