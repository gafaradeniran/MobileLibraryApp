import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mylibrary/classes/bookmodel.dart';
import 'package:mylibrary/innerPages/freeInfoPage.dart';

class ArtBooks extends StatefulWidget {
  const ArtBooks({Key? key}) : super(key: key);

  @override
  _ArtBooksState createState() => _ArtBooksState();
}

class _ArtBooksState extends State<ArtBooks> {
  int selectedMenu = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ScrollPhysics(),
      itemCount: artBooks.length,
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
                            author: artBooks[index].author,
                            bookTitle: artBooks[index].bookTitle,
                            description: artBooks[index].description,
                            img: artBooks[index].img,
                            pages: artBooks[index].pages,
                            rating: artBooks[index].rating,
                          )));
            });
          },
          child: Column(
            children: [
              const SizedBox(height: 10),
              ListTile(
                leading: Image.asset(artBooks[index].img),
                title: Text(artBooks[index].bookTitle),
                subtitle: RatingBar.builder(
                  initialRating: artBooks[index].rating,
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
                            builder: (_) => FreeInfoPage(
                                  index: index,
                                  author: artBooks[index].author,
                                  bookTitle: artBooks[index].bookTitle,
                                  description: artBooks[index].description,
                                  img: artBooks[index].img,
                                  pages: artBooks[index].pages,
                                  rating: artBooks[index].rating,
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
