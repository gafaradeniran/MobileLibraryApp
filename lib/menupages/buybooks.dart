import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylibrary/classes/premium_search_widget.dart';
import 'package:mylibrary/classes/search_widget.dart';
import 'package:mylibrary/innerPages/info_page.dart';

class BookShop extends StatefulWidget {
  const BookShop({Key? key}) : super(key: key);

  @override
  _BookShopState createState() => _BookShopState();
}

class _BookShopState extends State<BookShop> {
  final db = FirebaseFirestore.instance;
  String bookTitle = "",
      author = "",
      description = "",
      img = "",
      isbn = "",
      publisher = "";
  int? pages;
  double? price;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Our BookStore',
              style: GoogleFonts.lobster(color: Colors.white54, fontSize: 20)),
          actions: [
            IconButton(
              icon: const Icon(Icons.search_outlined),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const BookShopSearch()));
              },
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.black45,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Shop for your School Books',
                        style: GoogleFonts.lobster(
                            fontSize: 23,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                        flex: 1,
                        child: Image.asset('assets/bg/librarybg.jpg',
                            fit: BoxFit.contain)),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 12),
                  child: StreamBuilder<QuerySnapshot>(
                      stream: db.collection("premium").snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.6,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => InfoPage(
                                                    author: snapshot.data!
                                                        .docs[index]['author'],
                                                    bookTitle: snapshot
                                                            .data!.docs[index]
                                                        ['bookTitle'],
                                                    description: snapshot
                                                            .data!.docs[index]
                                                        ['description'],
                                                    img: snapshot.data!
                                                        .docs[index]['img'],
                                                    pages: snapshot.data!
                                                        .docs[index]['pages'],
                                                    price: snapshot.data!
                                                        .docs[index]['price'],
                                                    isbn: snapshot.data!
                                                        .docs[index]['isbn'],
                                                    publisher: snapshot
                                                            .data!.docs[index]
                                                        ['publisher'],
                                                    pdfBook: snapshot.data!
                                                        .docs[index]['pdfBook'],
                                                  )));
                                    },
                                    child: Container(
                                      height: 200,
                                      // width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Hero(
                                        tag:
                                            'hero-${snapshot.data!.docs[index]}', //tag for hero
                                        child: Image.network(
                                            snapshot.data!.docs[index]['img'],
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]["bookTitle"],
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: Colors.grey.shade500),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: true,
                                  ),
                                  Text(
                                    'NGN${snapshot.data!.docs[index]['price']}',
                                    style: GoogleFonts.poppins(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
