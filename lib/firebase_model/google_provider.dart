import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  Future googleLogIn() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;
  

    final googleAuth = await googleUser.authentication;

    try {
       final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
     
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();
    } on FirebaseAuthException catch (ex) {
        debugPrint(ex.toString());
      }
   
  }
    
}
