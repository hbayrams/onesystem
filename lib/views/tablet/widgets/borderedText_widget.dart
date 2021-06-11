import 'package:flutter/material.dart';
import 'package:onesystem/models/globals.dart';

class BorderedText extends StatelessWidget {
  final String text;
  final double leftmargin, height;
  const BorderedText({
    @required this.text,
    this.leftmargin,
    this.height,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        padding: EdgeInsets.all(6),
        margin: EdgeInsets.fromLTRB(leftmargin ?? 0, 6, 6, 6),
        decoration:
            BoxDecoration(border: Border.all(width: 1, color: Global.light)),
        child: SelectableText(text,
            style: TextStyle(fontWeight: FontWeight.bold)));
  }
}
