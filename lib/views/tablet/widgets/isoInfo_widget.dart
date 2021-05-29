import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/models/globals.dart';

class ISOInfoWidget extends StatefulWidget {
  @override
  _ISOInfoWidgetState createState() => _ISOInfoWidgetState();
}

class _ISOInfoWidgetState extends State<ISOInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: Text('Isometric Information',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
        ],
      ),
      Row(
        children: [
          Expanded(flex: 1, child: Text('Condition :')),
          Expanded(
            flex: 1,
            child: Container(
                padding: EdgeInsets.all(6),
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Global.light)),
                child: SelectableText('On Going',
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ),
          Expanded(
              flex: 2,
              child: Text('Passive',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Global.dark_red)))
        ],
      ),
      Row(
        children: [
          Expanded(flex: 1, child: Text('Pipe Class :')),
          Expanded(
            flex: 1,
            child: Container(
                padding: EdgeInsets.all(6),
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Global.light)),
                child: SelectableText('AA51N',
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ),
          Expanded(
              flex: 2,
              child: Text('Mat. - CS',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.indigo)))
        ],
      ),
      Row(
        children: [
          Expanded(flex: 1, child: Text('PED Category :')),
          Expanded(
            flex: 3,
            child: Container(
                padding: EdgeInsets.all(6),
                margin: EdgeInsets.only(right: 197),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Global.light)),
                child: SelectableText('1',
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ),
        ],
      ),
      Row(
        children: [
          Expanded(flex: 1, child: Text('Paint Code :')),
          Expanded(
              flex: 1,
              child: Container(
                  padding: EdgeInsets.all(6),
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Global.light)),
                  child: SelectableText('A.II.B.2-2',
                      style: TextStyle(fontWeight: FontWeight.bold)))),
          Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(right: 5),
                child: Container(
                  height: Get.height / 27,
                  child: ElevatedButton.icon(
                      icon: Icon(Icons.file_download),
                      style: ElevatedButton.styleFrom(
                        primary: Global.medium,
                      ),
                      onPressed: () {},
                      label: Text('Download Folder')),
                ),
              ))
        ],
      ),
      Row(
        children: [
          Expanded(flex: 2, child: Text('View DWG :')),
          Expanded(
              flex: 3,
              child: Container(
                height: Get.height / 27,
                child: ElevatedButton.icon(
                    icon: Icon(Icons.picture_as_pdf),
                    style: ElevatedButton.styleFrom(
                      primary: Global.medium,
                    ),
                    onPressed: () {
                      Get.toNamed('t/widgets/pdfviewer_widget');
                    },
                    label: Text('Original',
                        style: TextStyle(color: Global.white))),
              )),
          Expanded(
              flex: 3,
              child: Container(
                height: Get.height / 27,
                margin: EdgeInsets.all(5),
                child: ElevatedButton.icon(
                    icon: Icon(Icons.picture_as_pdf),
                    style: ElevatedButton.styleFrom(
                      primary: Global.medium,
                    ),
                    onPressed: null,
                    label:
                        Text('Scanned', style: TextStyle(color: Global.white))),
              ))
        ],
      ),
    ]);
  }
}
