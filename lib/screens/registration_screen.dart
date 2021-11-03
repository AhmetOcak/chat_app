import 'package:flutter/material.dart';
import 'package:my_chat_app/components/my_textfield.dart';
import 'package:my_chat_app/components/my_elev_button.dart';

class RegisterionScreen extends StatelessWidget {
  const RegisterionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Hero(
                tag: 'logo',
                child: SizedBox(
                  child: Image.asset('assets/images/falling-star.png'),
                  height: MediaQuery.of(context).size.height / 4,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height / 3,
              child: const MyTextField(
                text: 'Enter your e-mail',
                isItObscure: false,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height / 3,
              child: const MyTextField(
                text: 'Enter your password',
                isItObscure: true,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const MyElevatedButton(text: 'Register', routeName: '/chat'),
          ],
        ),
      ),
    );
  }
}
