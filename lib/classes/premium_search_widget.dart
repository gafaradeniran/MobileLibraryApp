import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylibrary/classes/collections.dart';

import '../innerPages/free_info_page.dart';
import '../innerPages/info_page.dart';

class BookShopSearch extends StatefulWidget {
  const BookShopSearch({Key? key}) : super(key: key);

  @override
  State<BookShopSearch> createState() => _BookShopSearchState();
}

class _BookShopSearchState extends State<BookShopSearch> {
  final db = FirebaseFirestore.instance;

  String? query;
  List searchResult = [];
  void searchFromFirebase(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('premium')
        .where('bookTitle', isGreaterThanOrEqualTo: query)
        .where('bookTitle', isLessThan: query + 'z')
        .get();
    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList(growable: true);
    });
  }

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.black45,
        //   elevation: 0,
        // ),
        body: Column(
          children: [
            TextFormField(
              autofocus: false,
              controller: _searchController,
              textInputAction: TextInputAction.search,
              onChanged: (query) {
                searchFromFirebase(query);
              },
              decoration: InputDecoration(
                labelText: "Search by book title",
                labelStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 32,
                  color: Colors.grey,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    query = '';
                    /* Clear the search field */
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fillColor: Colors.white,
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: searchResult.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => InfoPage(
                                          author: searchResult[index]['author'],
                                          bookTitle: searchResult[index]
                                              ['bookTitle'],
                                          description: searchResult[index]
                                              ['description'],
                                          img: searchResult[index]['img'],
                                          pages: searchResult[index]['pages'],
                                          price: searchResult[index]['price'],
                                          isbn: searchResult[index]['isbn'],
                                          publisher: searchResult[index]
                                              ['publisher'],
                                          pdfBook: searchResult[index]
                                              ['pdfBook'],
                                        )));
                          });
                        },
                        child: ListTile(
                          selectedTileColor: Colors.grey,
                          leading: Image.network(searchResult[index]['img']),
                          title: Text(
                            searchResult[index]["bookTitle"],
                            style: const TextStyle(
                              color: Color.fromARGB(255, 100, 85, 105),
                              fontWeight: FontWeight.bold,
                            ),
                            softWrap: true,
                          ),
                          subtitle: Text(
                            searchResult[index]["publisher"],
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.navigate_next,
                              size: 30,
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
