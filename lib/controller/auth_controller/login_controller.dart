// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:diginova/global/constant.dart';
import 'package:diginova/global/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var email = "".obs;
  var password = "".obs;
  RxBool obscureText = true.obs;
  final emailFormKey = GlobalKey<FormState>().obs;
  final passwordFormKey = GlobalKey<FormState>().obs;

  void setEmail(String value) => email.value = value;
  void setPassword(String value) => password.value = value;

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }

  bool validateFields() {
    final emailForm = emailFormKey.value.currentState;
    final passwordForm = passwordFormKey.value.currentState;
    if (emailForm != null &&
        emailForm.validate() &&
        passwordForm != null &&
        passwordForm.validate()) {
      emailForm.save();
      passwordForm.save();
      return true;
    }
    return false;
  }

  Future<bool> signInUser(Map<String, String> formData) async {
    try {
      final response = await http
          .post(
        Uri.parse('$BASE_URL$LOGIN_URL'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(formData),
      )
          .timeout(Duration(seconds: 10), onTimeout: () {
        throw 'Please try again';
      });
       debugPrint("login response statuscode = ${response.statusCode}");
       debugPrint("login response body = ${response.body}");
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        String token = responseData['jwt_token'];
        // String email = responseData['email'];
        // String name = responseData['name'];
        // // log(token, name: 'Token');
        // log('$name\n$email', name: 'Name and Email');

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('jwt_token', token);
        await UserDataManager.saveLoginInfo(
          responseData['jwt_token'],
          responseData['role'],
          responseData['name'],
          responseData['email'],
          responseData['phoneNumber'],
          responseData['uid'],
          responseData['companyId'] ?? '',
          responseData['companyName'] ?? '',
          responseData['customerId'] ?? '',
          
        );

        return true;
      } else {
        final errorResponse = jsonDecode(response.body);

        throw errorResponse['message'];
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
