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
  User? _user;
  String _status = 'Not logged in';

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
                onPressed: _loginWithFacebook,
                icon: Image.asset('assets/other/logofb.png')),
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

  Future<void> _loginWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        // Firebase integration starts here
        final AccessToken? accessToken = result.accessToken;
        AuthCredential credential =
            FacebookAuthProvider.credential(accessToken!.token);
        await FirebaseAuth.instance.signInWithCredential(credential);
        // Firebase integration ends here

        setState(() {
          _status = 'Logged in with Facebook';
        });
      } else {
        setState(() {
          _status = 'Failed to login with Facebook';
        });
      }
    } catch (error) {
      print(error);
      setState(() {
        _status = 'Failed to login with Facebook';
      });
    }
  }
}
