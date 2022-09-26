import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatelessWidget {
  final rating;
  const Rating({Key? key, this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context,) {
    return RatingBar.builder(
      initialRating: rating,
      direction: Axis.horizontal,
      itemCount: 5,
      itemSize: 20,
      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
