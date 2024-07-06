import 'package:diginova/global/utility.dart';
import 'package:diginova/utils/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../global/constant.dart';

class SignUpController extends GetxController {
  final firstName = ''.obs;
  final lastName = ''.obs;
  final customerId = ''.obs;
  final projectId = ''.obs;
  final email = ''.obs;
  final phoneNumber = ''.obs;
  final password = ''.obs;
  final rePassword = ''.obs;
  final otp = ''.obs;

  void setFirstName(String value) => firstName.value = value;
  void setLastName(String value) => lastName.value = value;
  void setCustomerId(String value) => customerId.value = value;
  void setProjectId(String value) => projectId.value = value;
  void setEmail(String value) => email.value = value;
  void setPhoneNumber(String value) => phoneNumber.value = value;
  void setPassword(String value) => password.value = value;
  void setRePassword(String value) => rePassword.value = value;
  void setOtp(String value) => otp.value = value;

  Future<bool> signupUser(
    String firstName,
    String lastName,
    String customerId,
    String projectId,
    String email,
    String phoneNumber,
    String password,
    String rePassword,
    BuildContext context,
  ) async {
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

    // Send signup request
    try {
      final signupResponse = await http
          .post(
            Uri.parse('$BASE_URL$SIGNUP_URL'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'firstName': firstName,
              'lastName': lastName,
              'customerId': customerId,
              'projectId': projectId,
              'email': email,
              'phoneNumber': phoneNumber,
              'password': password,
            }),
          )
          .timeout(const Duration(seconds: 10));

      if (signupResponse.statusCode == 200) {
        Get.snackbar(
          'Sign Up',
          'An OTP has been sent to your email for verification.',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        final errorResponse = jsonDecode(signupResponse.body);
        Get.snackbar(
          'Sign Up Failed',
          'Failed to sign up: ${errorResponse['message']}',
          snackPosition: SnackPosition.BOTTOM,
        );
        return false;
      }
    } on TimeoutException {
      Get.snackbar(
        'Sign Up Failed',
        'Sign up process timed out. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        'Sign Up Failed Error checking',
        'Error: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    // Ask user to enter the OTP
    String? otpInput = await _showOtpDialog(context);

    if (otpInput == null || otpInput.isEmpty) {
      Get.snackbar(
        'OTP Verification Failed',
        'No OTP entered. Sign up process aborted.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    // Verify OTP
    try {
      final verifyOtpResponse = await http
          .patch(
            Uri.parse('$BASE_URL$VERIFY_OTP_URL'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'email': email,
              'otp': otpInput,
            }),
          )
          .timeout(const Duration(seconds: 10));

      if (verifyOtpResponse.statusCode == 200) {
        Get.snackbar(
          'OTP Verified',
          'OTP has been successfully verified.',
          snackPosition: SnackPosition.BOTTOM,
        );

        // After successful OTP verification, proceed to the main application
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavigationBarScreen(),
          ),
          (route) => false,
        );
        return true;
      } else {
        final errorResponse = jsonDecode(verifyOtpResponse.body);
        Get.snackbar(
          'OTP Verification Failed',
          'Failed to verify OTP: ${errorResponse['message']}',
          snackPosition: SnackPosition.BOTTOM,
        );
        return false;
      }
    } on TimeoutException {
      Get.snackbar(
        'OTP Verification Failed',
        'OTP verification process timed out. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        'OTP Verification Failed',
        'Error: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  Future<String?> _showOtpDialog(BuildContext context) async {
    String? otpInput;
    await Get.defaultDialog(
      title: 'Verify OTP',
      content: Column(
        children: [
          TextField(
            onChanged: (value) => otpInput = value,
            decoration: const InputDecoration(
              labelText: 'OTP',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Get.back(result: otpInput);
            },
            child: const Text('Verify'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
    return otpInput;
  }
}
