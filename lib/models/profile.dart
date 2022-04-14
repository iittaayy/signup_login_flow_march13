import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile {
  String firstName;
  String lastName;
  String email;
  String? password;
  List hobbies = [];
  int? age;
  String? gender;
  String? relationshipStatus;
  String? city;
  String? interestedIn;
  Uint8List? image;

  Profile(this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.age,
      this.gender,
      this.hobbies,
      this.city,
      this.interestedIn,
      this.relationshipStatus,
      this.image,);

  Map<String, dynamic> toJason() =>
      {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'age': age,
        'gender': gender,
        'hobbies': hobbies,
        'city': city,
        'interestedIn': interestedIn,
        'relationshipStatus': relationshipStatus,
        'profileImage': image,
      };


  // This takes in a Document Snapshot from Firestore and return a Profile model
  // static Profile fromSnap(DocumentSnapshot snapshot) {
  //   var snap = snapshot.data() as Map<String, dynamic>;
  //
  //   return Profile(
  //       firstName: snap['firstName'];
  //       lastName: snap['lastName'];
  //       email: snap['email'];
  //   age: snap['age'];
  //   hobbies: snap['hobbies'];
  //   gender: snap['gender'];
  //   city: snap['city'];
  //   interestedIn: snap['interestedIn'];
  //   relationshipStatus: snap['relationshipStatus'];
  //   profileImage: snap['profileImage'];
  //   );
  // }
}
