import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'logo',
              child: SizedBox(
                child: Image.asset('assets/images/falling-star.png'),
                height: MediaQuery.of(context).size.height / 4,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height / 3,
              child: const MyTextField(text: 'Enter your e-mail', isItObscure: false,),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height / 3,
              child: const MyTextField(text: 'Enter your password', isItObscure: true,),
            ),
          ],
        ),
      ),
    );
  }
}

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
