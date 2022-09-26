import 'package:flutter/material.dart';
import 'package:mylibrary/screens/homeScreen.dart';
import '../screens/welcomescreen.dart';

class MyRoutes {
  Map<String, Widget Function(BuildContext)> routesettings = {
    '/welcomeScreen': (_) => const WelcomeScreen(),
    '/parentScreen': (_) => const ParentScreen(),
    '/loginScreen': (_) => const ParentScreen(),
    '/registrationScreen': (_) => const ParentScreen(),
    '/homeScreen': (_) => const ParentScreen(),
    '/freeBooks': (_) => const ParentScreen(),
    '/paidBooks': (_) => const ParentScreen(),
    '/favoriteScreen': (_) => const ParentScreen(),
    '/dashboardScreen': (_) => const ParentScreen(),
  };
}

//application
//navigator.pushNamed(context, '/parentScreen', arguments: ScreenThreadArguments(fname: '', title''));
//passing required value with pushNamed route.
//values passed in a child class of the parent class

// the child class
//class ScreenThreadArguments{
//final? fname, title, phone;
//ScreenThreadArguments({
//required this.fname,
//required this.title,
//this.phone,
//});
//}

//on nav page before scaffold
//final arg == Modalroute.of(context)!.settings.arguments as ScreebThreadArguments

//referencing
//args.fname!
// read documentation