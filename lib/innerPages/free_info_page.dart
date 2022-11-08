import 'dart:async';
import 'dart:isolate';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylibrary/classes/button.dart';
import 'package:mylibrary/classes/favorite_icon.dart';
import 'package:mylibrary/providers/favoriteProvider.dart';
import 'package:mylibrary/styles.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../classes/pdf/pdf_viewer_page.dart';

//details page for the free books
class FreeInfoPage extends StatefulWidget {
  const FreeInfoPage(
      {Key? key,
      this.img,
      this.bookTitle,
      this.author,
      this.description,
      this.pages,
      this.isbn,
      this.publisher,
      this.pdfBook})
      : super(key: key);
  final String? img, bookTitle, author, description, isbn, publisher, pdfBook;
  final int? pages;

  @override
  _FreeInfoPageState createState() => _FreeInfoPageState();
}

class _FreeInfoPageState extends State<FreeInfoPage> {
  // GlobalKey<State> _dialogKey = GlobalKey<State>();
  final db = FirebaseFirestore.instance;
  String pdfBook = "";
  bool startLoading = false;
  int percent = 0;
  final ReceivePort _port = ReceivePort();
  bool downloading = false;
  @override
  void initState() {
    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int? progress = data[2];
      setState(() {
        progress = percent;
      });
    });

    FlutterDownloader.registerCallback(downloadCallback);
    Timer? timer;
    timer = Timer.periodic(const Duration(milliseconds: 1000), (_) {
      setState(() {
        percent += 10;
        if (percent >= 100) {
          timer!.cancel();
          // percent=0;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.navigate_before,
              size: 30,
              color: Colors.white,
            )),
        title: Text('Book Details',
            style: GoogleFonts.poppins(fontSize: 25, color: Colors.white)),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.purple,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                child: Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.purple,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                widget.img!,
                                height: 250,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 7),
                              Text(
                                '${widget.pages} pages',
                                style: priceStyle,
                                softWrap: true,
                                textAlign: TextAlign.justify,
                                maxLines: 3,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(widget.bookTitle!,
                                  style: appTitleStyle,
                                  softWrap: true,
                                  textAlign: TextAlign.center),
                              Text(
                                widget.author!,
                                style: descStyle,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Price: Free', style: priceStyle),
                                  Consumer<Favoriteprovider>(
                                    builder: (context, value, child) => InkWell(
                                        onTap: () {},
                                        child: const FavoriteIcon()),
                                  ),
                                ],
                              ),
                              Text('ISBN: ${widget.isbn}', style: isbnStyle),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, left: 15, right: 15),
                          child: Text(
                            '${widget.description!} \nPublished by ${widget.publisher}',
                            style: descStyle2,
                            softWrap: true,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Row(children: [
                            Expanded(
                                flex: 1,
                                child: startLoading
                                    ? const Center(
                                        child: CircularProgressIndicator())
                                    : myButtons(
                                        'Read Online',
                                        () async {
                                          openPDF(context, widget.pdfBook,
                                              widget.bookTitle);
                                        },
                                      )),
                            const SizedBox(width: 10),
                            Expanded(
                                flex: 1,
                                child: downloading
                                    ? Center(
                                        child: LinearPercentIndicator(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              50,
                                          animation: true,
                                          animationDuration: 1000,
                                          lineHeight: 15.0,
                                          center:
                                              Text(percent.toString() + '%'),
                                          percent: percent / 100,
                                          barRadius: const Radius.circular(16),
                                          progressColor: Colors.purple,
                                        ),
                                      )
                                    : myButtons('Download', () {
                                        downloadPdfFile().then((value) =>
                                            Fluttertoast.showToast(
                                                msg:
                                                    'downloaded successfully'));
                                      })),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openPDF(BuildContext context, String? pdfBook, String? bookTitle) =>
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => PDFViewPage(
                pdfBook: widget.pdfBook, bookTitle: widget.bookTitle)),
      );

  Future<void> downloadPdfFile() async {
    final taskId = await FlutterDownloader.enqueue(
      url: widget.pdfBook!,
      headers: {}, // optional: header send with url (auth token etc)
      savedDir: '/storage/emulated/0/Download/',
      showNotification:
          true, //show download progress in status bar (for Android)
      openFileFromNotification: true,
    );
  }

//to show download dialog pop up
  Future<void> controlDownloadProgress() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Column(
          children: [
            Row(
              children: const [
                Text('downloading...'),
              ],
            ),
            LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 50,
              animation: true,
              animationDuration: 1000,
              lineHeight: 20.0,
              center: Text(percent.toString() + '%'),
              percent: percent / 100,
              barRadius: const Radius.circular(16),
              progressColor: Colors.purple,
            ),
            Text('downloading ${widget.bookTitle}'),
          ],
        );
      },
    );
  }

  Widget downloadStatusWidget(DownloadTaskStatus _status) {
    return _status == DownloadTaskStatus.canceled
        ? const Text('Download canceled')
        : _status == DownloadTaskStatus.complete
            ? const Text('Download completed')
            : _status == DownloadTaskStatus.failed
                ? const Text('Download failed')
                : _status == DownloadTaskStatus.paused
                    ? const Text('Download paused')
                    : _status == DownloadTaskStatus.running
                        ? const Text('Downloading...')
                        : const Text('Download waiting');
  }
}
