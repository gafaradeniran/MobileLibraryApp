import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mylibrary/classes/bookmodel.dart';
import 'package:mylibrary/infoPage.dart';

class CommercialBooks extends StatefulWidget {
  const CommercialBooks({Key? key}) : super(key: key);

  @override
  _CommercialBooksState createState() => _CommercialBooksState();
}

class _CommercialBooksState extends State<CommercialBooks> {
  int selectedMenu = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ScrollPhysics(),
      itemCount: comBooks.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedMenu = index;
            });
          },
          child: Column(
            children: [
              const SizedBox(height: 10),
              ListTile(
                leading: Image.asset(comBooks[index].img),
                title: Text(comBooks[index].bookTitle),
                subtitle: RatingBar.builder(
                  initialRating: comBooks[index].rating,
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const InfoPage()));
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
