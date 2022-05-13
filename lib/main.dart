import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'about_us_screen.dart';
import 'chat_screen.dart';
import 'constants.dart';
import 'google_sign_in.dart';
import 'home_screen.dart';
import 'splash_screen.dart';
import 'why_us_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: blueColor,
      statusBarColor: blueColor,
    ));
    return MaterialApp(
      builder: EasyLoading.init(),
      title: 'Mr. Assignments 3K21',
      debugShowCheckedModeBanner: false,
      initialRoute: splashRoute,
      routes: {
        splashRoute: (context) => const SplashScreen(),
        homeScreenRoute: (context) => const HomeScreen(),
        aboutUsScreenRoute: (context) => const AboutUsScreen(),
        whyUsScreenRoute: (context) => const WhyUsScreen(),
        googleSignInScreen: (context) => const GoogleSignInScreen(),
        chatScreenRoute: (context) {
          var i = ModalRoute.of(context)!.settings.arguments;
          return  ChatScreen(i);
        },
      },
    );
  }
}
