import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon, suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextInputType? keyboardType;
  const CustomTextField({
    Key? key,
    required this.controller,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.onSaved,
    this.validator, this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller,
        autofocus: false,
        keyboardType: keyboardType,
        inputFormatters: [],
        decoration: InputDecoration(
          labelText: label,
          prefix: prefixIcon,
          suffixIcon: suffixIcon,
          labelStyle: const TextStyle(color: Colors.black),
          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(20.0),
          // ),
          fillColor: Colors.white,
        ),
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}
