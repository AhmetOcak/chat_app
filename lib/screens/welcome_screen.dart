import 'package:flutter/material.dart';
import 'package:my_chat_app/components/my_elev_button.dart';

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
              routeName: '/login',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            const MyElevatedButton(
              text: 'Register',
              routeName: '/register',
            ),
          ],
        ),
      ),
    );
  }
}

