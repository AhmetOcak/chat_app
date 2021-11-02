import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key, required this.text, required this.isItObscure}) : super(key: key);
  final String text;
  final bool isItObscure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isItObscure,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 15,
      ),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        filled: true,
        fillColor: Colors.grey[100],
      ),
    );
  }
}
