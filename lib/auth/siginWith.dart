import 'package:authentic_guards/utils/navigationBar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:authentic_guards/utils/dialogWelcomeUser.dart';

class siginWith extends StatefulWidget {
  const siginWith({super.key});

  @override
  State<siginWith> createState() => _siginWithState();
}

class _siginWithState extends State<siginWith> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final databaseReference = FirebaseDatabase.instance.reference();
  String _status = 'Not logged in';

  void addUser(String userId, String fullName, String email) {
    databaseReference.child("users/$userId").set({
      'fullName': fullName,
      'email': email,
      'createdAt': DateTime.now().toIso8601String(),
    }).catchError((error) {
      print("Error when adding user: $error");
    });
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        // final User? user = authResult.user;
        final User? user = userCredential.user;
        // Jika masuk berhasil, tambahkan pengguna ke Firebase Realtime Database
        if (user != null) {
          addUser(user.uid, user.displayName!, user.email!);
        }
        // Pindah ke HomePage setelah login google
        Navigator.of(context).pushReplacementNamed('/MainPage');
        final userAfterSigin = FirebaseAuth.instance.currentUser;
        final userName = '${userAfterSigin?.displayName}';
        DialogUtils.showWelcomeDialog(context, userName);
      }
    } catch (error) {
      print(error);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: w * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: w * 0.15,
            height: w * 0.15,
            child: IconButton(
                onPressed: () async {
                  try {
                    await signInWithGoogle();
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: $e')),
                    );
                  }
                },
                icon: Image.asset('assets/other/logoGoogle.png')),
          ),
          Container(
            width: w * 0.15,
            height: w * 0.15,
            child: IconButton(
                onPressed: () async {
                  User? user = await signInWithFacebook();
                  if (user != null) {
                    print("Logged in with Facebook as ${user.displayName}");
                  } else {
                    print("Failed to log in with Facebook");
                  }
                },
                icon: Image.asset('assets/other/logofb.png')),
          ),
        ],
      ),
    );
  }

  Future<User?> signInWithFacebook() async {
    try {
      final LoginResult facebookLoginResult =
          await FacebookAuth.instance.login();
      if (facebookLoginResult.status == LoginStatus.success) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(
                facebookLoginResult.accessToken!.token);
        final UserCredential userCredential = await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
        return userCredential.user;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
