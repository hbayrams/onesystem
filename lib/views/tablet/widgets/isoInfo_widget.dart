import 'package:flutter/material.dart';
import 'package:onesystem/models/globals.dart';

class ISOInfoWidget {
  Column isoInfo() {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          Expanded(flex: 1, child: Text('Condition')),
          Expanded(
            flex: 1,
            child: Container(
                padding: EdgeInsets.all(3),
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(border: Border.all(width: 1)),
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
          Expanded(flex: 1, child: Text('Pipe Class')),
          Expanded(
            flex: 1,
            child: Container(
                padding: EdgeInsets.all(3),
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(border: Border.all(width: 1)),
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
          Expanded(flex: 1, child: Text('PED Category')),
          Expanded(
            flex: 3,
            child: Container(
                padding: EdgeInsets.all(3),
                margin: EdgeInsets.only(right: 197),
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child: SelectableText('1',
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ),
        ],
      ),
      Row(
        children: [
          Expanded(flex: 1, child: Text('Paint Code')),
          Expanded(
              flex: 1,
              child: Container(
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                  child: SelectableText('A.II.B.2-2',
                      style: TextStyle(fontWeight: FontWeight.bold)))),
          Expanded(
              flex: 2,
              child: ElevatedButton.icon(
                  icon: Icon(Icons.file_download),
                  style: ElevatedButton.styleFrom(
                    primary: Global.dark,
                  ),
                  onPressed: () {},
                  label: Text('Download Folder',
                      style: TextStyle(color: Global.white))))
        ],
      ),
      Row(
        children: [
          Expanded(flex: 2, child: Text('Paint Code')),
          Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(right: 5),
                child: ElevatedButton.icon(
                    icon: Icon(Icons.picture_as_pdf),
                    style: ElevatedButton.styleFrom(
                      primary: Global.dark,
                    ),
                    onPressed: () {},
                    label: Text('Original',
                        style: TextStyle(color: Global.white))),
              )),
          Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.all(5),
                child: ElevatedButton.icon(
                    icon: Icon(Icons.picture_as_pdf),
                    style: ElevatedButton.styleFrom(
                      primary: Global.dark,
                    ),
                    onPressed: () {},
                    label:
                        Text('Scanned', style: TextStyle(color: Global.white))),
              ))
        ],
      ),
    ]);
  }
}