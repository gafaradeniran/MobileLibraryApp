import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mylibrary/classes/button.dart';
import 'package:mylibrary/classes/custom_textfield.dart';
import 'package:mylibrary/firebase_model/firebase_methods.dart';
import 'package:mylibrary/screens/auth_screens/login.dart';
import 'package:mylibrary/styles.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mylibrary/screens/homeScreen.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _fullname, _email, _password, _verifyPass;
  final List<String> departments = [
    'Science',
    'Art',
    'Commercial',
  ];
  String? selectedValue;
  bool agree = false;
  bool isLoading = false;
  bool _isObscure = true;
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  height: 215,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/mlib1.jpg'),
                      fit: BoxFit.cover,
                      alignment: Alignment.topRight,
                    ),
                    color: Colors.purple,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(100)),
                  ),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text('Hello!\n Signup to\n get started',
                          style: regStyle)),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _fullname,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null ||
                                value is num ||
                                value is double) {
                              return 'name must not be empty and should be in letters';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 8),
                        DropdownButtonFormField(
                          items: departments
                              .map((item) => DropdownMenuItem<String>(
                                  value: item, child: Text(item)))
                              .toList(),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            isDense: true,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue;
                            });
                          },
                          onSaved: (selectedValue) {},
                          icon: const Icon(Icons.arrow_drop_down,
                              color: Colors.black, size: 30),
                          hint: const Text('Select Department',
                              style: TextStyle(fontSize: 16)),
                          validator: (value) {
                            if (value == null) {
                              return 'please select your department!';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: _email,
                          hintText: 'email address',
                          labelText: 'E-mail',
                          prefixIcon: const Icon(Icons.email_outlined,
                              color: Colors.black),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            Pattern epattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regex = RegExp(epattern.toString());
                            if (!regex.hasMatch(value!)) {
                              return 'Invalid e-mail address';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                            obscureText: _isObscure,
                            controller: _password,
                            hintText: 'passwords',
                            labelText: 'Password',
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              Pattern pattern =
                                  r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$";
                              RegExp regex = RegExp(pattern.toString());
                              if (!regex.hasMatch(value!)) {
                                return 'Minimum of 8 chars, 1 letter and 1 number';
                              }
                              return null;
                            }),
                        CustomTextField(
                            obscureText: _isObscure,
                            controller: _verifyPass,
                            hintText: 'verify passwords',
                            labelText: 'verify Password',
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value != null &&
                                  value.isEmpty &&
                                  value != _password!.text) {
                                return 'passwords donot match';
                              } else {
                                return null;
                              }
                            }),
                        Row(
                          children: [
                            Checkbox(
                              value: agree,
                              activeColor: Colors.purple,
                              onChanged: (bool? value) {
                                setState(() {
                                  agree = value!;
                                });
                              },
                            ),
                            const Text('I agree to the'),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'terms and conditions',
                                style: TextStyle(color: Colors.purple),
                              ),
                            ),
                          ],
                        ),
                        isLoading
                            ? const CircularProgressIndicator()
                            : myButtons(
                                'SIGN UP',
                                () {
                                  if (_formKey.currentState!.validate()) {
                                    register(_email!.text, _password!.text);
                                  }
                                },
                              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have an account?',
                                style: TextStyle(fontSize: 17)),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Login()));
                                },
                                child: const Text(
                                  'Sign in',
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 22,
                                      decoration: TextDecoration.underline),
                                )),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _fullname = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _verifyPass = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _fullname!.dispose();
    _email!.dispose();
    _password!.dispose();
    _verifyPass!.dispose();
  }

  Future<void> register(String email, String password) async {
    final storedata = Hive.box('userDetails');
    startLoading();
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password)
          .then((value) async {
        try {
          await db.collection("users").doc(value.user!.uid).set({
            "uid": value.user!.uid,
            "email": _email!.text,
            "fullname": _fullname!.text,
            "type": "users",
            "department": departments, //dropdown
            "date_created": DateTime.now().toString(),
          }).then((v) {
            storedata.putAll({
              "uid": value.user!.uid,
              "email": _email!.text,
              "fullname": _fullname!.text,
              "type": "users",
              "department": departments, //dropdown
              "date_created": DateTime.now().toString(),
            });
            stopLoading();
            Fluttertoast.showToast(msg: 'Registration successful.');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ParentScreen(),
              ),
            );
          });
        } catch (e) {
          Fluttertoast.showToast(msg: e.toString());
        }
      });
    } on FirebaseAuthException catch (e) {
      stopLoading();
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account already exists for that email.');
      }
    } catch (e) {
      stopLoading();
      Fluttertoast.showToast(msg: e.toString());
    }
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
