import 'package:flutter/material.dart';
import 'dart:async';

// Replace 'main.dart' with your main application file name
import 'package:redsquad/main.dart';
import 'package:redsquad/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      // After 2 seconds, navigate to the main screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen(data: {},)), // Replace MyApp with your main application widget
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/logo.png',height:100,width:100), // Replace 'splash.png' with your splash screen image
      ),
    );
  }
}
