import 'package:flutter/material.dart';
import 'package:signup_login_flow_jan31/components/onboarding_appbar.dart';
import 'package:signup_login_flow_jan31/models/profile.dart';

class ProfileScreen extends StatelessWidget {


  Profile profile;

  ProfileScreen(this.profile);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OnboardingAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${profile.firstName} ${profile.lastName}',
                style: TextStyle(fontSize: 35.0),
              ),
              SizedBox(
                height: 50.0,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 150,
                    backgroundImage: profile.image != null ? MemoryImage(profile.image!) : null,
                  ),
                  Positioned(
                    bottom: -5,
                    left: 200,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_a_photo, size: 50.0, color: Colors.blueAccent,),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Text('${profile.hobbies.join(", ")}',
                  style: TextStyle(fontSize: 25.0)),
            ],
          ),
        ),
      ),
    );
  }
}
