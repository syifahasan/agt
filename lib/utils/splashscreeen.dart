import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/LoginPage');
    });
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
              'assets/other/bg.png', // ganti dengan nama gambar background Anda
              fit: BoxFit.cover,
            ),
          ),
          // Centered Image
          Center(
            child: Image.asset('assets/other/logosc.png',
                width: w * 0.45,
                height: w * 0.45), // atur ukuran sesuai keinginan
          ),
        ],
      ),
    );
  }
}
