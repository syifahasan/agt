import 'package:authentic_guards/utils/navigationBar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class siginWith extends StatefulWidget {
  const siginWith({super.key});

  @override
  State<siginWith> createState() => _siginWithState();
}

class _siginWithState extends State<siginWith> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  String _status = 'Not logged in';

  Future<User?> signInWithGoogle() async {
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

        final UserCredential authResult =
            await _auth.signInWithCredential(credential);
        final User? user = authResult.user;

        return user;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }

  void _navigateToHomePage(User? user) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => MainPage(),
      ),
    );
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
                  final User? user = await signInWithGoogle();
                  if (user != null) {
                    // Pengguna berhasil login menggunakan Google.
                    _navigateToHomePage(user);
                  } else {
                    // Login gagal atau dibatalkan.
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Login dengan Google gagal.'),
                      ),
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
