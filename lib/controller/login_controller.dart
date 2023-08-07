import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_route_animator/page_route_animator.dart';

class LoginController extends GetxController {
  static const apiBaseUrl =
      'https://freshparlour.zakheletech.co.za/public/api/login';

  Future<void> login(Map loginData) async {
    final url =
        Uri.parse('https://freshparlour.zakheletech.co.za/public/api/login');
    print(loginData);
    try {
      final response = await http.post(url, body: loginData);

      if (response.statusCode == 200) {
        print(json.decode(response.body));

        var r = json.decode(response.body);

        if (r['error'] == false) {
        showToast(r['message']);
        
        } else {
          showToast(r['message']);
        }
      }
    } catch (error) {
      print(error);
    }
  }

  void showToast(toast) => Fluttertoast.showToast(
        msg: toast,
        fontSize: 18,
      );
}
