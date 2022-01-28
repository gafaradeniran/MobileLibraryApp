import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylibrary/classes/bookmodel.dart';
import 'package:mylibrary/classes/searchWidget.dart';
import 'package:mylibrary/infoPage.dart';

class BookShop extends StatefulWidget {
  const BookShop({Key? key}) : super(key: key);

  @override
  _BookShopState createState() => _BookShopState();
}

class _BookShopState extends State<BookShop> {
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
        // backgroundColor: Colors.purple,
        appBar: AppBar(
          // title: Text('Our BookStore',
          //     style: GoogleFonts.lobster(color: Colors.purple, fontSize: 18)),
          actions: const [
            Expanded(child: SearchField()),
          ],
          // elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
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
                  child: GridView.builder(
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
                    itemCount: paidBooks.length,
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
                                              index: index,
                                              author: paidBooks[index].author,
                                              bookTitle:
                                                  paidBooks[index].bookTitle,
                                              description:
                                                  paidBooks[index].description,
                                              img: paidBooks[index].img,
                                              pages: paidBooks[index].pages,
                                              rating: paidBooks[index].rating,
                                              price: paidBooks[index].price,
                                              isbn: paidBooks[index].isbn,
                                            )));
                              },
                              child: Container(
                                height: 200,
                                // width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Image.asset(paidBooks[index].img,
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Text(
                              paidBooks[index].bookTitle,
                              style: GoogleFonts.poppins(
                                  fontSize: 12, color: Colors.grey.shade500),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: true,
                            ),
                            Text(
                              '\$${paidBooks[index].price}',
                              style: GoogleFonts.poppins(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    },
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
