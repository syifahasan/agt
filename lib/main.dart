import 'package:authentic_guards/pages/store/favoritePage.dart';
import 'package:flutter/material.dart';
import 'package:authentic_guards/utils/onboardingPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: FavoritePage(),
    );
  }
}
