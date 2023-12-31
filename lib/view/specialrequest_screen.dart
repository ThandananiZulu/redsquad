import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:page_route_animator/page_route_animator.dart';
import 'package:redsquad/view/NavBar.dart';
import 'package:redsquad/view/bottomnav.dart';
import 'package:redsquad/view/login_screen.dart';
import 'package:redsquad/view/profile_screen.dart';
import 'package:redsquad/view/requests_screen.dart';
import 'package:redsquad/view/support_screen.dart';
import 'package:redsquad/view/welcome_screen.dart';

class SpecialrequestScreen extends StatefulWidget {
  const SpecialrequestScreen({Key? key}) : super(key: key);

  @override
  State<SpecialrequestScreen> createState() => _SpecialrequestScreenState();
}

class _SpecialrequestScreenState extends State<SpecialrequestScreen> {
  int index = 0;
  final _formKey = GlobalKey<FormState>();
  Map loginData = {"fullname": "", "username": "", "password": ""};
  bool _isExpanded = true;
  String? date;

  var sessionManager = SessionManager();
  String? dropdownValue;
  DateTime? selectedDate;
  signUp() {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {}
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      lastDate: DateTime(2100),
      firstDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        DateTime dateTime = DateTime.parse(selectedDate.toString()).toLocal();
        date = DateFormat('yyyy-MM-dd').format(dateTime);
      });
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var maxLines = 5;
    return Scaffold(
      key: _scaffoldKey,
      drawer: const NavBar(),
      backgroundColor: const Color.fromARGB(255, 244, 245, 253),
      body: SingleChildScrollView(
        child: Container(
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
                'Special Request',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 9,
              ),
              SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(22),
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          TextFormField(
                            onTap: () {
                              _selectDate(context);
                            },
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: 'Select date:',
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(left: 22.0),
                                child: GestureDetector(
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                  child: const Icon(
                                      size: 14, Icons.calendar_today),
                                ),
                              ),
                            ),
                            controller: TextEditingController(
                              text: selectedDate != null ? date : '',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  _isExpanded = true;
                                });
                                return 'Date of death required';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(50),
                            child: SizedBox(
                              height: maxLines * 50.0,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Describe situation: ",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.multiline,
                                maxLines: maxLines,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                  elevation: 8, // Elevation (shadow)

                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  // You can add more styles as needed
                ),
                onPressed: () {
                  Get.to(WelcomeScreen());
                },
                child: Text("Request Special Service")),
          ),
        )
      ],
      bottomNavigationBar: BottomNavigationBarController(
        scaffoldKey: _scaffoldKey,
      ),
    );
  }
}
