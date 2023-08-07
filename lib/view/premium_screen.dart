import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';

import 'package:page_route_animator/page_route_animator.dart';
import 'package:redsquad/view/NavBar.dart';
import 'package:redsquad/view/community_screen.dart';

import 'package:redsquad/view/medicalresponse_screen.dart';

import 'package:redsquad/view/profile_screen.dart';
import 'package:redsquad/view/requests_screen.dart';

import 'package:redsquad/view/sos_screen.dart';
import 'package:redsquad/view/specialrequest_screen.dart';
import 'package:redsquad/view/support_screen.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({Key? key}) : super(key: key);

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
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
      backgroundColor: Color.fromARGB(255, 253, 244, 244),
      body: Container(
        decoration: BoxDecoration(
          image: isImageVisible
              ? DecorationImage(
                  image: AssetImage('assets/premium.jpeg'),
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
                          ElevatedButton(
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
                                Image.asset(
                                  'assets/profile.jpeg',
                                  width: 80,
                                  height: 50,
                                  fit: BoxFit.fitWidth,
                                ),
                                Text(
                                  "Medical",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  " Response",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 6),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
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
                                Image.asset(
                                  'assets/shop.jpeg',
                                  width: 80,
                                  height: 50,
                                  fit: BoxFit.fitWidth,
                                ),
                                Text(
                                  "Armed",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  " Response",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 6),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
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
                                Image.asset(
                                  'assets/transit.jpeg',
                                  width: 80,
                                  height: 50,
                                  fit: BoxFit.fitWidth,
                                ),
                                Text(
                                  "Cash-in",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  " Transit",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 6),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          ElevatedButton(
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
                                Image.asset(
                                  'assets/policy.jpeg',
                                  width: 80,
                                  height: 50,
                                  fit: BoxFit.fitWidth,
                                ),
                                Text(
                                  "Fire",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  " Response",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 6),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
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
                                Image.asset(
                                  'assets/escort.jpeg',
                                  width: 80,
                                  height: 50,
                                  fit: BoxFit.fitWidth,
                                ),
                                Text(
                                  "Private",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Escort",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 6),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
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
                              children: [
                                const SizedBox(height: 6),
                                Image.asset(
                                  'assets/party.jpg',
                                  width: 80,
                                  height: 50,
                                  fit: BoxFit.fitWidth,
                                ),
                                Text(
                                  "Special",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Request",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 6),
                              ],
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
                      CommunityScreen()); // Navigate to CommunityScreen for "Community" tab
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
              NavigationDestination(icon: Icon(Icons.menu_outlined), label: "Menu"),
              NavigationDestination(icon: Icon(Icons.home_outlined), label: "Home"),
              NavigationDestination(
                  icon: Icon(Icons.menu_book_outlined), label: "Support"),
              NavigationDestination(icon: Icon(Icons.person_outlined), label: "Profile")
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
