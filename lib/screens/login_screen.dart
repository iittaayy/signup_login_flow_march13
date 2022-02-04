import 'package:flutter/material.dart';
import 'package:signup_login_flow_jan31/screens/registration_screen.dart';
import 'package:signup_login_flow_jan31/components/main_field.dart';
import 'package:signup_login_flow_jan31/components/form_button.dart';
import 'package:signup_login_flow_jan31/components/onboarding_appbar.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String screenID = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final emailField = MainField(fieldController: emailController, label: 'Email Address', fieldIcon: Icons.mail, obscureText: false,);
    final passwordField = MainField(fieldController: passwordController, label: 'Enter Password', fieldIcon: Icons.password,obscureText: true,);


    return Scaffold(
      appBar: const OnboardingAppBar(),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      //Logo
                      SizedBox(
                        height: 200.0,
                        child: Image.asset('assets/images/space_logo_flutter.jpg'),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      emailField,
                      const SizedBox(
                        height: 15.0,
                      ),
                      passwordField,
                      const SizedBox(
                        height: 15.0,
                      ),
                      FormButton(formKey: _formKey),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          Text("Don't have an account? "),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, RegistrationScreen.screenID);
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
                // Email

              ],
            ),
          ),
        ),
      ),
    );
  }
}






