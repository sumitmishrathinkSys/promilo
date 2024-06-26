import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final String? hintText;
  final double? hintTextSize;
  final Widget? prefixIcon; // For leading icon
  final Widget? suffixIcon; // For trailing icon

  CustomTextField({
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.validator,
    this.hintText,
    this.hintTextSize,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: hintTextSize),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.0, color: Colors.black),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusColor: Colors.black,
        prefixIcon: prefixIcon, // Adding the leading icon
        suffixIcon: suffixIcon, // Adding the trailing icon
      ),
      obscureText: obscureText,
      validator: validator,
    );
  }
}
