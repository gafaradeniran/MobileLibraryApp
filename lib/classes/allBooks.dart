import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mylibrary/classes/bookmodel.dart';
import 'package:mylibrary/infoPage.dart';

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
                      builder: (_) => InfoPage(
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
                subtitle: RatingBar.builder(
                  initialRating: allBooks[index].rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                trailing: IconButton(
                  onPressed: () {
                   Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => InfoPage(
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
