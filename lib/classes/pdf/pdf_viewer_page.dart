import 'dart:io';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewPage extends StatefulWidget {
  final String? pdfBook;
  final File? file;
  final String? bookTitle;
  const PDFViewPage({Key? key, this.pdfBook, this.file, this.bookTitle})
      : super(key: key);

  @override
  State<PDFViewPage> createState() => _PDFViewPageState();
}

class _PDFViewPageState extends State<PDFViewPage> {
  PDFViewController? controller;
  int pages = 0;
  int indexPage = 0;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final name = basename(widget.bookTitle!);
    final text = '${indexPage + 1} of $pages';
    return Scaffold(
      appBar: AppBar(
          title: Text(name),
          actions: pages >= 2
              ? [
                  Center(child: Text(text)),
                  IconButton(
                    icon: const Icon(Icons.chevron_left, size: 32),
                    onPressed: () {
                      final page = indexPage == 0 ? pages : indexPage - 1;
                      controller!.setPage(page);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_right, size: 32),
                    onPressed: () {
                      final page = indexPage == pages - 1 ? 0 : indexPage + 1;
                      controller!.setPage(page);
                    },
                  ),
                ]
              : null),
      body: SfPdfViewer.network(
        widget.pdfBook!,
        key: _pdfViewerKey,
        enableDoubleTapZooming: true,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
