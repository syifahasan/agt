import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:authentic_guards/auth/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:authentic_guards/firebase_options.dart';
import 'package:authentic_guards/utils/onboardingPage.dart';
import 'package:authentic_guards/utils/provider/cartProvider.dart';
import 'package:authentic_guards/utils/splashscreeen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool isFirstTime = prefs.getBool('is_first_time') ?? true;

  runApp(ChangeNotifierProvider(
    create: (context) => CartProvider(),
    child: MyApp(isFirstTime),
  ));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  MyApp(this.isFirstTime);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SFProDisplay',
      ),
      home: SplashScreen(),
      routes: {
        '/home': (context) => isFirstTime
            ? OnboardingPage1()
            : PageLogin(), // Gantikan dengan halaman utama Anda
      },
    );
  }
}


