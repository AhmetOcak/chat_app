import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
                height: MediaQuery.of(context).size.height / 2.5,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            const MyElevatedButton(
              text: 'Log in',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            const MyElevatedButton(
              text: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/login');
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
