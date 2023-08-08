import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:get/get.dart';

import 'package:page_route_animator/page_route_animator.dart';
import 'package:redsquad/view/NavBar.dart';
import 'package:redsquad/view/bottomnav.dart';
import 'package:redsquad/view/login_screen.dart';
import 'package:redsquad/view/requests_screen.dart';
import 'package:redsquad/view/support_screen.dart';
import 'package:redsquad/view/welcome_screen.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  int index = 0;
  final _formKey = GlobalKey<FormState>();
  Map loginData = {"fullname": "", "username": "", "password": ""};

  signUp() {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {}
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const NavBar(),
      backgroundColor: const Color.fromARGB(255, 244, 245, 253),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 53),
              child: Container(
                width: 170,
                height: 120,
                alignment: Alignment.center,
                child: Image.asset('assets/logo.png'),
              ),
            ),
            SizedBox(
              height: 19,
            ),
            Text(
              'Community',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 9,
            ),
            // Text(
            //   "What's your emergency?",
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     fontSize: 17,
            //   ),
            // ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(top: 55),
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarController(), );
  }
}
