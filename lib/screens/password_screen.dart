import 'package:flutter/material.dart';
import 'package:signup_login_flow_jan31/screens/hobbies_screen.dart';
import 'package:signup_login_flow_jan31/components/main_field.dart';
import 'package:signup_login_flow_jan31/components/onboarding_appbar.dart';
import 'package:signup_login_flow_jan31/models/profile.dart';


class PasswordScreen extends StatelessWidget {
  static const String screenID = 'password_screen';

  final Profile profile;

  PasswordScreen(this.profile);


  final TextEditingController passwordEditingController =
      TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                        child:
                            Image.asset('assets/images/space_logo_flutter.jpg'),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Text(
                          'Welcome to the Matchers community! It is great to have you here ${profile.firstName}', style: TextStyle(fontSize: 22.0)),
                      const SizedBox(
                        height: 35.0,
                      ),
                      Text('Just to make sure we got it right, this is your signing up email address ${profile.email}', style: TextStyle(fontSize: 16.0),),
                      const SizedBox(
                        height: 35.0,
                      ),
                      passwordField,
                      const SizedBox(
                        height: 15.0,
                      ),
                      confirmPasswordField,
                      const SizedBox(
                        height: 15.0,
                      ),
                      // Main Button
                      SizedBox(
                        height: 50.0,
                        width: double.infinity, // <-- match_parent
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              profile.password = passwordEditingController.text;
                              try {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        HobbiesScreen(profile),
                                  ),
                                );
                              } catch (e) {
                                print(e);
                              }
                            }
                          },
                          child: Text(
                            'Keep Going!',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
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
