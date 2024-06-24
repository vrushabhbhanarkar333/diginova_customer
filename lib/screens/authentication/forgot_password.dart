import 'package:country_picker/country_picker.dart';
import 'package:diginova/global/appbar.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/authentication/phone_otp_verification.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  // sendCode() async {
  //   try {
  //     String phoneNumber = phoneNumberController.text;
  //     String email = emailController.text;
  //     await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: phoneNumber,
  //       verificationCompleted: (PhoneAuthCredential credential) {},
  //       verificationFailed: (FirebaseAuthException e) {
  //         Get.snackbar('Error occurred', e.code);
  //       },
  //       codeSent: (String verificationId, int? token) async {
  //         String maskedNumber =
  //             '${phoneNumber.substring(0, 2)}******${phoneNumber.substring(phoneNumber.length - 2)}';
  //         // Send OTP for phone number
  //         Get.snackbar(
  //             'OTP Sent', 'OTP sent to your mobile number $maskedNumber');

  //         // Send OTP for email if provided
  //         if (email.isNotEmpty) {
  //           try {
  //             await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  //             Get.snackbar(
  //                 'Reset Email Sent', 'Password reset email sent to $email');
  //           } catch (e) {
  //             Get.snackbar('Error sending email', e.toString());
  //           }
  //         }

  //         // Navigate to OTP verification screen with verification ID
  //         Get.to(() => PhoneOtpVerification(

  //             ));
  //       },
  //       codeAutoRetrievalTimeout: (verificationId) {},
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     Get.snackbar('Error occurred', e.code);
  //   } catch (e) {
  //     Get.snackbar('Error occurred', e.toString());
  //   }
  // }

// Simulated function to retrieve OTP from user input
  // Future<String> retrieveOTPFromUser() async {
  // Implement this function to get OTP from the user
  // You can use a text input field, modal, or any other method to collect OTP
  // For simulation purposes, I'm returning a fixed OTP here
  // return phoneNumberController.text; // Replace with actual implementation
  // }

  // Country selectedCountry = Country(
  //   phoneCode: "91",
  //   countryCode: "IN",
  //   e164Sc: 0,
  //   geographic: true,
  //   level: 1,
  //   name: "India",
  //   example: "India",
  //   displayName: "India",
  //   displayNameNoCountryCode: "IN",
  //   e164Key: "",
  // );

  @override
  Widget build(BuildContext context) {
    // phoneNumberController.selection = TextSelection.fromPosition(
    //     TextPosition(offset: phoneNumberController.text.length));
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image(
              image: AssetImage(BACKGROUNDIMAGE),
              fit: BoxFit.cover,
            ),
            AppBarNova(
              title: '',
              fontWeight: FontWeight.bold,
              fontSize: 0,
              color: Colors.transparent,
              onPressed: () {},
            ),
            Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: SPACING_XL,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/forgot_password/3d-casual-life-young-man-with-phone-using-laptop.png',
                    ),
                  ),
                  const SizedBox(height: SPACING_XL),
                  Text(
                    'Forgot password?',
                    style: FONT_MD_TXT_STYLE,
                  ),
                  const SizedBox(height: SPACING_XS),
                  Text(
                    'Don’t worry! It happens. Please enter the phone number we will send the OTP to this phone number.',
                    style: GoogleFonts.poppins(
                      fontSize: FONT_14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0XFF5B5858),
                    ),
                  ),
                  const SizedBox(height: SPACING_M),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      cursorColor: TEXTFIELD_HINT_TXT_CLR,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: 'Enter the Phone Number',
                        hintStyle: TEXTFIELD_HINT_TXT_STYLE,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: TEXTFIELD_BORDER_CLR,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: TEXTFIELD_BORDER_CLR,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        // prefixIcon: Container(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: InkWell(
                        //     onTap: () {
                        //       showCountryPicker(
                        //         context: context,
                        //         countryListTheme: const CountryListThemeData(
                        //           bottomSheetHeight: 500,
                        //         ),
                        //         onSelect: (Value) {
                        //           setState(() {
                        //             selectedCountry = Value;
                        //           });
                        //         },
                        //       );
                        //     },
                        //     child: Text(
                        //       "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                        //       style: const TextStyle(
                        //         fontSize: 18,
                        //         color: Colors.black,
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // suffixIcon: phoneNumberController.text.length > 9
                        //     ? Container(
                        //         height: 30,
                        //         width: 30,
                        //         margin: const EdgeInsets.all(10),
                        //         decoration: const BoxDecoration(
                        //           shape: BoxShape.circle,
                        //           color: Colors.green,
                        //         ),
                        //         child: const Icon(
                        //           Icons.done,
                        //           color: Colors.white,
                        //           size: 15,
                        //         ),
                        //       )
                        //     : null,
                      ),
                      // onChanged: (value) {
                      //   if (value.length == 10) {
                      //     sendCode(); // Trigger OTP sending process when phone number is 10 digits long
                      //   }
                      // },
                    ),
                  ),
                  const SizedBox(height: SPACING_M),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(DEFAULT_CLR),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        // if (phoneNumberController.text.isNotEmpty) {
                        //   sendCode();
                        // } else {
                        //   Get.snackbar('Validation Error',
                        //       'Please enter a valid phone number');
                        // }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PhoneOtpVerification()));
                      },
                      child: Text(
                        "Continue",
                        style: GoogleFonts.poppins(
                          fontSize: FONT_XSS,
                          fontWeight: FontWeight.w600,
                          color: WHITE_CLR,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
