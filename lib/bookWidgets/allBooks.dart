import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mylibrary/classes/ratingWidget.dart';
import 'package:mylibrary/classes/bookmodel.dart';
import 'package:mylibrary/innerPages/freeInfoPage.dart';

class AllBooks extends StatefulWidget {
  const AllBooks({Key? key}) : super(key: key);

  @override
  State<AllBooks> createState() => _AllBooksState();
}

class _AllBooksState extends State<AllBooks> {
  int selectedMenu = 0;

  @override
  Widget build(BuildContext context) {
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
                leading: Image.asset(allBooks[index].img),
                title: Text(allBooks[index].bookTitle),
                subtitle: Rating(rating: allBooks[index].rating),
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
      },
    );
  }
}
