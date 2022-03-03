import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylibrary/classes/bookmodel.dart';
import 'package:mylibrary/classes/button.dart';
import 'package:mylibrary/classes/favorite_animation.dart';
import 'package:mylibrary/styles.dart';

// details page for the buy books
class InfoPage extends StatefulWidget {
  const InfoPage(
      {Key? key,
      required this.index,
      required this.img,
      required this.bookTitle,
      required this.author,
      required this.description,
      required this.pages,
      required this.rating,
      this.price,
      this.isbn})
      : super(key: key);
  final int index;
  final String img, bookTitle, author, description;
  final int pages;
  final double rating;
  final double? price;
  final String? isbn;
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
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
                              Hero(
                                  tag: 'hero-${paidBooks[widget.index].isbn}',
                                  child: Image.asset(
                                    widget.img,
                                    height: 250,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  )),
                              const SizedBox(height: 7),
                              Text('${widget.pages} pages', style: priceStyle),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                widget.bookTitle,
                                style: appTitleStyle,
                                softWrap: true,
                                textAlign: TextAlign.justify,
                                maxLines: 3,
                              ),
                              Text(
                                widget.author,
                                style: descStyle,
                              ),
                              RatingBar.builder(
                                initialRating: widget.rating,
                                direction: Axis.horizontal,
                                itemCount: 5,
                                itemSize: 20,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              Text(
                                widget.isbn!,
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.white,
                                    letterSpacing: 1.0),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('\$${widget.price!}', style: priceStyle),
                                  const FavoriteAnimation(),
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
                    padding: const EdgeInsets.all(15.0),
                    child: Stack(
                      children: [
                        const SizedBox(height: 12),
                        Text(
                          widget.description,
                          style: descStyle2,
                          softWrap: true,
                          textAlign: TextAlign.justify,
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: myButtons('Buy Now', () {})),
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
