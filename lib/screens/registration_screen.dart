import 'package:flutter/material.dart';
import 'package:signup_login_flow_jan31/screens/password_screen.dart';
import 'package:signup_login_flow_jan31/screens/login_screen.dart';
import 'package:signup_login_flow_jan31/components/main_field.dart';
import 'package:signup_login_flow_jan31/components/onboarding_appbar.dart';
import 'package:signup_login_flow_jan31/models/profile.dart';

class RegistrationScreen extends StatelessWidget {
  static const String screenID = 'registration_screen';


  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Email Field
    final emailField = MainField(
      fieldController: emailEditingController,
      label: 'Email Address',
      fieldIcon: Icons.mail,
      obscureText: false,
    );

    // Password Field
    final passwordField = MainField(
      fieldController: passwordEditingController,
      label: 'Enter Password',
      fieldIcon: Icons.password,
      obscureText: true,
    );

    // Confirm Password Field
    final confirmPasswordField = MainField(
      fieldController: confirmPasswordController,
      label: 'Confirm Password',
      fieldIcon: Icons.vpn_key_rounded,
      obscureText: true,
    );

    // Full Name Field
    final firstNameField = MainField(
      fieldController: firstNameController,
      label: 'Enter First Name',
      fieldIcon: Icons.person,
      obscureText: false,
    );

    // Full Name Field
    final lastName = MainField(
      fieldController: lastNameController,
      label: 'Enter Last Name',
      fieldIcon: Icons.person,
      obscureText: false,
    );

    List hobbiesList = [];

    final newProfile = Profile(
      firstNameController.text,
      lastNameController.text,
      emailEditingController.text,
      null,
      null,
      null,
      hobbiesList,
      null,
      null,
      null,
      null,
    );

    return Scaffold(
      appBar: const OnboardingAppBar(),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      //Logo
                      SizedBox(
                        height: 70.0,
                        child: Image.asset('assets/images/space_logo_flutter.jpg'),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Join the community of friends setting up friends',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 25.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: SizedBox(
                                width: double.infinity,
                                height: 50.0,
                                child: ElevatedButton.icon(
                                  label: Text('Sign Up With Facebook'),
                                  icon: Icon(Icons.facebook),
                                  onPressed: null,
                                ),
                              ),
                            ),
                            Text(
                              'We never post to Facebook',
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 30.0,
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: SizedBox(
                          height: 70.0,
                          child: Text(
                            'OR',
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                      firstNameField,
                      const SizedBox(
                        height: 15.0,
                      ),
                      lastName,
                      const SizedBox(
                        height: 15.0,
                      ),
                      emailField,
                      const SizedBox(
                        height: 15.0,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      // Main Button
                      SizedBox(
                        height: 50.0,
                        width: double.infinity, // <-- match_parent
                        child: ElevatedButton(
                          onPressed: () async {
                            newProfile.firstName = firstNameController.text;
                            newProfile.lastName = lastNameController.text;
                            newProfile.email = emailEditingController.text;
                            if (_formKey.currentState!.validate()) {
                              try {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PasswordScreen(newProfile),
                                  ),
                                );
                              } catch (e) {
                                print(e);
                              }
                            }
                          },
                          child: Text(
                            'Start',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, LoginScreen.screenID);
                            },
                            child: const Text(
                              'Log In',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
