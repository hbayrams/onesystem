import 'package:flutter/material.dart';

class BoxWidget extends StatefulWidget {
  final String title;
  final Widget child;
  final Color color;

  const BoxWidget({Key key, this.title, this.color, this.child})
      : super(key: key);

  @override
  _BoxWidgetState createState() => _BoxWidgetState();
}

class _BoxWidgetState extends State<BoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      //height: size.height * 0.12,
      //width: size.width * 0.2,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 30,
            offset: Offset(5, 5),
          ),
        ],
      ),
    );
  }
}
