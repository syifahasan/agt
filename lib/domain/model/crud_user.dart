import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final DatabaseReference _databaseRef = FirebaseDatabase().reference();

final TextEditingController fullnameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController phoneNumberController = TextEditingController();

Future<void> getDataForLoggedInUser() async {
  User? user = _auth.currentUser;
  if (user != null) {
    String userId = user.uid;
    DataSnapshot dataSnapshot =
        (await _databaseRef.child('users/$userId').once()) as DataSnapshot;
    if (dataSnapshot.value != null) {
      Map<dynamic, dynamic>? userValues =
          dataSnapshot.value as Map<dynamic, dynamic>?;
      if (userValues != null) {
        String fullname = userValues['fullname'] ?? '';
        String email = userValues['email'] ?? '';
        String phoneNumber = userValues['phonenumber'] ?? '';

        fullnameController.text = fullname;
        emailController.text = email;
        phoneNumberController.text = phoneNumber;
      }
      // Lakukan sesuatu dengan data pengguna yang Anda dapatkan.
    }
  }
}
