import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
                            author: generalBooks[index].author,
                            bookTitle: generalBooks[index].bookTitle,
                            description: generalBooks[index].description,
                            img: generalBooks[index].img,
                            pages: generalBooks[index].pages,
                            rating: generalBooks[index].rating,
                          )));
            });
          },
          child: Column(
            children: [
              const SizedBox(height: 10),
              ListTile(
                leading: Image.asset(generalBooks[index].img),
                title: Text(generalBooks[index].bookTitle),
                subtitle: RatingBar.builder(
                  initialRating: generalBooks[index].rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
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
                                  author: generalBooks[index].author,
                                  bookTitle: generalBooks[index].bookTitle,
                                  description: generalBooks[index].description,
                                  img: generalBooks[index].img,
                                  pages: generalBooks[index].pages,
                                  rating: generalBooks[index].rating,
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
