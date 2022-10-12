import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mylibrary/firebase_model/firebase_methods.dart';
import 'package:mylibrary/screens/auth_screens/register.dart';
import 'package:mylibrary/styles.dart';
import 'package:hive_flutter/adapters.dart';

import '../screens/auth_screens/forgotPassword.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  User? user = FirebaseAuth.instance.currentUser;
  final hivedb = Hive.box('darkModebox');
  final db = FirebaseFirestore.instance;
  String fullname = "", email = "", department = "", profilePic = "";

  @override
  Widget build(BuildContext context) {
    final docRef = db.collection("users").doc(user!.uid);
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        fullname = data["fullname"];
        email = data["email"];
        department = data["department"];
        profilePic = data["profile_pic"];
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            StreamBuilder(
              stream: db.collection("users").doc(user!.uid).snapshots(),
              builder: (context, snapshot) {
                return Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white10,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Dashboard' , style: profileStyle),
                        const SizedBox(height: 15),
                        CircleAvatar(
                          radius: 60,
                          child: profilePic.isEmpty ? const Icon(Icons.person) :Image.network(profilePic),
                        ),
                        const SizedBox(height: 10),
                        Text(fullname, style: profileStyle),
                        Text(email, style: profileStyle),
                        Text(department, style: profileStyle),
                      ],
                    ),
                  ),
                );
              }
            ),
            const Divider(
              height: 8.0,
              thickness: 3.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Text('Edit profile'),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.navigate_next)),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Change Password'),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const ForgotPassword()));
                          },
                          icon: const Icon(Icons.navigate_next)),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Upload Profile Picture'),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.navigate_next)),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Theme'),
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
                  Row(
                    children: [
                      const Text('Delete Account'),
                      IconButton(
                          onPressed: () {
                            _deleteAccountDialog();
                          },
                          icon: const Icon(Icons.delete_forever_outlined)),
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

  Future<void> _deleteAccountDialog() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Delete Account"),
            content: SingleChildScrollView(
              child: Column(
                children: const [
                  Text(
                      "Are you sure you want to permanently delete this account?"),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    deleteAccount();
                  },
                  child: const Text("Confirm")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
            ],
          );
        });
  }

  Future<void> deleteAccount() async {
    User? user = FirebaseAuth.instance.currentUser;
    await user?.delete().then((value) async {
      await db
          .collection("users")
          .doc(user.uid)
          .delete()
          .then((doc) => Fluttertoast.showToast(msg: "Account deleted"));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const Registration(),
          ));
    });
  }
}
