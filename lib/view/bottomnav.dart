import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:redsquad/view/premium_screen.dart';
import 'package:redsquad/view/profile_screen.dart';
import 'package:redsquad/view/security_screen.dart';
import 'package:redsquad/view/support_screen.dart';
import 'package:redsquad/view/welcome_screen.dart';

class BottomNavigationBarController extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey; // Add this parameter

  BottomNavigationBarController({required this.scaffoldKey}); // Constructor

  @override
  _BottomNavigationBarControllerState createState() =>
      _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController> {
  int index = 1;
  String role = "basic";

  Future<void> getRole() async {
    SessionManager sessionManager = new SessionManager();
    role = await sessionManager.get('role');
  }

  @override
  Widget build(BuildContext context) {
    getRole();
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: Colors.blue.shade100,
        labelTextStyle: MaterialStateProperty.all(TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        )),
      ),
      child: NavigationBar(
        height: 60,
        backgroundColor: Colors.grey.shade300,
        selectedIndex: index,
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              widget.scaffoldKey.currentState?.openDrawer();
              break;
            case 1:
              Get.to(role == "premium"
                  ? PremiumScreen()
                  : role == "security"
                      ? SecurityScreen()
                      : WelcomeScreen());
              break;
            case 2:
              Get.to(SupportScreen());
              break;
            case 3:
              Get.to(ProfileScreen());
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
          NavigationDestination(
              icon: Icon(Icons.person_outlined), label: "Profile"),
        ],
      ),
    );
  }
}
