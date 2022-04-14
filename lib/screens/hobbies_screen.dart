import 'package:flutter/material.dart';
import 'package:signup_login_flow_jan31/components/onboarding_appbar.dart';
import 'package:signup_login_flow_jan31/models/profile.dart';
import 'package:signup_login_flow_jan31/screens/images_screen.dart';

class HobbiesScreen extends StatelessWidget {
  Profile profile;

  HobbiesScreen(this.profile);

  final List<String> hobbiesList = [
    'Running',
    'Netflix',
    'Yoga',
    'Cooking',
    'Gym',
    'Reading',
    'Music'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OnboardingAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Text(
                'What do you enjoy doing?',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 33.0),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                '${profile.firstName}, choose your main passions in life',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22.0),
              ),
              SizedBox(
                height: 30.0,
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: hobbiesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 90.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Hobby(profile: profile, hobbiesList: hobbiesList, hobbyIndex: index),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0, top: 20.0),
                child: Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ImagesScreen(profile),
                        ),
                      );
                    },
                    child: Text('Continue'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Hobby extends StatefulWidget {
   Hobby({
    Key? key,
    required this.profile,
    required this.hobbiesList,
    required this.hobbyIndex,
  }) : super(key: key);

  final Profile profile;
  final List<String> hobbiesList;
  final int hobbyIndex;


  @override
  State<Hobby> createState() => _HobbyState();
}

class _HobbyState extends State<Hobby> {

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: isChecked ? Colors.blue : Colors.white,
        onPrimary: isChecked ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        side: BorderSide(
          width: 1.0,
          color: Colors.black,
        ),
        textStyle: TextStyle(
          fontSize: 20,
        ),
      ),
      onPressed: () {
        setState(() {
          isChecked = !isChecked;
        });
        isChecked ? widget.profile.hobbies.add(widget.hobbiesList[widget.hobbyIndex]) : widget.profile.hobbies.remove(widget.hobbiesList[widget.hobbyIndex]);
        print(widget.profile.hobbies);
        //nothing
      },
      child: Text(
        widget.hobbiesList[widget.hobbyIndex],
      ),
    );
  }
}


