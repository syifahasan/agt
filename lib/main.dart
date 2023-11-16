import 'package:authentic_guards/data/di/inject_container.dart';
import 'package:authentic_guards/data/repository/config/api_constant.dart';
import 'package:authentic_guards/domain/model/body/user_local_body.dart';
import 'package:authentic_guards/domain/model/user.dart';
import 'package:authentic_guards/pages/home.dart';
import 'package:authentic_guards/pages/notification.dart';
import 'package:authentic_guards/pages/profile/addpin.dart';
import 'package:authentic_guards/pages/profile/privacy.dart';
import 'package:authentic_guards/pages/profile/profile.dart';
import 'package:authentic_guards/pages/scanner/scanner.dart';
import 'package:authentic_guards/pages/scanner/scanner_views.dart';
import 'package:authentic_guards/pages/store/store.dart';
import 'package:authentic_guards/service/auth/auth_cubit.dart';
import 'package:authentic_guards/service/observer.dart';
import 'package:authentic_guards/theme/app_notifier.dart';
import 'package:authentic_guards/utils/navigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:authentic_guards/auth/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:authentic_guards/firebase_options.dart';
import 'package:authentic_guards/utils/onboardingPage.dart';
import 'package:authentic_guards/utils/provider/cartProvider.dart';
import 'package:authentic_guards/utils/splashscreeen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

// bool _scannerActive = false;
final routes = {
  '/HomePage': (BuildContext context) => HomePage(),
  '/StorePage': (BuildContext context) => StorePage(),
  '/ScannerPAge': (BuildContext context) => ScannerViews(),
  '/NotifPage': (BuildContext context) => NotifPage(),
  '/ProfilePage': (BuildContext context) => ProfilePage(),
};

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserLocalBodyAdapter());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await init(ApiConstant.baseUrl);

  await _determinePosition();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    BlocOverrides.runZoned(
      () async {
        runApp(
          MultiProvider(
            providers: [
              ChangeNotifierProvider<UserModelProvider>(
                create: (context) => UserModelProvider(),
              ),
              ChangeNotifierProvider<CartProvider>(
                create: (context) => CartProvider(),
              ),
              ChangeNotifierProvider<AppNotifier>(
                create: (context) => AppNotifier(),
              ),
            ],
            child: MyApp(),
          ),
        );
      },
      blocObserver: AgtObserver(),
    );
  });
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => AuthCubit(),
            )
          ],
          child: BlocBuilder<AuthCubit, LoggedEnum>(
            builder: (context, state) {
              return MaterialApp(
                // Remove any properties that were specific to GetMaterialApp
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  fontFamily: 'SF Pro Display',
                ),
                home: state == LoggedEnum.loading ? SplashScreen() : ScannerViews(),
                // Add your routes here if needed
                routes: {
                  '/SplashScreen': (context) => SplashScreen(),
                  '/OnboardingPage1': (context) => OnboardingPage1(),
                  '/LoginPage': (context) => PageLogin(),
                  '/MainPage': (BuildContext context) => MainPage(),
                },
              );
            },
          ),
        );
      },
    );
  }
}


