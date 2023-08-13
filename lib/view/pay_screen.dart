import 'package:flutter/material.dart';
import 'package:redsquad/view/bottomnav.dart';

class PayScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 244, 245, 253),
      body: Column(
 
        children: [
          Padding(
            padding: EdgeInsets.only(top: 61),
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
            'Payment Information',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          PaymentDetail(
            icon: Icons.account_balance,
            label: 'Bank Account:',
            info: 'FNB Business Account',
          ),
          SizedBox(height: 10),
          PaymentDetail(
            icon: Icons.account_circle,
            label: 'Account Number:',
            info: '1234567890',
          ),
            SizedBox(height: 10),
          PaymentDetail(
            icon: Icons.store,
            label: 'Branch Code:',
            info: '123456',
          ),
            SizedBox(height: 10),
          PaymentDetail(
            icon: Icons.location_on,
            label: 'Branch Address:',
            info: '123 Main Street, City',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarController(scaffoldKey: _scaffoldKey,),
    );
  }
}

class PaymentDetail extends StatelessWidget {
  final IconData icon;
  final String label;
  final String info;

  const PaymentDetail({
    required this.icon,
    required this.label,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(info),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: PayScreen()));
}
