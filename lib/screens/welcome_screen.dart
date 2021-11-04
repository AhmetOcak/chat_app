import 'package:flutter/material.dart';
import '../constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'logo',
              child: SizedBox(
                child: Image.asset('assets/images/falling-star.png'),
                height: MediaQuery.of(context).size.height / 2.7,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text(
                'Log in',
                style: TextStyle(
                  color: backgroundColor,
                ),
              ),
              style: buttonStyle,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text(
                'Register',
                style: TextStyle(
                  color: backgroundColor,
                ),
              ),
              style: buttonStyle,
            ),
          ],
        ),
      ),
    );
  }
}

