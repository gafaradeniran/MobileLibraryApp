import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FavoriteButton(
      iconColor: Colors.grey,
      iconDisabledColor: Colors.amber,
      iconSize: 50,
      isFavorite: true,
      valueChanged: (_isFavorite) {
        debugPrint('Is Favorite : $_isFavorite');
      },
    );
  }
}
