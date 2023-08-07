
import 'package:flutter/material.dart';

import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:redsquad/view/armedresponse_screen.dart';
import 'package:redsquad/view/community_screen.dart';
import 'package:redsquad/view/fireresponse_screen.dart';
import 'package:redsquad/view/medicalresponse_screen.dart';
import 'package:redsquad/view/privateescort_screen.dart';
import 'package:redsquad/view/profile_screen.dart';
import 'package:redsquad/view/requests_screen.dart';
import 'package:redsquad/view/review_screen.dart';
import 'package:redsquad/view/welcome_screen.dart';

import 'login_screen.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 25,
          ),
          const ListTile(
            title: Center(
              child: Text(''
                  'MENU'),
            ),
            subtitle: Center(child: Text("RED SQUAD SECURITY")),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    const WelcomeScreen())), //SignOut Page
          ), ListTile(
            leading: Icon(Icons.book_online),
            title: const Text('Armed Response'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ArmedresponseScreen())), //SignOut Page
          ),
          ListTile(
            leading: Icon(Icons.inventory_rounded),
            title: const Text('Medical Response'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MedicalresponseScreen())), //SignOut Page
          ),
          ListTile(
            leading: Icon(Icons.price_check_outlined),
            title: const Text('Fire Response'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const FireresponseScreen())), //SignOut Page
          ),
          ListTile(
            leading: Icon(Icons.view_agenda_outlined),
            title: const Text('Private Escort'),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => PrivateescortScreen())), //SignOut Page
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
            leading: Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => ProfileScreen())), //SignOut Page
            //Home Page
          ),
          ListTile(
              leading: Icon(Icons.logout_outlined),
              title: Text('Logout'),
              onTap: () async => {
                    await logout(),
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginScreen(data: {},),
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
