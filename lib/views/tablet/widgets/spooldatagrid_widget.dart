import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesystem/controllers/theme_controller.dart';
import 'package:onesystem/models/globals.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// The home page of the application which hosts the datagrid.
class SpoolDataGridWidget extends StatefulWidget {
  final String title;
  final bool openDialog;
  final DataGridSource dataSource;
  final Function tapFunc;
  // final bool visible;

  const SpoolDataGridWidget({
    Key key,
    this.title,
    this.openDialog,
    this.dataSource,
    this.tapFunc,
  }) : super(key: key);

  @override
  _SpoolDataGridWidgetState createState() => _SpoolDataGridWidgetState();
}

class _SpoolDataGridWidgetState extends State<SpoolDataGridWidget> {
  ThemeController tc = Get.put(ThemeController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: tc.isColorChangeWD(),
        toolbarHeight: 28,
        title: Text(widget.title,
            style: TextStyle(
                color: tc.isSavedDarkMode() ? Global.dark : Global.extra_light,
                fontSize: 14)),
        titleTextStyle: TextStyle(color: Global.dark),
        actions: <Widget>[
          IconButton(
              onPressed: () => widget.openDialog
                  ? Get.back()
                  : Get.dialog(AlertDialog(
                      content: Container(
                          width: Get.width,
                          height: Get.height,
                          child: SpoolDataGridWidget(
                            title: widget.title,
                            openDialog: true,
                            dataSource: widget.dataSource,
                          )),
                    )),
              icon: widget.openDialog
                  ? Icon(Icons.close,
                      size: 14,
                      color: tc.isSavedDarkMode()
                          ? Global.dark
                          : Global.extra_light)
                  : Icon(Icons.open_in_full,
                      size: 14,
                      color: tc.isSavedDarkMode()
                          ? Global.dark
                          : Global.extra_light))
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(border: Border.all(width: 1)),
        child: SfDataGrid(
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
            for (var j = 0; j < Global.listsSpool.length; j++)
              GridTextColumn(
                  //visible: widget.visible,
                  width: 150,
                  columnName: Global.listsSpool[j],
                  label: Container(
                      padding: EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      child: Text(Global.listsSpool[j]))),
          ],
        ),
      ),
    );
  }
}
