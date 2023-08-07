import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';

import 'package:page_route_animator/page_route_animator.dart';
import 'package:redsquad/view/NavBar.dart';
import 'package:redsquad/view/armedresponse_screen.dart';
import 'package:redsquad/view/community_screen.dart';
import 'package:redsquad/view/fireresponse_screen.dart';
import 'package:redsquad/view/login_screen.dart';
import 'package:redsquad/view/medicalresponse_screen.dart';
import 'package:redsquad/view/privateescort_screen.dart';
import 'package:redsquad/view/profile_screen.dart';
import 'package:redsquad/view/requests_screen.dart';
import 'package:redsquad/view/review_screen.dart';
import 'package:redsquad/view/sos_screen.dart';
import 'package:redsquad/view/specialrequest_screen.dart';
import 'package:redsquad/view/support_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int index = 0;
  final _formKey = GlobalKey<FormState>();
  Map loginData = {"fullname": "", "username": "", "password": ""};
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isCountingDown = false;
  int countDown = 9;
  Timer? countdownTimer;
  bool isImageVisible = true;
  int beepDuration = 10; // The total duration of the beep effect in seconds
  Timer? beepTimer;
  void startCountDown() {
    isCountingDown = true;
    countDown = 9;
    startBeepEffect();
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        countDown--;
      });

      if (countDown <= 0) {
        isCountingDown = false;
        timer.cancel();
        // stopBeepEffect();
        setState(() {
          beepTimer?.cancel();
          beepTimer = null;
          isCountingDown = false;
          countDown = 5;
          isImageVisible = true;
        });
        Get.to(const SosScreen());
      }
    });
  }

  void stopCountDown() {
    stopBeepEffect();

    if (countdownTimer != null && countdownTimer!.isActive) {
      countdownTimer!.cancel();
      setState(() {
        isCountingDown = false;
        countDown = 5;
        isImageVisible = true;
      });
    }
  }

  void startBeepEffect() {
    beepTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        isImageVisible = !isImageVisible;
        beepDuration--;

        // Stop the beep effect after 10 seconds
        if (beepDuration == 0) {
          stopBeepEffect();
        }
      });
    });
  }

  void stopBeepEffect() {
    beepTimer?.cancel();
    beepTimer = null;
  }

  @override
  void dispose() {
    stopBeepEffect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const NavBar(),
      backgroundColor: const Color.fromARGB(255, 244, 245, 253),
      body: Container(
        decoration: BoxDecoration(
          image: isImageVisible
              ? DecorationImage(
                  image: AssetImage('assets/back2.jpeg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    const Color.fromARGB(255, 255, 255, 255).withOpacity(
                        0.5), // Adjust the opacity value (0.0 to 1.0)
                    BlendMode
                        .lighten, // Adjust the BlendMode as needed for different effects
                  ),
                )
              : null,
          color: isImageVisible ? null : Colors.red,
        ),
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
            //  Text(
            //   'Home',
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     fontSize: 29,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            SizedBox(
              height: 9,
            ),
            Text(
              "What's your emergency?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(top: 55),
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                        SizedBox(
                            width: 150,
                            height: 120,
                            child: ElevatedButton(
                              onPressed: () async {
                                Navigator.push(
                                  context,
                                  PageRouteAnimator(
                                    child: const MedicalresponseScreen(),
                                    routeAnimation:
                                        RouteAnimation.topToBottomWithScale,
                                    settings: const RouteSettings(),
                                    curve: Curves.slowMiddle,
                                    duration: const Duration(milliseconds: 500),
                                    reverseDuration:
                                        const Duration(milliseconds: 200),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.local_hospital_outlined,
                                    size: 80,
                                    color: Colors.red.shade800,
                                  ),
                                  Text(
                                    "Medical Response",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: 150,
                            height: 120,
                            child: ElevatedButton(
                              onPressed: () async {
                                Navigator.push(
                                  context,
                                  PageRouteAnimator(
                                    child: const MedicalresponseScreen(),
                                    routeAnimation:
                                        RouteAnimation.topToBottomWithScale,
                                    settings: const RouteSettings(),
                                    curve: Curves.slowMiddle,
                                    duration: const Duration(milliseconds: 500),
                                    reverseDuration:
                                        const Duration(milliseconds: 200),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.security_outlined,
                                    size: 80,
                                    color: Colors.red.shade800,
                                  ),
                                  Text(
                                    "Armed Response",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
  ],
                      ),
                      Column(
                        children: [
                        SizedBox(
                            width: 150,
                            height: 120,
                            child: ElevatedButton(
                              onPressed: () async {
                                Navigator.push(
                                  context,
                                  PageRouteAnimator(
                                    child: const MedicalresponseScreen(),
                                    routeAnimation:
                                        RouteAnimation.topToBottomWithScale,
                                    settings: const RouteSettings(),
                                    curve: Curves.slowMiddle,
                                    duration: const Duration(milliseconds: 500),
                                    reverseDuration:
                                        const Duration(milliseconds: 200),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 6),
                                  Icon(
                                    Icons.fire_extinguisher_outlined,
                                    size: 80,
                                    color: Colors.red.shade800,
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "Fire Response",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 120,
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () async {
                                Navigator.push(
                                  context,
                                  PageRouteAnimator(
                                    child: const SpecialrequestScreen(),
                                    routeAnimation:
                                        RouteAnimation.topToBottomWithScale,
                                    settings: const RouteSettings(),
                                    curve: Curves.slowMiddle,
                                    duration: const Duration(milliseconds: 500),
                                    reverseDuration:
                                        const Duration(milliseconds: 200),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_circle_outline,
                                    size: 80,
                                    color: Colors.red.shade800,
                                  ),
                                  const SizedBox(height: 1),
                                  Text(
                                    "Special Request",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
     ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.blue.shade100,
            labelTextStyle: MaterialStateProperty.all(TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ))),
        child: NavigationBar(
            height: 60,
            backgroundColor: Colors.grey.shade300,
            selectedIndex: index,
            onDestinationSelected: (index) {
              switch (index) {
                case 0:
                  _scaffoldKey.currentState?.openDrawer();
                  break;
                case 1:
                  Get.to(
                      WelcomeScreen()); // Navigate to CommunityScreen for "Community" tab
                  break;
                case 2:
                  Get.to(
                      SupportScreen()); // Navigate to ReviewsScreen for "Reviews" tab
                  break;
                case 3:
                  Get.to(
                      ProfileScreen()); // Navigate to ProfileScreen for "Profile" tab
                  break;
              }
              setState(() {
                this.index = index;
              });
            },
            destinations: [
              NavigationDestination(
                  icon: Icon(Icons.menu_outlined), label: "Menu"),
              NavigationDestination(
                  icon: Icon(Icons.home_outlined), label: "Home"),
              NavigationDestination(
                  icon: Icon(Icons.menu_book_outlined), label: "Support"),
              NavigationDestination(
                  icon: Icon(Icons.person_outlined), label: "Profile")
            ]),
      ),
      floatingActionButton: SizedBox(
        height: 80,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey, width: 2),
          ),
          child: FloatingActionButton(
            backgroundColor:
                isCountingDown ? Colors.red : Color.fromARGB(255, 31, 89, 155),
            onPressed: () {
              if (isCountingDown) {
                stopCountDown();
              } else {
                showToast("Press again to cancel");
                startCountDown();
              }
            },
            child: isCountingDown
                ? Text(
                    countDown.toString(),
                    style: TextStyle(fontSize: 20),
                  )
                : Icon(Icons.sos, size: 36),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void showToast(toast) => Fluttertoast.showToast(
        msg: toast,
        fontSize: 18,
      );
}
