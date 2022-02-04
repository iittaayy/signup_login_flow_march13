import 'package:flutter/material.dart';
import 'package:signup_login_flow_jan31/components/main_button.dart';
import 'package:signup_login_flow_jan31/screens/login_screen.dart';
import 'package:signup_login_flow_jan31/screens/registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const String screenID = 'welcome_screen';


  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 200.0,
                  child: Image.asset('assets/images/space_logo_flutter.jpg'),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                MainButton(
                  fieldLabel: 'Login',
                  onPress: (){
                    Navigator.pushNamed(context, LoginScreen.screenID);
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                MainButton(fieldLabel: 'Sign Up', onPress: (){
                  Navigator.pushNamed(context, RegistrationScreen.screenID);
                },),
              ],
            ),
          ),
        ),
      ),
    );

  }
}

