import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylibrary/classes/button.dart';
import 'package:mylibrary/classes/payment/paystack_payment.dart';
import 'package:mylibrary/styles.dart';

// details page for the buy books
class InfoPage extends StatefulWidget {
  const InfoPage(
      {Key? key,
      this.img,
      this.bookTitle,
      this.author,
      this.description,
      this.pages,
      this.price,
      this.isbn,
      this.publisher,
      this.pdfBook})
      : super(key: key);
  final String? img, bookTitle, author, description, isbn, publisher, pdfBook;
  final int? pages;
  final int? price;

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final db = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  bool startLoading = false;
  String fullname = "", email = "";
  @override
  Widget build(BuildContext context) {
    final docRef = db.collection("users").doc(user?.uid);
    docRef.snapshots().listen(
      (event) {
        final data = event.data() as Map<String, dynamic>;
        fullname = data["fullname"];
        email = data["email"];
      },
      onError: (e) => print("Error getting document: $e"),
    );
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
                                  tag: 'hero-${widget.key}', //hero tag
                                  child: Image.network(
                                    widget.img!,
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
                                widget.bookTitle!,
                                style: appTitleStyle,
                                softWrap: true,
                                textAlign: TextAlign.justify,
                                maxLines: 3,
                              ),
                              Text(
                                widget.author!,
                                style: descStyle,
                              ),
                              Text(
                                widget.isbn!,
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.white,
                                    letterSpacing: 1.0),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('NGN${widget.price}', style: priceStyle),
                                  // Consumer<Favoriteprovider>(
                                  //   builder: (context, value, child) => InkWell(
                                  //       onTap: () {
                                  //         if (value.favoriteList
                                  //             .contains(widget.index)) {
                                  //           value.remove(widget.index);

                                  //         } else {
                                  //           value.addBook(widget.index);
                                  //           print('${value.favoriteList}');
                                  //         }
                                  //       },
                                  //       child: const FavoriteIcon()),
                                  // ),
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
                          widget.description!,
                          style: descStyle2,
                          softWrap: true,
                          textAlign: TextAlign.justify,
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: myButtons('Buy Now', () {
                              PaystackPayment(
                                      context, widget.price!, email, fullname)
                                  .chargeAndMakePayment();
                            })),
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
