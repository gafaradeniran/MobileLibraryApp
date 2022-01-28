import 'package:flutter/material.dart';
import 'package:mylibrary/menupages/buybooks.dart';
import 'package:mylibrary/menupages/dashboard.dart';
import 'package:mylibrary/menupages/favorite.dart';
import 'package:mylibrary/menupages/home.dart';
import 'package:mylibrary/menupages/library.dart';

class ParentScreen extends StatefulWidget {
  const ParentScreen({Key? key}) : super(key: key);

  @override
  _ParentScreenState createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen> {
  int currentIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    const LibraryBooks(),
    const BookShop(),
    const FavoritePage(),
    const Dashboard()
  ];
  final List<IconData> icons = [
    Icons.home_filled,
    Icons.library_books_outlined,
    Icons.shopping_cart_outlined,
    Icons.favorite,
    Icons.person,
  ];
  final List<String> labels = ['Home', 'Library', 'Shop', 'Favourites', 'Dashboard'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: SizedBox(height: 60,
        child: BottomAppBar(
          elevation: 0,
          child: FittedBox(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(
                  labels.length,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? Colors.purple[500]
                            : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            icons[index],
                            color: Colors.purple[300],
                          ),
                          const SizedBox(width: 5),
                          currentIndex == index
                              ? Text(labels[index], style: TextStyle(color: Colors.white, fontSize: 15),)
                              : const Center(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
