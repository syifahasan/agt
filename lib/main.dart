import 'package:authentic_guards/model/user.dart';
import 'package:authentic_guards/pages/home.dart';
import 'package:authentic_guards/pages/notification.dart';
import 'package:authentic_guards/pages/profile/profile.dart';
import 'package:authentic_guards/pages/scanner/scanner.dart';
import 'package:authentic_guards/pages/store/bestDeal.dart';
import 'package:authentic_guards/pages/store/store.dart';
import 'package:authentic_guards/utils/navigationBar.dart';
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
export 'main.dart';

bool _scannerActive = false;
final routes = {
  '/MainPage': (BuildContext context) => MainPage(),
  '/HomePage': (BuildContext context) => HomePage(),
  '/ProfilePage': (BuildContext context) => ProfilePage(),
  '/StorePage': (BuildContext context) => StorePage(),
  '/NotifPage': (BuildContext context) => NotifPage(),
  '/ScannerPAge': (BuildContext context) =>
      ScannerPage(isScannerActive: _scannerActive),
};

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool isFirstTime = prefs.getBool('is_first_time') ?? true;

  runApp(MultiProvider(
    providers: [
      Provider<UserModelProvider>(
        create: (context) => UserModelProvider(),
      ),
      Provider<CartProvider>(
        create: (context) => CartProvider(),
      ),
    ],
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
        ...routes,
        '/LoginPage': (context) => isFirstTime
            ? OnboardingPage1()
            : PageLogin(), // Gantikan dengan halaman utama Anda
      },
    );
  }
}
<<<<<<< HEAD
=======

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My Flutter ',
//       initialRoute: '/',
//       routes: {
//         '/': (context) => changePass(),
//       },
//     );
//   }
// }
>>>>>>> dce8a91e823e4ec4163c61f470bf75ae49c2439a
