import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

Future<void> signOut() async {
      //logout firebase
      try {
        await FirebaseAuth.instance.signOut();
        print("Logged out from Firebase successfully!");
      } catch (e) {
        print("Error logging out from Firebase: $e");
      }

      //logout google
      try {
        var googleSignIn;
        await googleSignIn.signOut();
        print("User Signed Out from Google");
      } catch (e) {
        print("Error logging out from Google: $e");
      }

      //logoutfacebook

      try {
        await FirebaseAuth.instance.signOut();
        await FacebookAuth.instance.logOut();
        print("Logged out from Facebook successfully!");
      } catch (e) {
        print("Error logging out: $e");
      }
    }