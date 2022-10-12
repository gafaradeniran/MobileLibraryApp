import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mylibrary/classes/ratingWidget.dart';
import 'package:mylibrary/classes/bookmodel.dart';
import 'package:mylibrary/innerPages/freeInfo_page.dart';

class ScienceBooks extends StatefulWidget {
  const ScienceBooks({Key? key}) : super(key: key);

  @override
  _ScienceBooksState createState() => _ScienceBooksState();
}

class _ScienceBooksState extends State<ScienceBooks> {
  int selectedMenu = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const ScrollPhysics(),
        itemCount: scienceBooks.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedMenu = index;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => FreeInfoPage(
                              index: index,
                              author: allBooks[index].author,
                              bookTitle: allBooks[index].bookTitle,
                              description: allBooks[index].description,
                              img: allBooks[index].img,
                              pages: allBooks[index].pages,
                              rating: allBooks[index].rating,
                            )));
              });
            },
            child: Column(
              children: [
                const SizedBox(height: 10),
                ListTile(
                  leading: Image.asset(scienceBooks[index].img),
                  title: Text(scienceBooks[index].bookTitle),
                  subtitle: Rating(rating: scienceBooks[index].rating),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => FreeInfoPage(
                                    index: index,
                                    author: allBooks[index].author,
                                    bookTitle: allBooks[index].bookTitle,
                                    description: allBooks[index].description,
                                    img: allBooks[index].img,
                                    pages: allBooks[index].pages,
                                    rating: allBooks[index].rating,
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
        });
  }
}
