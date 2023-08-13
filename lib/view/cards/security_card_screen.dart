import 'package:flutter/material.dart';
import 'package:redsquad/view/bottomnav.dart';

class SecurityCardScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 245, 253),
      body: Column(
        children: [
          Container(
            width: double.infinity,
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
                  height: 8,
                ),
                Text(
                  'My Virtual Card ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/seccard.jpeg', // Replace with your image asset path
              fit: BoxFit.scaleDown,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarController(
        scaffoldKey: _scaffoldKey,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: SecurityCardScreen()));
}
