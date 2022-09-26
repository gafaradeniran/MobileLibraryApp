import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mylibrary/screens/homeScreen.dart';
import 'package:mylibrary/screens/auth_screens/login.dart';

class Authentication {
  late PlatformException e;
  static late Function(String errorMessage) errorCallback;
  static final credential = FirebaseAuth.instance;

  //email and password signin method
  static Future<void> signIn(BuildContext context,
      {required String email, required String password}) async {
    await credential.signInWithEmailAndPassword(
        email: email.trim(), password: password);
  }

//signout method
  static Future<void> signOut({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut().then(
        (value) => Fluttertoast.showToast(msg: "logged out successfully"));
    await GoogleSignIn().signOut().then(
        (value) => Fluttertoast.showToast(msg: "logged out successfully"));
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }

  //Google signin method
  static Future<UserCredential> signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    Navigator.push((context),
        MaterialPageRoute(builder: (context) => const ParentScreen()));
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //Registration method
  static Future<void> register(BuildContext context,
      {required String email, required String password}) async {
    credential
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      Fluttertoast.showToast(msg: 'registration successful');
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const ParentScreen()));
    });
  }


//forgot password
  static Future<void> resetPassword(BuildContext context,
      {required String email}) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    await credential.sendPasswordResetEmail(email: email).then((value) =>
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const Login())));

    Fluttertoast.showToast(
        msg: 'password reset link sent to your email address');
  }
}
