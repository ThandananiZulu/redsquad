import 'package:flutter/material.dart';

import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:redsquad/view/armedresponse_screen.dart';
import 'package:redsquad/view/cards/security_card_screen.dart';
import 'package:redsquad/view/community_screen.dart';
import 'package:redsquad/view/fireresponse_screen.dart';
import 'package:redsquad/view/medicalresponse_screen.dart';
import 'package:redsquad/view/privateescort_screen.dart';
import 'package:redsquad/view/profile_screen.dart';
import 'package:redsquad/view/reports_screen.dart';
import 'package:redsquad/view/requests_screen.dart';
import 'package:redsquad/view/response_screen.dart';
import 'package:redsquad/view/review_screen.dart';
import 'package:redsquad/view/security_screen.dart';
import 'package:redsquad/view/welcome_screen.dart';

import 'login_screen.dart';

class SecurityNavBar extends StatelessWidget {
  const SecurityNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 166,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage(
                      "assets/security.jpeg"), // Replace with your image path
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(
                        0.3), // Adjust the opacity to control fading
                    BlendMode.dstATop,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40, // Customize the radius as needed
                    backgroundImage:
                        AssetImage("assets/profile.jpeg"), // Your image path
                  ),
                  SizedBox(height: 10), // Adjust the spacing as needed
                  Text("Thulani Xulu", style: TextStyle(fontSize: 16)),
                  // Add more text or widgets as needed
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          // ListTile(
          //   leading: Icon(Icons.home),
          //   title: const Text('Home'),
          //   onTap: () => Navigator.of(context).push(MaterialPageRoute(
          //       builder: (context) => const SecurityScreen())), //SignOut Page
          // ),
          ListTile(
            leading: Icon(Icons.directions_run_outlined),
            title: const Text('Response'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ResponseScreen())), //SignOut Page
          ),
          ListTile(
            leading: Icon(Icons.book_online_outlined),
            title: const Text('Reports'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    const ReportsScreen())), //SignOut Page
          ),
           ListTile(
            leading: Icon(Icons.graphic_eq_outlined),
            title: const Text('Community'),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => CommunityScreen())), //SignOut Page
            //Home Page
          ),
          ListTile(
            leading: Icon(Icons.card_membership_outlined),
            title: const Text('Virtual Card'),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => SecurityCardScreen())), //SignOut Page
            //Home Page
          ),
            ListTile(
              leading: Icon(Icons.logout_outlined),
              title: Text('Logout'),
              onTap: () async => {
                    await logout(),
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginScreen(
                        data: {},
                      ),
                    )),
                  } //SignOut Page
              //Drivers Page with table
              ),
        ],
      ),
    );
  }

  logout() async {
    var sessionManager = await SessionManager();

    await sessionManager.set("username", "");
    dynamic id = await SessionManager().get("username");
  }
}
