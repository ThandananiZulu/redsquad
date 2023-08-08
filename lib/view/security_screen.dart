import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';

import 'package:page_route_animator/page_route_animator.dart';
import 'package:redsquad/view/SecurityNavBar.dart';
import 'package:redsquad/view/bottomnav.dart';
import 'package:redsquad/view/reports_screen.dart';
import 'package:redsquad/view/response_screen.dart';
import 'package:redsquad/view/welcome_screen.dart';
import 'package:redsquad/view/profile_screen.dart';
import 'package:redsquad/view/sos_screen.dart';
import 'package:redsquad/view/support_screen.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
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
      drawer: const SecurityNavBar(),
      backgroundColor: const Color.fromARGB(255, 244, 245, 253),
      body: Container(
        decoration: BoxDecoration(
          image: isImageVisible
              ? DecorationImage(
                  image: const AssetImage('assets/security.jpeg'),
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
            Container(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 55, bottom: 25),
                  child: Container(
                    width: 140,
                    height: 120,
                    alignment: Alignment.center,
                    color: Colors.white, // Set the background color to white
                    child: Image.asset('assets/logo.png'),
                  ),
                ),
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
              height: 12,
            ),
            Text(
              "Hi Thokozani Xulu",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(top: 45),
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
                                    child: const ResponseScreen(),
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
                                    Icons.directions_run,
                                    size: 80,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    "Response",
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
                                    child: const ReportsScreen(),
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
                                    Icons.report_outlined,
                                    size: 80,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "Reports",
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
      bottomNavigationBar: BottomNavigationBarController(),   floatingActionButton: SizedBox(
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

