import 'package:flutter/material.dart';
import 'package:onesystem/models/globals.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

/// Represents Homepage for Navigation
class PDFViewerWidget extends StatefulWidget {
  @override
  _PDFViewerWidget createState() => _PDFViewerWidget();
}

class _PDFViewerWidget extends State<PDFViewerWidget> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  PdfViewerController _pdfController;
  bool _canShowPdf;
  String _error;

  @override
  void initState() {
    super.initState();
    _canShowPdf = false;
    _pdfController = PdfViewerController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Global.black,
        title: const Text('OneSytem PDF Viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.white,
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.zoom_in,
              color: Colors.white,
            ),
            onPressed: () {
              _pdfController.zoomLevel = 3;
            },
          ),
        ],
      ),
      body: FutureBuilder(
          future: Future.delayed(Duration(microseconds: 1)).then((value) {
            _canShowPdf = true;
          }),
          builder: (context, snapshot) {
            if (_canShowPdf) {
              return Stack(children: [
                SfPdfViewer.network(
                  'https://dart.dev/guides/language/specifications/DartLangSpec-v2.2.pdf',
                  key: _pdfViewerKey,
                  controller: _pdfController,
                  onDocumentLoadFailed: (details) {
                    _error = details.description;
                    print(details.description);
                  },
                ),
              ]);
            } else {
              return Container(
                child: Text(_error == null
                    ? 'File path or Connection error occurred'
                    : _error),
              );
            }
          }),
    );
  }
}
