import 'dart:async';
import 'package:flutter/material.dart';

import 'constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashNavigator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blueColor,
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              'https://mrassignments3k21.com/wp-content/uploads/2022/04/a-1.png',
              scale: 2,
            ),
          ),
        ));
  }

  splashNavigator() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, homeScreenRoute);
    });
  }
}
