
import 'package:flutter/material.dart';
import 'package:authentic_guards/utils/onboardingPage.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SFProDisplay',
      ),
      home: OnboardingPage1(),
    );
  }
}
