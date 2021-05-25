import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/controllers/theme_controller.dart';
import 'package:onesystem/models/globals.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// The home page of the application which hosts the datagrid.
class DataGridWidget extends StatefulWidget {
  final String title;
  final bool openDialog;
  final DataGridSource dataSource;
  final Function tapFunc;
  final double height;
  final List<String> colName;
  // final bool visible;

  const DataGridWidget(
      {Key key,
      this.title,
      this.openDialog,
      this.dataSource,
      this.tapFunc,
      this.height,
      this.colName})
      : super(key: key);

  @override
  _DataGridWidgetState createState() => _DataGridWidgetState();
}

class _DataGridWidgetState extends State<DataGridWidget> {
  ThemeController tc = Get.put(ThemeController());

  @override
  void initState() {
    super.initState();
    print('initstate');
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1.5)),
      height: 1000,
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title,
                    style: TextStyle(
                        color: tc.isSavedDarkMode()
                            ? Global.dark
                            : Global.extra_light,
                        fontSize: 14)),
                buildIconButton(),
              ],
            ),
            color: tc.isColorChangeWD(),
            width: double.infinity,
            height: 28,
            padding: EdgeInsets.only(left: 10),
          ),
          Container(
            height: widget.height == null ? Get.height / 2.25 : widget.height,
            margin: EdgeInsets.all(0),
            child:SfDataGrid(
                    frozenColumnsCount: 1,
                    onCellDoubleTap: widget.tapFunc,
                    headerGridLinesVisibility: GridLinesVisibility.both,
                    allowPullToRefresh: true,
                    defaultColumnWidth: 105,
                    source: widget.dataSource,
                    columnWidthMode: ColumnWidthMode.none,
                    gridLinesVisibility: GridLinesVisibility.both,
                    headerRowHeight: 50,
                    rowHeight: 40,
                    columns: <GridColumn>[
                      for (var j = 0; j < widget.colName.length; j++)
                        GridTextColumn(
                            width: 150,
                            columnName: widget.colName[j],
                            label: Container(
                                padding: EdgeInsets.all(8.0),
                                alignment: Alignment.center,
                                child: Text(widget.colName[j]))),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  IconButton buildIconButton() {
    return IconButton(
        onPressed: () => widget.openDialog
            ? Get.back()
            : Get.dialog(AlertDialog(
                content: Container(
                    width: Get.width,
                    height: Get.height,
                    child: DataGridWidget(
                      height: Get.height - 150,
                      title: widget.title,
                      openDialog: true,
                      dataSource: widget.dataSource,
                    )),
              )),
        icon: widget.openDialog
            ? Icon(Icons.close,
                size: 14,
                color: tc.isSavedDarkMode() ? Global.dark : Global.extra_light)
            : Icon(Icons.open_in_full,
                size: 14,
                color:
                    tc.isSavedDarkMode() ? Global.dark : Global.extra_light));
  }
}
