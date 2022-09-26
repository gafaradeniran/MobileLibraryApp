import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylibrary/classes/bookmodel.dart';
import 'package:mylibrary/providers/favoriteProvider.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key, this.img, this.bookTitle, this.author})
      : super(key: key);

  final String? img, bookTitle, author;

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

List<BookDetails> favoriteList = [];

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Favorite Books',
          style: GoogleFonts.fjallaOne(
              color: Colors.purple, fontSize: 22, fontWeight: FontWeight.bold),
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
            : Consumer<Favoriteprovider>(
        builder: (context, value, child) => GestureDetector(
          onTap: () {
            setState(() {});
          },
          child: ListView.builder(
              itemCount: value.favoriteList.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.horizontal,
                  background: Container(
                    color: Colors.purple,
                  ),
                  onDismissed: (direction) {
                    value.del(index);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('book removed from Favorite List')));
                  },
                  child: Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      leading: Image.asset(
                          value.favoriteList[index].img), //null operator used
                      title: Text((value.favoriteList[index].bookTitle)),
                      subtitle: Text((value.favoriteList[index].author)),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.navigate_next,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
