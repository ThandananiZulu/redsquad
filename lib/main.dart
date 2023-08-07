import 'package:flutter/material.dart';

import 'package:flutter_session_manager/flutter_session_manager.dart';

import 'package:get/get.dart';
import 'package:page_route_animator/page_route_animator.dart';
import 'package:redsquad/view/login_screen.dart';
import 'package:redsquad/view/splash_screen.dart';
import 'package:redsquad/view/welcome_screen.dart';


void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      
      home: 
          SplashScreen()
    );
  }
}
