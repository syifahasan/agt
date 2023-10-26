import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class UserModel {
  final String? fullName;
  UserModel({this.fullName});
}

class UserModelProvider with ChangeNotifier {
  final databaseReference = FirebaseDatabase.instance.reference();
  User? _currentUser = FirebaseAuth.instance.currentUser;
  UserModel? _userModel;

  UserModelProvider() {
    _fetchUserData();
    // Mendengar perubahan user
    FirebaseAuth.instance.authStateChanges().listen((user) {
      _currentUser = user;
      _fetchUserData();
    });
  }

  UserModel? get userModel => _userModel;

  void _fetchUserData() {
    if (_currentUser != null) {
      databaseReference
          .child('users')
          .child(_currentUser!.uid)
          .child('fullName')
          .onValue
          .listen((DatabaseEvent event) {
        // Menggunakan event.snapshot untuk mendapatkan DataSnapshot
        String? retrievedName = event.snapshot.value?.toString();
        if (retrievedName != null && retrievedName.length > 9) {
          retrievedName = retrievedName.substring(0, 9);
        }
        _userModel = UserModel(fullName: retrievedName);
        notifyListeners(); // Memberi tahu widget yang mendengarkan untuk memperbarui diri mereka
      });
    } else {
      _userModel = null;
      notifyListeners();
    }
  }
}
