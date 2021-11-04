import 'package:flutter/material.dart';

InputDecoration textFieldDecoration = InputDecoration(
  hintStyle: const TextStyle(
    color: Colors.grey,
    fontSize: 15,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
  ),
  filled: true,
  fillColor: Colors.grey[100],
);

ButtonStyle buttonStyle = ButtonStyle(
  minimumSize: MaterialStateProperty.all(const Size(300, 50)),
  splashFactory: InkSplash.splashFactory,
  backgroundColor: MaterialStateProperty.all(Colors.blue),
  elevation: MaterialStateProperty.all(7),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    ),
  ),
);
