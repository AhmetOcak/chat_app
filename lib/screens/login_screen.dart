import 'package:flutter/material.dart';
import 'package:my_chat_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String email = '';
  String password = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        shadowColor: secondaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: secondaryColor,
          ),
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
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    boxShadow,
                  ],
                ),
                child: TextField(
                  cursorColor: secondaryColor,
                  cursorWidth: 2,
                  controller: _emailController,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: textFieldDecoration.copyWith(
                    hintText: 'Enter your email',
                  ),
                  style: const TextStyle(
                    color: backgroundColor,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height / 3,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    boxShadow,
                  ],
                ),
                child: TextField(
                  cursorColor: secondaryColor,
                  cursorWidth: 2,
                  controller: _passwordController,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: textFieldDecoration.copyWith(
                    hintText: 'Enter your password',
                  ),
                  style: const TextStyle(
                    color: backgroundColor,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () async {
                FocusScope.of(context).unfocus();
                setState(() {
                  isLoading = true;
                });
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (user != null) {
                    setState(() {
                      isLoading = false;
                    });
                    Navigator.pushNamed(context, '/chat');
                  }
                } catch (e) {
                  setState(() {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('Error'),
                        content: Text(
                          e.toString().substring(e.toString().indexOf(']') + 1,
                              e.toString().length),
                        ),
                        backgroundColor: errorColor,
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _emailController.clear();
                              _passwordController.clear();
                            },
                            child: const Text(
                              'Ok',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    );
                    isLoading = false;
                  });
                }
              },
              child: const Text(
                'Log in',
                style: TextStyle(
                  color: backgroundColor,
                ),
              ),
              style: buttonStyle,
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: isLoading
                  ? const LinearProgressIndicator(
                      color: secondaryColor,
                      backgroundColor: Colors.black54,
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
