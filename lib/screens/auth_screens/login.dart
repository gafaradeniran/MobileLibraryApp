import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mylibrary/classes/button.dart';
import 'package:mylibrary/firebase_model/firebase_methods.dart';
import 'package:mylibrary/screens/auth_screens/forgotPassword.dart';
import 'package:mylibrary/screens/auth_screens/register.dart';
import 'package:mylibrary/screens/homeScreen.dart';
import 'package:mylibrary/styles.dart';

import '../../classes/custom_textfield.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _email, _password;
  bool isLoading = false;
  bool isGoogle = false;
  bool _isObscure = true;
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
          automaticallyImplyLeading: false,
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
                            CustomTextField(
                                controller: _email,
                                keyboardType: TextInputType.emailAddress,
                                onSaved: (value) {
                                  _email!.text = value!;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "field cannot be empty";
                                  } else {
                                    return null;
                                  }
                                }),
                            const SizedBox(height: 20),
                            CustomTextField(
                                controller: _password,
                                obscureText: _isObscure,
                                hintText: 'Password',
                                labelText: 'Password',
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                    icon: Icon(_isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    }),
                                onSaved: (value) {
                                  _password!.text = value!;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "password field can't be empty";
                                  } else {
                                    return null;
                                  }
                                }),
                            const SizedBox(height: 8),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const ForgotPassword()));
                                  },
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  )),
                            ),
                            const SizedBox(height: 30),
                            isLoading
                                ? const CircularProgressIndicator()
                                : myButtons('SIGN IN', () {
                                    if (_formKey.currentState!.validate()) {
                                      signIn(_email!.text, _password!.text);
                                    }
                                  }),
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
                            isGoogle
                                ? const CircularProgressIndicator()
                                : GestureDetector(
                                    onTap: () {
                                      startLoading();
                                      try {
                                        Authentication.signInWithGoogle(
                                            context);
                                      } on PlatformException catch (e) {
                                        if (e.code ==
                                            GoogleSignIn.kNetworkError) {
                                          stopLoading();
                                          Fluttertoast.showToast(
                                              msg:
                                                  "A network error has occurred.");
                                        } else {
                                          stopLoading();
                                          Fluttertoast.showToast(
                                              msg: "Something went wrong.");
                                        }
                                      } catch (e) {
                                        stopLoading();
                                        Fluttertoast.showToast(
                                            msg: e.toString());
                                      }
                                      // final provider =
                                      //     Provider.of<GoogleSigninProvider>(context, listen: false);
                                      // provider.googleLogIn()
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[400],
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      height: 50,
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                                'assets/googlelogo1.png',
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

  Future<void> signIn(String email, String password) async {
    startLoading();
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      )
          .then((value) {
        stopLoading();
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const ParentScreen()));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        stopLoading();
        Fluttertoast.showToast(msg: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        stopLoading();
        Fluttertoast.showToast(msg: 'Wrong password provided for that user.');
      } else {
        stopLoading();
        Fluttertoast.showToast(msg: '$e');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _email!.dispose();
    _password!.dispose();
  }

  void startLoading() {
    setState(() {
      isLoading = true;
      isGoogle = true;
    });
  }

  void stopLoading() {
    setState(() {
      isLoading = false;
      isGoogle = false;
    });
  }
}
