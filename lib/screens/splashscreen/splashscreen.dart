import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:desafio_flutter/screens/home/home.dart';
import 'package:desafio_flutter/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
      splash: 'assets/splash.png',
      splashIconSize: 6000,
      nextScreen: LoginScreen(),
      splashTransition: SplashTransition.scaleTransition,
      duration: 3000,
    ));
  }
}
