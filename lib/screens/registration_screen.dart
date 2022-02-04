import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signup_login_flow_jan31/screens/chat_screen.dart';
import 'package:signup_login_flow_jan31/screens/login_screen.dart';
import 'package:signup_login_flow_jan31/components/main_field.dart';
import 'package:signup_login_flow_jan31/components/onboarding_appbar.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  static const String screenID = 'registration_screen';


  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _auth = FirebaseAuth.instance;

  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    // Email Field
    final emailField = MainField(fieldController: emailEditingController,
      label: 'Email Address',
      fieldIcon: Icons.mail,
      obscureText: false,);

    // Password Field
    final passwordField = MainField(fieldController: passwordEditingController,
      label: 'Enter Password',
      fieldIcon: Icons.password,
      obscureText: true,);

    // Confirm Password Field
    final confirmPasswordField = MainField(fieldController: confirmPasswordController,
      label: 'Confirm Password',
      fieldIcon: Icons.vpn_key_rounded,
      obscureText: true,);

    // Full Name Field
    final nameField = MainField(fieldController: nameController,
      label: 'Enter Your Name',
      fieldIcon: Icons.person,
      obscureText: false,);


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
                        child: Image.asset(
                            'assets/images/space_logo_flutter.jpg'),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      nameField,
                      const SizedBox(
                        height: 15.0,
                      ),
                      emailField,
                      const SizedBox(
                        height: 15.0,
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
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              try{
                                final newUser = await _auth.createUserWithEmailAndPassword(email: emailEditingController.text, password: passwordEditingController.text);
                                if (newUser != null) {
                                  Navigator.pushNamed(context, ChatScreen.screenID);
                                }
                              } catch (e){
                                print(e);
                              }
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                          }, child: Text('Sign Up',
                          style: TextStyle(fontSize: 16.0,),),),
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
                              Navigator.pushNamed(context, LoginScreen.screenID);
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

