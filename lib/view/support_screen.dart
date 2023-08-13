import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import 'package:redsquad/view/NavBar.dart';
import 'package:redsquad/view/bottomnav.dart';
import 'package:redsquad/view/login_screen.dart';
import 'package:redsquad/view/profile_screen.dart';
import 'package:redsquad/view/requests_screen.dart';
import 'package:redsquad/view/welcome_screen.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  int index = 0;
  final _formKey = GlobalKey<FormState>();
  String idOrPass = 'ID Number';
  bool isSwitched = true;
  String? scanResult;

  final TextEditingController _scanController = TextEditingController();

  String? dropdownValue;
  String? scenarioValue;
  late String claimant;
  late String scene;

  List<bool> isSelected = [true, false];
  signUp() {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {}
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var maxLines = 2;
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
              height: 8,
            ),
            Text(
              'Contact Us',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(children: [
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                       SizedBox(
                        height: 33,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
            
            Column(
            
                children: [
                  ContactLine(
                    icon: Icons.phone,
                    label: 'Emergency Number:',
                    info: '081 308 2174',
                  ),
                  ContactLine(
                    icon: Icons.phone,
                    label: 'Customer Care:',
                    info: '081 308 2174',
                  ),
                  ContactLine(
                    icon: Icons.phone,
                    label: 'Whatsapp:',
                    info: '071 458 6817',
                  ),
                  ContactLine(
                    icon: Icons.email,
                    label: 'Email Support:',
                    info: ' support@redsquadsecurity.co.za',
                  ),
                ],
              ),
            
          
          
          
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarController(
        scaffoldKey: _scaffoldKey,
      ),
    );
  }

 }


class ContactLine extends StatelessWidget {
  final IconData icon;
  final String label;
  final String info;

  const ContactLine({
    required this.icon,
    required this.label,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon),
          SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Text(info),
        ],
      ),
    );
  }
}
