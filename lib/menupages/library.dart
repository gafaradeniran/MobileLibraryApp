import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylibrary/classes/artBooks.dart';
import 'package:mylibrary/classes/allBooks.dart';
import 'package:mylibrary/classes/commBooks.dart';
import 'package:mylibrary/classes/generalBooks.dart';
import 'package:mylibrary/classes/scienceBooks.dart';
import 'package:mylibrary/classes/searchWidget.dart';
import 'package:mylibrary/menupages/dashboard.dart';
import 'package:mylibrary/menupages/favorite.dart';

class LibraryBooks extends StatefulWidget {
  const LibraryBooks({Key? key}) : super(key: key);

  @override
  _LibraryBooksState createState() => _LibraryBooksState();
}

class _LibraryBooksState extends State<LibraryBooks>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  ScrollController _scrollController = ScrollController();
  TabController? _tabController;
  int selectedMenu = 0;

  List<String> categories = ['All', 'General', 'Science', 'Art', 'Commercial'];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController =
        TabController(length: categories.length, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          leading: IconButton(
            icon: const Icon(Icons.navigate_before, color: Colors.white),
            iconSize: 30,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'MyLibrary',
            style: GoogleFonts.fjallaOne(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (_) => const SearchField()));
                },
                icon: const Icon(Icons.search_outlined)),
            const CircleAvatar(
                radius: 18, backgroundImage: AssetImage('assets/appLogo.png')),
            const SizedBox(width: 12),
          ],
          elevation: 0,
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white54,
            indicatorWeight: 2,
            indicatorColor: Colors.white,
            tabs: List.generate(
                categories.length,
                (index) => Text(
                      categories[index],
                      style: GoogleFonts.fjallaOne(
                        fontSize: 18,
                        fontWeight: selectedMenu == index
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    )),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.purple,
            ),
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(
                    controller: _tabController,
                    physics: const ScrollPhysics(),
                    children: const [
                      AllBooks(),
                      GeneralBooks(),
                      ScienceBooks(),
                      ArtBooks(),
                      CommercialBooks(),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
