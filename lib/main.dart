import 'package:flutter/material.dart';
import 'package:mylibrary/menupages/library.dart';
import 'package:mylibrary/screens/homeScreen.dart';
import 'package:mylibrary/screens/welcomescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pocket Library',
      theme: ThemeData(),
      // home: const WelcomeScreen(),
      home: const LibraryBooks(),
      debugShowCheckedModeBanner: false,
    );
  }
}
