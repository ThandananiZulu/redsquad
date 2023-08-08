import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:get/get.dart';

import 'package:page_route_animator/page_route_animator.dart';
import 'package:redsquad/view/NavBar.dart';
import 'package:redsquad/view/bottomnav.dart';
import 'package:redsquad/view/login_screen.dart';
import 'package:redsquad/view/requests_screen.dart';
import 'package:redsquad/view/support_screen.dart';
import 'package:redsquad/view/welcome_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int index = 0;
  final _formKey = GlobalKey<FormState>();
  Map loginData = {"fullname": "", "username": "", "password": ""};

  signUp() {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {}
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var maxLines = 3;
    return Scaffold(
      key: _scaffoldKey,
      drawer: const NavBar(),
      backgroundColor: const Color.fromARGB(255, 244, 245, 253),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 88),
              child: Text(
                'My Profile',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 9,
            ),
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image(image: AssetImage('assets/claims.png')),
              ),
            ),

            // Text(
            //   "What's your emergency?",
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     fontSize: 17,
            //   ),
            // ),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          style: TextStyle(
                            color: Colors.grey, // Setting text color to gray
                          ),
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            label: Text('Username:'),
                          ),
                          onSaved: (value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Username required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          style: TextStyle(
                            color: Colors.black, // Setting text color to gray
                          ),
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            label: Text('Name and surname:'),
                          ),
                          onSaved: (value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Name and surname required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: maxLines * 24.0,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: " Physical address:",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                            ),
                            keyboardType: TextInputType.multiline,
                            maxLines: maxLines,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          style: TextStyle(
                            color: Colors.black, // Setting text color to gray
                          ),
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            label: Text('Cell number:'),
                          ),
                          onSaved: (value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Cell number required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          style: TextStyle(
                            color: Colors.black, // Setting text color to gray
                          ),
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            label: Text('Email:'),
                          ),
                          onSaved: (value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
