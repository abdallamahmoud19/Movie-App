import 'package:flutter/material.dart';

import 'package:untitled7/screens/home_screen/home_screen.dart';
import 'package:untitled7/screens/login/login_screen.dart';
import 'package:untitled7/screens/onbording/onbording_screen.dart';
import 'package:untitled7/screens/register_screen/register_screen.dart';
import 'package:untitled7/screens/reset_password_screen/reset_password_screen.dart';
import 'package:untitled7/screens/update_profile/update_profile_screen.dart';
import 'package:untitled7/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        ResetPasswordScreen.routeName: (context) => ResetPasswordScreen(),
        UpdateProfileScreen.routeName: (context) => UpdateProfileScreen(),
        OnboardingScreen.routeName: (context) => OnboardingScreen(),
      },
    );
  }
}
