import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({Key? key, required this.text, required this.routeName}) : super(key: key);
  final String text;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(300, 50)),
        splashFactory: InkSplash.splashFactory,
        backgroundColor: MaterialStateProperty.all(Colors.blue),
        elevation: MaterialStateProperty.all(7),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }
}