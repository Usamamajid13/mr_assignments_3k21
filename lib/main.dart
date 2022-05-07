import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'about_us_screen.dart';
import 'constants.dart';
import 'home_screen.dart';
import 'splash_screen.dart';
import 'why_us_screen.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: blueColor, // navigation bar color
      statusBarColor: blueColor, // status bar color
    ));
    return MaterialApp(
      title: 'Mr. Assignments 3K21',
      debugShowCheckedModeBanner: false,
      initialRoute: splashRoute,
      routes: {
        splashRoute: (context) => const SplashScreen(),
        homeScreenRoute: (context) => const HomeScreen(),
        aboutUsScreenRoute: (context) => const AboutUsScreen(),
        whyUsScreenRoute: (context) => const WhyUsScreen(),
      },
    );
  }
}
