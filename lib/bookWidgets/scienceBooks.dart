import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylibrary/innerPages/free_info_page.dart';

class ScienceBooks extends StatefulWidget {
  const ScienceBooks({Key? key}) : super(key: key);

  @override
  _ScienceBooksState createState() => _ScienceBooksState();
}

class _ScienceBooksState extends State<ScienceBooks> {
  final db = FirebaseFirestore.instance;
  String bookTitle = "",
      author = "",
      description = "",
      img = "",
      isbn = "",
      publisher = "";
  int? pages;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: db.collection("science").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              itemCount: snapshot.data!.docs.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => FreeInfoPage(
                                    author: snapshot.data!.docs[index]
                                        ['author'],
                                    bookTitle: snapshot.data!.docs[index]
                                        ['bookTitle'],
                                    description: snapshot.data!.docs[index]
                                        ['description'],
                                    img: snapshot.data!.docs[index]['img'],
                                    pages: snapshot.data!.docs[index]['pages'],
                                    isbn: snapshot.data!.docs[index]['isbn'],
                                    publisher: snapshot.data!.docs[index]
                                        ['publisher'],
                                    pdfBook: snapshot.data!.docs[index]
                                        ['pdfBook'],
                                  )));
                    });
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide())),
                    child: ListTile(
                      leading: Image.network(
                        snapshot.data!.docs[index]['img'],
                        errorBuilder: (context, error, stackTrace) =>
                            const CircleAvatar(),
                      ),
                      title: Text(
                        snapshot.data!.docs[index]["bookTitle"],
                        style: const TextStyle(
                          color: Color.fromARGB(255, 100, 85, 105),
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      subtitle: Text(
                        snapshot.data!.docs[index]["publisher"],
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
                  ),
                );
              });
        });
  }
}
