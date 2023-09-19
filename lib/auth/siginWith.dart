import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class siginWith extends StatefulWidget {
  const siginWith({super.key});

  @override
  State<siginWith> createState() => _siginWithState();
}

class _siginWithState extends State<siginWith> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  User? _user;
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: w * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_user != null)
            Column(
              children: [
                Text('Signed in successfully: ${_user!.displayName}'),
                ElevatedButton(
                  child: Text('Sign out'),
                  onPressed: () async {
                    await signOut();
                    setState(() {
                      _user = null;
                    });
                  },
                ),
              ],
            )
          else
            Container(
              width: w * 0.15,
              height: w * 0.15,
              child: IconButton(
                  onPressed: () async {
                    final user = await signInWithGoogle();
                    if (user != null && !user.isAnonymous) {
                      setState(() {
                        _user = user;
                      });
                      print(
                          'Successfully signed in with Google: ${user.displayName}');
                    } else {
                      print('Failed to sign in with Google');
                    }
                  },
                  icon: Image.asset('assets/other/logoGoogle.png')),
            ),
          Container(
            width: w * 0.15,
            height: w * 0.15,
            child: IconButton(
                onPressed: () {}, icon: Image.asset('assets/other/logofb.png')),
          ),
        ],
      ),
    );
  }

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

        if (user != null &&
            !user.isAnonymous &&
            await user.getIdToken() != null) {
          return user;
        }
      }
      return null;
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<void> signOut() async {
    await googleSignIn.signOut();
    await _auth.signOut();
  }
}
