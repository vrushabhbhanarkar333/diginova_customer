import 'dart:developer';

import 'package:diginova/screens/authentication/phone_otp_verification.dart';
import 'package:diginova/screens/home/home.dart';
import 'package:diginova/utils/bottom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthWithNumberController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  var vId = "".obs;

  Future<void> signUpWithNumber() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    TextEditingController phoneNumberController = TextEditingController();
    RxString vId = ''.obs; // Using RxString for reactive variable

    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumberController.text.trim(),
        verificationCompleted: (phoneAuthCredential) {
          // Automatically signs in user when verification is completed
          auth.signInWithCredential(phoneAuthCredential).then((value) {
            // Handle sign-in success
          }).catchError((error) {
            // Handle sign-in failure
          });
        },
        // verificationFailed: (error) {
        //   // Handles verification failures
        //   if (error.code == 'invalid-phone-number') {
        //     Get.snackbar('Error', 'The provided phone number is not valid.');
        //   } else {
        //     // Handle other verification errors
        //   }
        // },
// <<<<<<< manoj_work
// =======
        verificationFailed: (error) {
          if (error.code == 'invalid-phone-number') {
            Get.snackbar('Error', 'The provided phone number is not valid.');
          }
        },
// >>>>>>> main
        codeSent: (verificationId, forceResendingToken) {
          // Handles code sent to the user
          vId.value = verificationId;
          String maskedNumber =
              '${phoneNumberController.text.substring(0, 2)}******${phoneNumberController.text.substring(phoneNumberController.text.length - 2)}';

          Get.snackbar(
            'OTP Sent',
            'OTP sent to your mobile number $maskedNumber',
          );

          // You can navigate to the OTP verification screen here if needed
          // Get.to(() => PhoneOtpVerification());
        },
        codeAutoRetrievalTimeout: (verificationId) {
          // Handles auto-retrieval timeout
        },
      );
    } on FirebaseAuthException catch (e) {
      // Handles FirebaseAuth exceptions
      log(e.toString());
    } catch (e) {
      // Handles other exceptions
      log(e.toString());
    }
  }

  Future<bool> verifyMobileOtp() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: vId.value,
        smsCode: otpController.text,
      );
      await auth.signInWithCredential(credential);
      Get.offAll(() => const BottomNavigationBarScreen());
      Get.snackbar("OTP Verified", "Welcome to DIGICIAN APP");
      return true; // Return true indicating successful verification.
    } catch (e) {
      Get.snackbar('Error Occurred', e.toString());
      return false; // Return false indicating verification failure
    }
  }

  // Future<void> sendOTP(String phoneNumber) async {
  //   try {
  //     await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: phoneNumber,
  //       verificationCompleted: (PhoneAuthCredential credential) {
  //         // Step 1: Automatic handling of the SMS code on Android devices.
  //         signInWithCredential(credential);
  //       },
  //       verificationFailed: (FirebaseAuthException e) {
  //         // Step 2: Handle failure events such as invalid phone numbers or whether the SMS quota has been exceeded.
  //         // print('Verification failed: ${e.message}');
  //       },
  //       codeSent: (String verificationId, int? resendToken) {
  //         // Step 3: Handle when a code has been sent to the device from Firebase, used to prompt users to enter the code.
  //         // print('Code sent. Verification ID: $verificationId');
  //         // You can navigate to the OTP verification screen here if needed
  //         Get.to(() => const PhoneOtpVerification());
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId) {
  //         // Step 4: Handle a timeout of when automatic SMS code handling fails.
  //         // print('Auto retrieval timeout. Verification ID: $verificationId');
  //       },
  //     );
  //   } catch (e) {
  //     // print('Error sending OTP: $e');
  //   }
  // }

  Future<void> signInWithCredential(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      Get.to(() => const HomePage());
      // Handle sign-in success
    } catch (e) {
      // print('Error signing in with credential: $e');
      // Handle sign-in failure
    }
  }

  Future<void> signOut() async {
    auth.signOut();
  }
}
