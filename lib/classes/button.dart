import 'package:flutter/material.dart';
import 'package:mylibrary/screens/login.dart';

Widget myButtons(String text, final VoidCallback onPressed) {
  return MaterialButton(
    onPressed: onPressed,
    child: Text(text,
        style: TextStyle(color: Colors.white, fontSize: 25),
        textAlign: TextAlign.center),
    color: Colors.purple,
    height: 50,
    minWidth: double.infinity,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  );
}
