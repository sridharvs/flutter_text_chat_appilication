import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obsureText;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obsureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obsureText,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black26,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          fillColor: Colors.amber,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black)),
    );
  }
}
