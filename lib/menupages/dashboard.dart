import 'package:flutter/material.dart';
import 'package:mylibrary/classes/firebase_model/firebase_methods.dart';
import 'package:mylibrary/styles.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
                    const CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/soyinka.jpg'),
                    ),
                    const SizedBox(height: 10),
                    Text("User's Full Name", style: priceStyle),
                    Text('Useremail@email.com', style: priceStyle),
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
                          onPressed: () async {
                            await Authentication.signOut(context: context);
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
