import 'package:flutter/material.dart';

class Favoriteprovider with ChangeNotifier {
  //global variables
  final List _favoriteList = [];
  List get favoriteList => _favoriteList;
  

  void addBook(int value) {
    _favoriteList.add(value);
    notifyListeners();
  }

  void remove(int value) {
    _favoriteList.remove(value);
    notifyListeners();
  }

  void del(int index) {
    favoriteList.removeAt(index);
    notifyListeners();
  }
}
