import 'package:flutter/material.dart';
import 'package:onesystem/models/globals.dart';

class BordersText extends StatelessWidget {
  final String text;
  final double leftmargin;
  const BordersText({
    this.text,
    this.leftmargin,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(6),
        margin: EdgeInsets.fromLTRB(leftmargin, 6, 6, 6),
        decoration:
            BoxDecoration(border: Border.all(width: 1, color: Global.light)),
        child: SelectableText(text,
            style: TextStyle(fontWeight: FontWeight.bold)));
  }
}
