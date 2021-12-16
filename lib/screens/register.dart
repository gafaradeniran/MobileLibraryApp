import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mylibrary/classes/button.dart';
import 'package:mylibrary/menupages/home.dart';
import 'package:mylibrary/screens/login.dart';
import 'package:mylibrary/styles.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _fullname, _email, _password;
  final List<String> departments = [
    'Science',
    'Art',
    'Commercial',
    'Technical'
  ];
  String? selectedValue;
  bool agree = false;
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
                size: 35, color: Colors.white),
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: 215,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.purple,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(100)),
                ),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text('Hello!\n Signup to\n get started',
                            style: regStyle)),
                    const Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage('assets/libraryAppImage.png'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: [
                      TextFormField(
                        autofocus: false,
                        controller: _fullname,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'full name',
                          labelText: 'full name',
                          prefixIcon:
                              const Icon(Icons.person, color: Colors.black),
                        ),
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
                        hint: const Text('Select your Department',
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
                      TextFormField(
                        autofocus: false,
                        controller: _email,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'email address',
                          labelText: 'email',
                          prefixIcon: const Icon(Icons.email_outlined,
                              color: Colors.black),
                        ),
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
                      TextFormField(
                          autofocus: false,
                          controller: _password,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintText: 'passwords',
                            labelText: 'password',
                            prefixIcon:
                                const Icon(Icons.lock, color: Colors.black),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            Pattern pattern =
                                r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$";
                            RegExp regex = RegExp(pattern.toString());
                            if (!regex.hasMatch(value!)) {
                              return 'Minimum of 8 chars, 1 letter, 1 number and 1 special char';
                            }
                            return null;
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
                          Text('I agree to the'),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'terms and conditions',
                              style: TextStyle(color: Colors.purple),
                            ),
                          ),
                        ],
                      ),
                      myButtons(
                        'SIGN UP',
                        () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (_) => const HomeScreen()));
                          if (_formKey.currentState!.validate()) {
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(content: Text('Processing Data')));
                            debugPrint(
                                'Registration Successful!!! ${_email!.text} - ${_password!.text}');
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?',
                              style: TextStyle(fontSize: 17)),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const Login()));
                              },
                              child: const Text(
                                'sign in',
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
    );
  }

  @override
  void initState() {
    super.initState();
    _fullname = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _fullname!.dispose();
    _email!.dispose();
    _password!.dispose();
  }
}
