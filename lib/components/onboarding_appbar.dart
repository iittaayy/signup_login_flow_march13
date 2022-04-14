import 'package:flutter/material.dart';

// Helpful https://stackoverflow.com/questions/52678469/the-appbardesign-cant-be-assigned-to-the-parameter-type-preferredsizewidget

class OnboardingAppBar extends StatelessWidget with PreferredSizeWidget {
  const OnboardingAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(
          onPressed: ()
          {Navigator.pop(context);},
          icon: const Icon(Icons.arrow_back, size: 24.0, color: Colors.black,)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}




// // super helpful https://www.youtube.com/watch?v=IxCeJS9yA8w&list=PL_D-RntzgLvbbB7Uub06wW44znOoWJro4&index=17
// final db = FirebaseFirestore.instance;

// ElevatedButton(
// child: Text('Keep Going'),
// onPressed: () async {
// // await db.collection('profile').add(profile.toJason());
// Navigator.pushNamed(context, WelcomeScreen.screenID);
// },
// ),