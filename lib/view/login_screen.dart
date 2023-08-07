import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:get/get.dart';
import 'package:redsquad/controller/login_controller.dart';
import 'package:redsquad/view/premium_screen.dart';
import 'package:redsquad/view/welcome_screen.dart';

class LoginScreen extends StatefulWidget {
  final Map data;
  const LoginScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String idOrPass = 'ID Number';
  bool isSwitched = true;
  String? scanResult;

  final TextEditingController _scanController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  Map signInData = {
    "firstname": "",
    "type": "id",
    "id": "",
    "surname": "",
    "mobile": "",
    "planID": "",
    "dbGroup": "",
    "email": "",
    "queryType": "",
  };
  Map<String, dynamic>? _userData;
  LoginController controller = Get.put(LoginController());
  @override
  void initState() {
    super.initState();
    signInData["planID"] = widget.data["planId"];
    signInData["dbGroup"] = widget.data["dbGroup"];
    signInData["queryType"] = widget.data["queryType"];
  }

  signIn() async {
    Get.to(WelcomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 245, 253),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/backimg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 55, bottom: 55),
                  child: Container(
                    width: 230,
                    height: 120,
                    alignment: Alignment.center,
                    child: Image.asset('assets/logo.png'),
                  ),
                ),
              ),
              Text(
                'Log In',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                             Container(
                            color: Colors
                                .white, // Add white background to the field
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                label: Text('Username'),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical:
                                      15, // Adjust the vertical padding as needed
                                  horizontal:
                                      15, // Adjust the horizontal padding as needed
                                ),
                              ),
                              onSaved: (value) {
                                signInData['username'] = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Username required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            color: Colors
                                .white, // Add white background to the field
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                label: Text('Password'),
                               contentPadding: EdgeInsets.symmetric(
                                  vertical:
                                      15, // Adjust the vertical padding as needed
                                  horizontal:
                                      15, // Adjust the horizontal padding as needed
                                ),
                              ),
                              
                              onSaved: (value) {
                                signInData['password'] = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password required';
                                }
                                return null;
                              },
                            ),
                          ), const SizedBox(
                            height: 45,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueGrey,
                                  foregroundColor: Colors.white,
                                  elevation: 8,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 30),
                                ),
                                onPressed: () {
                                  Get.to(WelcomeScreen());
                                },
                                child: Text("Login"),
                              ),
                            ),
                          ),
                         
                          SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  elevation: 8,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 30),
                                ),
                                onPressed: () {
                                  Get.to(PremiumScreen());
                                },
                                child: Text("Premium"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
