import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylibrary/bookWidgets/art_books.dart';
import 'package:mylibrary/bookWidgets/commBooks.dart';
import 'package:mylibrary/bookWidgets/general_books.dart';
import 'package:mylibrary/bookWidgets/scienceBooks.dart';
import 'package:mylibrary/screens/homeScreen.dart';

import '../classes/search_widget.dart';

class LibraryBooks extends StatefulWidget {
  const LibraryBooks({Key? key}) : super(key: key);

  @override
  _LibraryBooksState createState() => _LibraryBooksState();
}

class _LibraryBooksState extends State<LibraryBooks>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  TabController? _tabController;
  int selectedMenu = 0;

  User? user = FirebaseAuth.instance.currentUser;
  List<String> categories = ['General', 'Science', 'Art', 'Commercial'];
  final db = FirebaseFirestore.instance;
  String profilePic = "";

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
    final docRef = db.collection("users").doc(user!.uid);
    docRef.snapshots().listen(
      (event) {
        final data = event.data() as Map<String, dynamic>;
        profilePic = data["profile_pic"];
      },
      onError: (e) => print("Error getting document: $e"),
    );
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ParentScreen()));
            },
          ),
          title: Text(
            'MyLibrary',
            style: GoogleFonts.fjallaOne(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search_outlined),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SearchField()));
              },
            ),
            StreamBuilder<Object>(
                stream: db.collection("users").doc(user!.uid).snapshots(),
                builder: (context, snapshot) {
                  return CircleAvatar(
                    radius: 18,
                    backgroundImage: profilePic == null
                        ? null
                        : NetworkImage(
                            profilePic,
                          ),
                  );
                }),
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
                      // AllBooks(),
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
