import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mylibrary/classes/bookmodel.dart';
import 'package:mylibrary/innerPages/free_info_page.dart';

class AllBooks extends StatefulWidget {
  const AllBooks({Key? key}) : super(key: key);

  @override
  State<AllBooks> createState() => _AllBooksState();
}

class _AllBooksState extends State<AllBooks> {
  int selectedMenu = 0;
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
    final docRef = db.collection("").doc();
    docRef.snapshots().listen(
      (event) {
        final data = event.data() as Map<String, dynamic>;
        bookTitle = data["bookTitle"];
        author = data["author"];
        description = data["description"];
        img = data["img"];
        isbn = data["isbn"];
        pages = data["pages"];
        publisher = data["publisher"];
      },
      onError: (e) => Fluttertoast.showToast(msg: "Error getting document: $e"),
    );
    return StreamBuilder(
      stream: db.collection("").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        return ListView.builder(
          physics: const ScrollPhysics(),
          itemCount: allBooks.length,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedMenu = index;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => FreeInfoPage(
                                 author: author,
                                        bookTitle: bookTitle,
                                        description: description,
                                        img: img,
                                        pages: pages,
                                        isbn: isbn,
                                        publisher: publisher,
                              )));
                });
              },
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  ListTile(
                      leading: Image.network(snapshot.data?.docs[index][img]),
                          title: Text(snapshot.data?.docs[index][bookTitle]),
                          subtitle: Text(snapshot.data?.docs[index][publisher]),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => FreeInfoPage(
                                      author: author,
                                        bookTitle: bookTitle,
                                        description: description,
                                        img: img,
                                        pages: pages,
                                        isbn: isbn,
                                        publisher: publisher,
                                    )));
                      },
                      icon: const Icon(
                        Icons.navigate_next,
                        size: 30,
                      ),
                    ),
                  ),
                  const Divider(thickness: 2.0, color: Colors.grey),
                ],
              ),
            );
          },
        );
      }
    );
  }
}
