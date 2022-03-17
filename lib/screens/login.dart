import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mylibrary/classes/button.dart';
import 'package:mylibrary/screens/homeScreen.dart';
import 'package:mylibrary/screens/register.dart';
import 'package:mylibrary/styles.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sign In',
                                style: signStyle,
                              ),
                              const SizedBox(height: 13),
                              const Text(
                                'Get unrestricted access to quality learning materials to spice up your academics',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _email,
                              autofocus: false,
                              decoration: InputDecoration(
                                hintText: 'email',
                                hintStyle: const TextStyle(color: Colors.black),
                                labelText: 'email',
                                prefixIcon: const Icon(Icons.person, size: 25),
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                fillColor: Colors.white,
                              ),
                              onSaved: (value) {
                                _email.text = value!;
                              },
                              validator: (value) {
                                Pattern epattern =
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                RegExp regex = RegExp(epattern.toString());
                                if (!regex.hasMatch(value!) || value.isEmpty) {
                                  return 'Invalid e-mail address';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                                controller: _password,
                                autofocus: false,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle:
                                      const TextStyle(color: Colors.purple),
                                  labelText: 'Password',
                                  prefixIcon: const Icon(Icons.lock, size: 25),
                                  labelStyle:
                                      const TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  fillColor: Colors.white,
                                ),
                                onSaved: (value) {
                                  _password.text = value!;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Email field can't be empty";
                                  } else {
                                    return null;
                                  }
                                }),
                            const SizedBox(height: 8),
                            const Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            myButtons(
                              'SIGN IN',
                              () {
                                if (_formKey.currentState!.validate()) {
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //     const SnackBar(content: Text('Processing Data')));
                                  signIn(_email.text, _password.text);
                                }
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text("Don't have an account?"),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const Registration()));
                                    },
                                    child: const Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          color: Colors.purple,
                                          fontSize: 18,
                                          decoration: TextDecoration.underline),
                                    )),
                              ],
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                signInWithGoogle();

                                setState(() {});
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/googlelogo1.png',
                                          height: 40),
                                      const SizedBox(width: 12),
                                      const Text('Signin with Google',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    try {
      if (_formKey.currentState!.validate()) {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: 'Login successful!'),
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const ParentScreen())),
                })
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //google sign in
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = await GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();

      // Obtain the auth details from the request

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuth =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            idToken: googleSignInAuth.idToken,
            accessToken: googleSignInAuth.accessToken);

        UserCredential result =
            await _auth.signInWithCredential(authCredential);
        User? user = result.user;

        // ignore: unnecessary_null_comparison
        if (result != null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => ParentScreen()));
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
