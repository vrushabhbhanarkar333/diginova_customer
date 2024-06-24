// ignore_for_file: use_build_context_synchronously

import 'dart:async'; // Import the async package
import 'dart:convert';
import 'package:diginova/global/constant.dart';
import 'package:diginova/global/utility.dart';
import 'package:diginova/utils/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpController extends GetxController {
  final firstName = ''.obs;
  final lastName = ''.obs;
  final customerId = ''.obs;
  final projectId = ''.obs;
  final email = ''.obs;
  final phoneNumber = ''.obs;
  final password = ''.obs;
  final rePassword = ''.obs;

  void setFirstName(String value) => firstName.value = value;
  void setLastName(String value) => lastName.value = value;
  void setCustomerId(String value) => customerId.value = value;
  void setProjectId(String value) => projectId.value = value;
  void setEmail(String value) => email.value = value;
  void setPhoneNumber(String value) => phoneNumber.value = value;
  void setPassword(String value) => password.value = value;
  void setRePassword(String value) => rePassword.value = value;

  Future<bool> signupUser(
    String firstName,
    String lastName,
    String customerId,
    String email,
    String password,
    String rePassword,
    BuildContext context,
  ) async {
    try {
      if (password.length < 6) {
        Get.snackbar(
          'Sign Up Failed',
          'Password provided is too weak',
          snackPosition: SnackPosition.BOTTOM,
        );
        return false;
      }
      if (password != rePassword) {
        Get.snackbar(
          'Sign Up Failed',
          "Passwords don't match",
          snackPosition: SnackPosition.BOTTOM,
        );
        return false;
      }

      final response = await http
          .post(
            Uri.parse('$BASE_URL$LOGIN_URL'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'firstName': firstName,
              'lastName': lastName,
              'customerId': customerId,
              'email': email,
              'password': password,
            }),
          )
          .timeout(const Duration(seconds: 10)); // Add timeout here

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        await UserDataManager.saveLoginInfo(
          responseData['jwt_token'],
          responseData['role'],
          responseData['name'],
          responseData['email'],
          responseData['uid'],
          responseData['companyId'] ?? '',
          responseData['companyName'] ?? '',
          responseData['customerId'] ?? '',
        );

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavigationBarScreen(),
          ),
          (route) => false,
        );
        return true;
      } else {
        final errorResponse = jsonDecode(response.body);
        Get.snackbar(
          'Sign Up Failed',
          'Failed to sign up: ${errorResponse['message']}',
          snackPosition: SnackPosition.BOTTOM,
        );
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        'Sign Up Failed',
        'Sign up process timed out. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        'Sign Up Failed',
        'Error: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }
}
