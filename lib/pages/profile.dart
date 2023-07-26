import 'package:authentic_guards/auth/login.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              semanticsLabel: 'Circular progress indicator',
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return PageLogin();
                }));
              },
              child: Text('Logout',
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFFEEEDED)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
