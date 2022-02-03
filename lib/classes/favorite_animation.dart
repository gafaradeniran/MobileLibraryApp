import 'package:flutter/material.dart';
import 'package:mylibrary/classes/bookmodel.dart';

// widget for the favorite botton
class FavoriteAnimation extends StatefulWidget {
  const FavoriteAnimation({
    Key? key,
  }) : super(key: key);

  @override
  _FavoriteAnimationState createState() => _FavoriteAnimationState();
}

class _FavoriteAnimationState extends State<FavoriteAnimation>
    with SingleTickerProviderStateMixin {
  bool isFav = false;
  late AnimationController _controller;
  late Animation _colorAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _colorAnimation =
        ColorTween(begin: Colors.grey, end: Colors.amber).animate(_controller);

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 30, end: 50), weight: 50),
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 50, end: 30), weight: 50),
      ],
    ).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  List favoriteList = [];
  List mainDataList = [...allBooks];
  // final int index = 0;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _) {
          return IconButton(
            onPressed: () {
              isFav ? _controller.reverse() : _controller.forward();
              // isFav
              //     ? favoriteList.add(mainDataList[index]) //this is where I was trying to add the tiles to list
              //     : favoriteList.remove(mainDataList[index]);
            },
            icon: Icon(
              Icons.favorite,
              color: _colorAnimation.value,
              size: _sizeAnimation.value,
            ),
          );
        });
  }
}
