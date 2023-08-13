import 'package:flutter/material.dart';

import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:redsquad/view/armedresponse_screen.dart';
import 'package:redsquad/view/cards/premium_card_screen.dart';
import 'package:redsquad/view/community_screen.dart';
import 'package:redsquad/view/fireresponse_screen.dart';
import 'package:redsquad/view/medicalresponse_screen.dart';
import 'package:redsquad/view/pay_screen.dart';
import 'package:redsquad/view/premium_screen.dart';
import 'package:redsquad/view/privateescort_screen.dart';
import 'package:redsquad/view/profile_screen.dart';
import 'package:redsquad/view/requests_screen.dart';
import 'package:redsquad/view/review_screen.dart';
import 'package:redsquad/view/transit_screen.dart';
import 'package:redsquad/view/welcome_screen.dart';

import 'login_screen.dart';

class PremiumNavBar extends StatelessWidget {
  const PremiumNavBar({super.key});

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
                      "assets/premium.jpeg"), // Replace with your image path
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
          //       builder: (context) => const PremiumScreen())), //SignOut Page
          // ),
          // ListTile(
          //   leading: Icon(Icons.book_online),
          //   title: const Text('Armed Response'),
          //   onTap: () => Navigator.of(context).push(MaterialPageRoute(
          //       builder: (context) =>
          //           const ArmedresponseScreen())), //SignOut Page
          // ),
          // ListTile(
          //   leading: Icon(Icons.inventory_rounded),
          //   title: const Text('Medical Response'),
          //   onTap: () => Navigator.of(context).push(MaterialPageRoute(
          //       builder: (context) =>
          //           const MedicalresponseScreen())), //SignOut Page
          // ),
          // ListTile(
          //   leading: Icon(Icons.price_check_outlined),
          //   title: const Text('Fire Response'),
          //   onTap: () => Navigator.of(context).push(MaterialPageRoute(
          //       builder: (context) =>
          //           const FireresponseScreen())), //SignOut Page
          // ),
          ListTile(
            leading: Icon(Icons.view_agenda_outlined),
            title: const Text('Private Escort'),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) =>
                        PrivateescortScreen())), //SignOut Page
            //Home Page
          ),
           ListTile(
            leading: Icon(Icons.view_agenda_outlined),
            title: const Text('Cash-In Transit'),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) =>
                        TransitScreen())), //SignOut Page
            //Home Page
          ),
          ListTile(
            leading: Icon(Icons.view_agenda_outlined),
            title: const Text('My requests'),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => RequestsScreen())), //SignOut Page
            //Home Page
          ),
          ListTile(
            leading: Icon(Icons.view_agenda_outlined),
            title: const Text('Reviews'),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => ReviewScreen())), //SignOut Page
            //Home Page
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
            leading: Icon(Icons.credit_score_outlined),
            title: const Text('Pay'),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => PayScreen())), //SignOut Page
            //Home Page
          ),
          ListTile(
            leading: Icon(Icons.card_membership_outlined),
            title: const Text('Virtual Card'),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => PremiumCardScreen())), //SignOut Page
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
