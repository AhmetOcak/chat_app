import 'package:flutter/material.dart';

InputDecoration textFieldDecoration = InputDecoration(
  hintStyle: const TextStyle(
    color: backgroundColor,
    fontSize: 15,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
  ),
  fillColor: primaryColor,
  filled: true,
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: primaryColor,
      width: 1.0,
    ),
    borderRadius: BorderRadius.circular(30),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: primaryColor,
      width: 1.0,
    ),
    borderRadius: BorderRadius.circular(30),
  ),
);

ButtonStyle buttonStyle = ButtonStyle(
  minimumSize: MaterialStateProperty.all(const Size(300, 50)),
  splashFactory: InkSplash.splashFactory,
  backgroundColor: MaterialStateProperty.all(secondaryColor),
  elevation: MaterialStateProperty.all(20),
  shadowColor: MaterialStateProperty.all(secondaryColor),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    ),
  ),
);

BoxShadow boxShadow = const BoxShadow(
  color: primaryColor,
  blurStyle: BlurStyle.normal,
  blurRadius: 30.0,
);

const Color primaryColor = Color(0xFFFF0266);
const Color primaryVariantColor = Color(0xFF3700B3);
const Color secondaryColor = Color(0xFF03DAC6);
const Color backgroundColor = Color(0xFF121212);
const Color errorColor = Color(0xFFCF6679);
