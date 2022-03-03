import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mylibrary/screens/homeScreen.dart';
import 'package:mylibrary/screens/welcomescreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pocket Library',
      theme: ThemeData(),
      home: const WelcomeScreen(),
      // home: const ParentScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
