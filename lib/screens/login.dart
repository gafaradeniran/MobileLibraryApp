import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylibrary/classes/button.dart';
import 'package:mylibrary/menupages/library.dart';
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

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
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
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined,
                size: 30, color: Colors.white),
          ),
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
                            const SizedBox(height: 20),
                            TextFormField(
                                controller: _password,
                                autofocus: false,
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
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  fillColor: Colors.white,
                                ),
                                validator: (value) {
                                  Pattern pattern =
                                      r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$";
                                  RegExp regex = RegExp(pattern.toString());
                                  if (!regex.hasMatch(value!)) {
                                    return 'Minimum of 8 chars, 1 letter, 1 number and 1 special char';
                                  }
                                  return null;
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const ParentScreen()));
                                }
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Don't have an account?"),
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
                            const SizedBox(height: 8),
                            Container(
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
                                  children: const [
                                    Icon(
                                      FontAwesomeIcons.facebook,
                                      size: 40,
                                      color: Colors.blue,
                                    ),
                                    const SizedBox(width: 12),
                                    Text('Signin with Facebook',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
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
                                            color: Colors.white, fontSize: 20)),
                                  ],
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
}
