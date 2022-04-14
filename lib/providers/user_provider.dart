import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:signup_login_flow_jan31/models/profile.dart';

class UserProvider with ChangeNotifier {
  Profile? _user;

  //Creating a get method to get the user's data + ! not going to be null
  Profile get getUser => _user!;

  // Future<void> refreshUser(){
  //
  // }
}
