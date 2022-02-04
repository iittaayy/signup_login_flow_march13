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
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}