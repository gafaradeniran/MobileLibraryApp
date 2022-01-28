import 'package:flutter/material.dart'; 

class Collections { 
  String bgImage, list; 

  Collections({required this.bgImage, required this.list});
}

List<Collections> collections = [
  Collections(bgImage: "assets/bg/librarybg2.jpg", list: "Shop for Books"),
  Collections(
      bgImage: "assets/bg/bookbg1.jpg", list: "General Book Collections"),
  Collections(
      bgImage: "assets/bg/bookbg4.jpg", list: "Science Book Collections"),
  Collections(
      bgImage: "assets/bg/bookbg4.jpg", list: "Commercial Book Collections"),
  Collections(bgImage: "assets/bg/bookbg3.jpg", list: "Art Book Collections"),
];

