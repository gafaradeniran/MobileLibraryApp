import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mylibrary/firebase_options.dart';
import 'package:mylibrary/providers/favoriteProvider.dart';
import 'package:mylibrary/screens/auth_screens/login.dart';
import 'package:mylibrary/screens/welcomescreen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  await Hive.openBox('darkModeBox');
  await Hive.openBox('userDetails');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final User? _user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return Favoriteprovider();
          },
        ),
      ],
      child: ValueListenableBuilder(
          valueListenable: Hive.box('darkModeBox').listenable(),
          builder: (context, Box box, child) {
            bool getValue = box.get('darkModeBox', defaultValue: true);
            return MaterialApp(
              title: 'Pocket Library',
              themeMode: getValue ? ThemeMode.light : ThemeMode.dark,
              darkTheme: ThemeData.dark(),
              theme: ThemeData(),
              home: _user != null ? const Login() : const WelcomeScreen(),
              debugShowCheckedModeBanner: false,
              // initialRoute: '/',
              // routes: MyRoutes().routesettings,
            );
          }),
    );
  }
}
