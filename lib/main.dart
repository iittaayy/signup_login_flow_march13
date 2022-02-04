import 'package:flutter/material.dart';
import 'package:signup_login_flow_jan31/screens/chat_screen.dart';
import 'package:signup_login_flow_jan31/screens/registration_screen.dart';
import 'package:signup_login_flow_jan31/screens/welcome_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      initialRoute: WelcomeScreen.screenID,
      routes: {
        LoginScreen.screenID: (context) => const LoginScreen(),
        RegistrationScreen.screenID: (context) => const RegistrationScreen(),
        WelcomeScreen.screenID: (context) => const WelcomeScreen(),
        ChatScreen.screenID: (context) => const ChatScreen(),
      },
    );
  }
}


