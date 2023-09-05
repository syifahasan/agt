import 'package:authentic_guards/utils/provider/cartProvider.dart';
import 'package:flutter/material.dart';
import 'package:authentic_guards/utils/onboardingPage.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MyApp(),
    ),
  );
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
