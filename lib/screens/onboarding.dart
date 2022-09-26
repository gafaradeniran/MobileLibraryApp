import 'package:flutter/material.dart';

class Onboarding {
  final String img, title, description;

  Onboarding({
    required this.img,
    required this.title,
    required this.description,
  });
}

List<Onboarding> sliders = [
  Onboarding(img: ('assets/mlib1.jpg'), title: 'Library on your palms', description: 'Your number 1 mobile libray app for Senior Secondary School Students'),
  Onboarding(img: ('assets/mlibrary1.png'), title: 'Borderless Library', description: 'Learn Anything. Anywhere. Anytime. '),

];
