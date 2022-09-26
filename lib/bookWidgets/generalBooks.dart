import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mylibrary/classes/ratingWidget.dart';
import 'package:mylibrary/classes/bookmodel.dart';
import 'package:mylibrary/innerPages/freeInfoPage.dart';

class GeneralBooks extends StatefulWidget {
  const GeneralBooks({Key? key}) : super(key: key);

  @override
  _GeneralBooksState createState() => _GeneralBooksState();
}

class _GeneralBooksState extends State<GeneralBooks> {
  int selectedMenu = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: generalBooks.length,
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
                leading: Image.asset(generalBooks[index].img),
                title: Text(generalBooks[index].bookTitle),
                subtitle: Rating(rating: generalBooks[index].rating),
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
