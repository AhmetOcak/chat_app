import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/screens/chat_screen.dart';
import 'package:my_chat_app/screens/login_screen.dart';
import 'package:my_chat_app/screens/registration_screen.dart';
import 'package:my_chat_app/screens/welcome_screen.dart';

void main() async {
  // paketleri yüklerken meydana gelen hatayı gideren kod parçası 10-11
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/welcome',
    routes: {
      '/welcome': (context) => const WelcomeScreen(),
      '/login': (context) => const LoginScreen(),
      '/register': (context) => const RegisterionScreen(),
      '/chat': (context) => const ChatScreen(),
    },
  ));
}

