import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:signup_login_flow_jan31/models/profile.dart' as model;
import 'package:signup_login_flow_jan31/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Future<model.Profile> getUserDetails() async {
  //   User currentUser = _auth.currentUser!;
  //
  //   DocumentSnapshot snap = await _firestore.collection('users').doc(currentUser.uid).get();
  //
  //   return model.Profile.fromSnap(snap);
  // }

// user sign-up
  Future<String> signUpUser({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required List hobbies,
    required Uint8List profileImage,
  }) async {
    String res = 'Error has occured';
    try {
      if (email.isNotEmpty ||
          firstName.isNotEmpty ||
          lastName.isNotEmpty ||
          password.isNotEmpty ||
          profileImage.isNotEmpty) {
        // register user
        UserCredential userCred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(userCred.user!.uid);

        //add image to storage
        String imageURL = await StorageMethods().uploadImageToFireStore('profileImage', profileImage);

        //add to our Firestore database
        await _firestore.collection('users').doc(userCred.user!.uid).set({
          'email': email,
          'uid': userCred.user!.uid,
          'firstName': firstName,
          'lastName': lastName,
          'hobbies': hobbies,
          'password': password,
          // 'profileImage': profileImage,
          'profileImage': imageURL,
        });

        res = 'Success';
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  // login user

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'Error has occured';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);

      } else{
        res = 'Please enter all fields';
      }
      res = 'Success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
