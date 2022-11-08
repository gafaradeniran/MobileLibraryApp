import 'package:flutter/material.dart';
import 'package:mylibrary/menupages/buybooks.dart';
import 'package:mylibrary/menupages/library.dart';

class Collections {
  String bgImage, list;
  Widget route;

  Collections({required this.bgImage, required this.list, required this.route});
}

List<Collections> collections = [
  Collections(
      bgImage: "assets/bg/librarybg2.jpg",
      list: "Shop for Books",
      route: const BookShop()),
  Collections(
      bgImage: "assets/bg/bookbg1.jpg",
      list: "General Book Collections",
      route: const LibraryBooks()),
  Collections(
      bgImage: "assets/bg/bookbg4.jpg",
      list: "Science Book Collections",
      route: const LibraryBooks()),
  Collections(
      bgImage: "assets/bg/bookbg4.jpg",
      list: "Commercial Book Collections",
      route: const LibraryBooks()),
  Collections(
      bgImage: "assets/bg/bookbg3.jpg",
      list: "Art Book Collections",
      route: const LibraryBooks()),
];
