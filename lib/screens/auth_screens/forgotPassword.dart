import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylibrary/classes/button.dart';
import 'package:mylibrary/firebase_model/firebase_methods.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _newEmail = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          backgroundColor: Colors.purple,
          body: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 400,
                width: 400,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Password Reset',
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 12),
                          Text(
                              'Emter the e-mail address associated with your account',
                              softWrap: true,
                              style: GoogleFonts.poppins(fontSize: 14)),
                          const SizedBox(height: 15),
                          SizedBox(
                            height: 40,
                            child: TextFormField(
                              autofocus: false,
                              controller: _newEmail,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: 'email address',
                                labelText: 'E-mail',
                                prefixIcon: const Icon(Icons.email_outlined,
                                    color: Colors.black),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          const SizedBox(height: 15),
                          isLoading ? const CircularProgressIndicator() :
                          myButtons(
                            'Reset Password',
                            () {
                              try {
                                Authentication.resetPassword(context,
                                    email: _newEmail.text);
                              } on FirebaseAuthException catch (ex) {
                                stopLoading();
                                Fluttertoast.showToast(msg: ex.toString());
                                Fluttertoast.showToast(
                                    msg: 'try again, an error ocurred');
                              }
                            },
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _newEmail = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _newEmail.dispose();
  }

  void startLoading() {
    setState(() {
      isLoading = true;
    });
  }

  void stopLoading() {
    setState(() {
      isLoading = false;
    });
  }
}
