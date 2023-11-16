import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isMounted = false;

  @override
  void initState() {
    super.initState();
    _isMounted = true;
    FirebaseAuth.instance.userChanges().listen((User? user) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final bool isFirstTime = prefs.getBool('is_first_time') ?? true;
      if (_isMounted) {
        if (user != null) {
          Navigator.pushReplacementNamed(context, '/MainPage');
        } else {
          String initialRoute = isFirstTime ? '/OnboardingPage1' : '/LoginPage';
          Navigator.pushReplacementNamed(context, initialRoute);
        }
      }
    });
  }

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/other/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          // Centered Image
          Center(
            child: Image.asset('assets/other/logosc.png',
                width: w * 0.45, height: w * 0.45),
          ),
        ],
      ),
    );
  }
}
