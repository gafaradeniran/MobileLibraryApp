import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mylibrary/classes/button.dart';
import 'package:mylibrary/classes/favorite_icon.dart';
import 'package:mylibrary/providers/favoriteProvider.dart';
import 'package:mylibrary/styles.dart';
import 'package:provider/provider.dart';

import '../classes/ratingWidget.dart';

//details page for d free books
class FreeInfoPage extends StatefulWidget {
  const FreeInfoPage(
      {Key? key,
      required this.index,
      required this.img,
      required this.bookTitle,
      required this.author,
      required this.description,
      required this.pages,
      required this.rating})
      : super(key: key);
  final int index;
  final String img, bookTitle, author, description;
  final int pages;
  final double rating;

  @override
  _FreeInfoPageState createState() => _FreeInfoPageState();
}

class _FreeInfoPageState extends State<FreeInfoPage> {
  final hivedb = Hive.box('ratingBox');
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
                              Image.asset(
                                widget.img,
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
                              Text(widget.bookTitle,
                                  style: appTitleStyle,
                                  softWrap: true,
                                  textAlign: TextAlign.center),
                              Text(
                                widget.author,
                                style: descStyle,
                              ),
                              ValueListenableBuilder(
                                  valueListenable:
                                      Hive.box('ratingBox').listenable(),
                                  builder: (context, Box ratingBox, child) {
                                    double getRating = ratingBox.get(
                                        'ratingBox',
                                        defaultValue: widget.rating);
                                    return Rating(rating: widget.rating);
                                  }),
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
                            widget.description,
                            style: descStyle2,
                            softWrap: true,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: myButtons('Read Online', () {})),
                              const SizedBox(width: 10),
                              Expanded(
                                  flex: 1, child: myButtons('Download', () {})),
                            ],
                          ),
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
}
