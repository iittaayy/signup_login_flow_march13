import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signup_login_flow_jan31/screens/profile_screen.dart';
import 'package:signup_login_flow_jan31/components/onboarding_appbar.dart';
import 'package:signup_login_flow_jan31/models/profile.dart';
import 'package:signup_login_flow_jan31/utils/utils.dart';
import 'package:signup_login_flow_jan31/resources/auth_methods.dart';
import 'dart:typed_data';

class ImagesScreen extends StatelessWidget {
  Profile profile;

  AuthMethods authMethods = AuthMethods();

  ImagesScreen(this.profile);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OnboardingAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Text(
                'Show them what you got!',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 33.0),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                '${profile.firstName}, choose the image that best represents you true self',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22.0),
              ),
              SizedBox(
                height: 30.0,
              ),
              PickAnImage(profile),
              SizedBox(
                height: 50.0,
              ),
              SizedBox(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    authMethods.signUpUser(
                        email: profile.email,
                        firstName: profile.firstName,
                        lastName: profile.lastName,
                        password: profile.password!,
                        hobbies: profile.hobbies,
                        profileImage: profile.image!);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(profile),
                      ),
                    );
                  },
                  child: Text('All Done!'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PickAnImage extends StatefulWidget {
  Profile profile;

  PickAnImage(this.profile);

  @override
  State<PickAnImage> createState() => _PickAnImageState();
}

class _PickAnImageState extends State<PickAnImage> {
  Uint8List? _profileImage;

  void selectImage() async {
    // With this video https://youtu.be/mEPm9w5QlJM?t=5307
    Uint8List im = await pickerImage(ImageSource.gallery);
    setState(() {
      _profileImage = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 150,
            backgroundImage:
                _profileImage != null ? MemoryImage(_profileImage!) : null,
          ),
          Positioned(
            bottom: -5,
            left: 200,
            child: IconButton(
              onPressed: () {
                selectImage();
                widget.profile.image = _profileImage;
              },
              icon: Icon(
                Icons.add_a_photo,
                size: 50.0,
                color: Colors.blueAccent,
              ),
            ),
          )
        ],
      ),
    );
  }
}
