import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mylibrary/firebase_model/firebase_methods.dart';
import 'package:mylibrary/screens/auth_screens/register.dart';
import 'package:mylibrary/styles.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';

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
  File? _image;
  bool isLoading = false;
  final picker = ImagePicker();
  Future<void> openGallery() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _image = File(image.path);
        debugPrint(_image.toString());
        uploadImage();
      } else {
        Fluttertoast.showToast(msg: 'No image selected.');
      }
    });
  }

  Future<void> openCamera() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (image != null) {
        _image = File(image.path);
        debugPrint(_image.toString());
        uploadImage();
      } else {
        Fluttertoast.showToast(msg: 'No image captured.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final docRef = db.collection("users").doc(user!.uid);
    docRef.snapshots().listen(
      (event) {
        final data = event.data() as Map<String, dynamic>;
        fullname = data["fullname"];
        email = data["email"];
        department = data["department"];
        profilePic = data["profile_pic"];
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: StreamBuilder(
              stream: db.collection("users").doc(user!.uid).snapshots(),
              builder: (context, snapshot) {
                return Column(
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white10,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('User Profile', style: profileStyle),
                            const SizedBox(height: 15),
                            CircleAvatar(
                              radius: 60,
                              backgroundImage: profilePic == null
                                  ? null
                                  : NetworkImage(
                                      profilePic,
                                    ),
                            ),
                            const SizedBox(height: 10),
                            Text(fullname, style: profileStyle),
                            Text(email, style: profileStyle),
                            Text(department, style: profileStyle),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      height: 8.0,
                      thickness: 3.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10),
                      child: Column(
                        children: [
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Upload profile picture'),
                              IconButton(
                                  onPressed: () async {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (context) {
                                        return imagePick();
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.navigate_next))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Change Password'),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const ForgotPassword()));
                                  },
                                  icon: const Icon(Icons.navigate_next)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Update bio'),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.navigate_next)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Theme'),
                              ValueListenableBuilder(
                                  valueListenable:
                                      Hive.box('darkModeBox').listenable(),
                                  builder: (context, Box box, child) {
                                    bool getValue = box.get('darkModeBox',
                                        defaultValue: true);
                                    return Switch(
                                        value: getValue,
                                        onChanged: (value) {
                                          box.put('darkModeBox', !getValue);
                                        });
                                  }),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Delete Account'),
                              IconButton(
                                  onPressed: () {
                                    _deleteAccountDialog();
                                  },
                                  icon: const Icon(
                                      Icons.delete_forever_outlined)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }

  imagePick() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Select image'),
          const SizedBox(height: 6),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  openGallery();
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    children: const [
                      CircleAvatar(radius: 24, child: Icon(Icons.photo_album)),
                      SizedBox(height: 8),
                      Text('Gallery'),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 14),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  openCamera();
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    children: const [
                      CircleAvatar(radius: 24, child: Icon(Icons.camera_alt)),
                      SizedBox(height: 8),
                      Text('Camera'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future uploadImage() async {
    Reference ref = FirebaseStorage.instance.ref();
    String imgName = _image!
        .toString()
        .substring(_image.toString().lastIndexOf("/"),
            _image.toString().lastIndexOf("."))
        .replaceAll("/", ".");
    try {
      TaskSnapshot addImg = await ref.child("images/$imgName").putFile(_image!);
      if (addImg.state == TaskState.success) {
        final String imgUrl = await addImg.ref.getDownloadURL();
        // debugPrint(imgUrl);
        await db
            .collection('users')
            .doc(user!.uid)
            .update({'profile_pic': imgUrl}).then((value) {
          setState(() {
            // isLoading = false;
            profilePic = imgUrl;
          });
          Fluttertoast.showToast(msg: "Image uploaded");
        });
      } else {
        Fluttertoast.showToast(msg: "No image uploaded");
      }
    } on TimeoutException catch (_) {
      Fluttertoast.showToast(msg: 'Time out');
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    }
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
