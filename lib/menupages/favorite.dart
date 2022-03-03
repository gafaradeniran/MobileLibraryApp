import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// this page displays the favorite tiles
class FavoritePage extends StatefulWidget {
  const FavoritePage(
      {Key? key, this.index, this.img, this.bookTitle, this.author, this.pages})
      : super(key: key);
  final int? index;
  final String? img, bookTitle, author;
  final int? pages;

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late List<Widget> favoriteList;
  @override
  void initState() {
    super.initState();
    favoriteList = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Your Favorite Books',
            style: GoogleFonts.fjallaOne(
                color: Colors.purple,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0.2,
          backgroundColor: Colors.white,
        ),
        body: favoriteList.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/mlibrary1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'No books added yet',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      'Simply click on the heart icon to add books to your favorite collection. This affords you the opportunity to have all your favorite books in one place.',
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                      softWrap: true,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              )
            : GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: Image.asset(widget.img!),
                    title: Text(widget.bookTitle!),
                    subtitle: Text(widget.author!),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.navigate_next,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ));
  }
}
