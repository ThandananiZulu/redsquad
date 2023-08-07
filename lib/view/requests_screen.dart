import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:get/get.dart';

import 'package:page_route_animator/page_route_animator.dart';
import 'package:redsquad/view/NavBar.dart';
import 'package:redsquad/view/login_screen.dart';
import 'package:redsquad/view/support_screen.dart';
import 'package:redsquad/view/welcome_screen.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({Key? key}) : super(key: key);

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
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
    var maxLines = 5;
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
              'My Requests',
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
                      Container(
                        width: 330, // Adjust the width as needed
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Select Type Of Request:',
                          ),
                          value: dropdownValue,
                          onSaved: (String? value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'A type of request is required';
                            }
                            return null;
                          },
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue = value;

                              claimant = value!;
                              idOrPass = isSwitched
                                  ? claimant == 'holder'
                                      ? '  Provide Main Member ID Number'
                                      : '  Provide Beneficiary ID Number'
                                  : claimant == 'holder'
                                      ? 'Provide Main Member Passport'
                                      : 'Provide Beneficiary Passport';
                            });
                          },
                          items: [
                            DropdownMenuItem(
                              value: 'armed',
                              child: Text('Armed Response'),
                            ),
                            DropdownMenuItem(
                              value: 'fire',
                              child: Text('Fire Response'),
                            ),
                            DropdownMenuItem(
                              value: 'medical',
                              child: Text('Medical Response'),
                            ),
                            DropdownMenuItem(
                              value: 'escort',
                              child: Text('Private Escort'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 33,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
            Expanded(
              child: SingleChildScrollView(
                child: buildPlansList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.blue.shade100,
            labelTextStyle: MaterialStateProperty.all(TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ))),
        child: NavigationBar(
            height: 60,
            backgroundColor: Colors.grey.shade300,
            selectedIndex: index,
            onDestinationSelected: (index) {
              switch (index) {
                case 0:
                  _scaffoldKey.currentState?.openDrawer();
                  break;
                case 1:
                  Get.to(
                      WelcomeScreen()); // Navigate to CommunityScreen for "Community" tab
                  break;
                case 2:
                  Get.to(SupportScreen());
                  break;
                case 3:
                  Get.to(LoginScreen(
                    data: {},
                  )); // Navigate to ProfileScreen for "Profile" tab
                  break;
              }
              setState(() {
                this.index = index;
              });
            },
            destinations: [
              NavigationDestination(icon: Icon(Icons.menu), label: "Menu"),
              NavigationDestination(icon: Icon(Icons.home), label: "Home"),
              NavigationDestination(
                  icon: Icon(Icons.menu_book), label: "Support"),
              NavigationDestination(icon: Icon(Icons.person), label: "Profile")
            ]),
      ),
    );
  }

  Widget buildPlansList() {
    // print(widget.plansList);

    List<Widget> planDataWidgets = [];

    var claimsList = [
      {"hello": "world"},
      {"hello": "world"}
    ];

    for (int i = 0; i < claimsList.length; i++) {
      String planName = claimsList[i]?['policyNumber'] ?? 'ffff';
      String premium = claimsList[i]?['fileNumber'] ?? 'ffff';
      String firstname = claimsList[i]?['deceasedFirstname'] ?? 'fff';
      String surname = claimsList[i]?['deceasedSurname'] ?? 'fff';
      String arrangerDate = claimsList[i]?['arrangerDate'] ?? 'ff';
      String planID = claimsList[i]?['internalStatus'] ?? "fff";
      String brightrockStatus = claimsList[i]?['brightRockStatus'] ?? "ff";
      String cover = claimsList[i]?['fullAmount'] ?? "fff";
      var dbGroup = claimsList[i]?['dbGroup'] ?? "fff";

      var planId = planID;
      String logo = '';
      if (dbGroup == "heavens") {
        logo = 'assets/heavensgate.png';
      }
      if (dbGroup == "gwiliza") {
        logo = 'assets/gwiliza.png';
      }
      if (dbGroup == "tshipinoto") {
        logo = 'assets/tshipinoto.png';
      }
      if (dbGroup == "zokosani") {
        logo = 'assets/zokosani.png';
      }

      // if (brightrockStatus != "Assessed")
      planDataWidgets.add(
        PlanTile(
          icon: Icons.menu_book,
          title: 'Reference: ${planName}',
          subtitle: 'Date of request:  ${firstname} ${surname}',
          desc: ' ${cover}',
          status: 'Active',
          map: '',
          planID: planID,
          dbGroup: dbGroup,
        ),
      );
    }
    for (bool value in isSelected) {
      if (value) {
        return Column(
          children: planDataWidgets,
        );
      } else {
        return Column(
          children: [Text("")],
        );
      }
    }
    return Column(children: [Text("")]);
  }
}

class PlanTile extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String planID;
  final String dbGroup;

  final String desc;
  final String status;
  final String map;

  const PlanTile(
      {Key? key,
      required this.desc,
      required this.status,
      required this.map,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.planID,
      required this.dbGroup})
      : super(key: key);

  @override
  _PlanTileState createState() => _PlanTileState();
}

class _PlanTileState extends State<PlanTile> {
  bool _isExpanded = false;
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _descriptionController.text = widget.desc;
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
      ),
      child: ExpansionTile(
        leading: Icon(widget.icon),
        title: Text(widget.title),
        subtitle: Text(
          widget.subtitle,
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 13,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLabel("Description of request:"),
                SizedBox(height: 8),
                _buildDescriptionTextField(widget.desc),
                SizedBox(height: 16.0),
                _buildLabel("Request Status:"),
                SizedBox(height: 8),
                _buildStatusPill(widget.status),
                SizedBox(height: 16.0),
                _buildLabel("Show on Map:"),
                SizedBox(height: 8),
                _buildMapButton(widget.map),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ],
        onExpansionChanged: (isExpanded) {
          setState(() {
            _isExpanded = isExpanded;
          });
        },
        initiallyExpanded: _isExpanded,
      ),
    );
  }

  Widget _buildLabel(String labelText) {
    return Text(
      labelText,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildDescriptionTextField(String desc) {
    return TextFormField(
      controller: _descriptionController,
      maxLines: 3,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter description here...',
      ),
      readOnly: true,
    );
  }

  Widget _buildStatusPill(String status) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildMapButton(String? map) {
    if (map == null || map.isEmpty) {
      return Text(
        'Not available yet',
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: () {
          // Add your logic to view the map here
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          'View on Map',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      );
    }
  }
}
