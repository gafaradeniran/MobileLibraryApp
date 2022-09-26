import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mylibrary/firebase_model/firebase_methods.dart';
import 'package:mylibrary/styles.dart';
import 'package:hive_flutter/adapters.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  User? user = FirebaseAuth.instance.currentUser;
  // final user = FirebaseAuth.instance.currentUser;
  final hivedb = Hive.box('darkModebox');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.purple,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage('${user?.photoURL}'),
                      onBackgroundImageError: (e, s) {
                        // debugPrint('image issue, $e,$s');
                      },
                    ),
                    const SizedBox(height: 10),
                    Text('${user?.displayName}', style: priceStyle),
                    Text('${user?.email}', style: priceStyle),
                    Text('User Department', style: priceStyle),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Text('Change Theme'),
                      ValueListenableBuilder(
                          valueListenable: Hive.box('darkModeBox').listenable(),
                          builder: (context, Box box, child) {
                            bool getValue =
                                box.get('darkModeBox', defaultValue: true);
                            return Switch(
                                value: getValue,
                                onChanged: (value) {
                                  box.put('darkModeBox', !getValue);
                                });
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Change E-mail'),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.navigate_next)),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Change Password'),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.navigate_next)),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Change Profile Picture'),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.navigate_next)),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Log out'),
                      IconButton(
                          onPressed: () {
                            try {
                              Authentication.signOut(context: context);
                            } catch (e) {
                              Fluttertoast.showToast(msg: e.toString());
                            }
                          },
                          icon: const Icon(Icons.logout)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
