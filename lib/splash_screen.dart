import 'package:flutter/material.dart';
import 'package:untitled7/screens/onbording/onbording_screen.dart';

import 'package:untitled7/utils/assets_manger.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
          context, OnboardingScreen.routeName); // أو HomeScreen.routeName
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AssetsManger.splashScreen,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
