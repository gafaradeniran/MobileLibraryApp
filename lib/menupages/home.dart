import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylibrary/classes/carouselModel.dart';
import 'package:mylibrary/classes/collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  final db = FirebaseFirestore.instance;
  String fullname = "", profilePic = "";

  @override
  Widget build(BuildContext context) {
    final docRef = db.collection("users").doc(user?.uid);
    docRef.snapshots().listen(
      (event) {
        final data = event.data() as Map<String, dynamic>;
        fullname = data["fullname"];
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
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text(
            'MyLibrary',
            style: GoogleFonts.lobster(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: StreamBuilder(
              stream: db.collection("users").doc(user!.uid).snapshots(),
              builder: (context, snapshot) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.purple,
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Welcome " + fullname,
                          style: GoogleFonts.lobster(
                              color: Colors.white70,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 270,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 15.0),
                              child: TextFormField(
                                autofocus: false,
                                controller: searchController,
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.search,
                                decoration: InputDecoration(
                                  labelText:
                                      "Search by title/author's name, ISBN",
                                  labelStyle:
                                      const TextStyle(color: Colors.white38),
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    size: 32,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  fillColor: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  height: double.maxFinite,
                                ),
                                items: generateCarousel(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25)),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, top: 12, bottom: 12),
                                child: Text(
                                  'Our Collections',
                                  style: GoogleFonts.oleoScript(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 358,
                                width: double.infinity,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: collections.length,
                                    itemBuilder: (_, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      collections[index]
                                                          .route));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0, horizontal: 10),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 15),
                                              width: 200,
                                              height: 150,
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        collections[index]
                                                            .bgImage),
                                                    fit: BoxFit.fill),
                                              ),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  collections[index].list,
                                                  style: GoogleFonts.creepster(
                                                      fontSize: 25,
                                                      color: Colors.black),
                                                  softWrap: true,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ]),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
