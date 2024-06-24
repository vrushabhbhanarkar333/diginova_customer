import 'dart:async';

import 'package:diginova/global/constant.dart';
import 'package:diginova/global/wrapper.dart';
import 'package:diginova/screens/authentication/forgot_password.dart';
import 'package:diginova/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class EmailOtpVerification extends StatefulWidget {
  final String email;
  final String vid;
  final String otp;
  final String phoneNumber;
  const EmailOtpVerification({
    super.key,
    required this.email,
    required this.otp,
    required this.phoneNumber,
    required this.vid,
  });

  @override
  State<EmailOtpVerification> createState() => _EmailOtpVerificationState();
}

class _EmailOtpVerificationState extends State<EmailOtpVerification> {
  final user = FirebaseAuth.instance.currentUser;
  var code = '';
  TextEditingController otpController = TextEditingController();

  signIn() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.vid,
      smsCode: code,
    );
    try {
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) => Get.offAll(() => const Wrapper()));
      Get.snackbar("OTP Verified", "Welcome to DIGINOVA ");
      return true;
    } on FirebaseAuthException catch (e) {
      Get.snackbar('error occured', e.code);
    } catch (e) {
      Get.snackbar('error occured', e.toString());
      return false;
    }
  }

  late String phoneNumber;
  late String otp = '';
  late int remainingSeconds;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    // Fetch and set the customer ID when the widget initializes
    fetchphoneNumber();
    remainingSeconds =
        120; // Set the initial time in seconds for OTP expiration
    startTimer();
  }

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    timer = Timer.periodic(oneSecond, (Timer t) {
      setState(() {
        if (remainingSeconds == 0) {
          t.cancel();
          // Handle OTP expiration here
        } else {
          remainingSeconds--;
        }
      });
    });
  }

  // Method to fetch the customer ID from Firebase Authentication
  void fetchphoneNumber() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      // Assuming the customer ID is stored in the user's profile under 'customerId'
      setState(() {
        phoneNumber = currentUser
            .phoneNumber!; // Replace 'uid' with the appropriate field name
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: AssetImage(BACKGROUNDIMAGE),
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 70,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: SPACING_XL,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/3d-casual-life-boy-using-laptop-and-phone.png',
                  ),
                ),
                const SizedBox(height: SPACING_XL),
                Text(
                  'OTP Verification',
                  style: FONT_MD_TXT_STYLE,
                ),
                const SizedBox(height: SPACING_XS),
                Text(
                  'Enter the OTP sent to ${widget.email}',
                  style: GoogleFonts.poppins(
                    fontSize: FONT_14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0XFF5B5858),
                  ),
                ),
                const SizedBox(height: SPACING_M),
                Pinput(
                  closeKeyboardWhenCompleted: true,
                  keyboardType: TextInputType.phone,
                  length: 6,
                  controller: otpController,
                  showCursor: false,
                  onChanged: (value) {
                    setState(() {
                      code = value;
                    });
                  },
                ),
                const SizedBox(height: SPACING_M),
                Text(
                  '00:${remainingSeconds.toString().padLeft(2, '0')} sec',
                  style: GoogleFonts.poppins(
                    fontSize: FONT_SM,
                    fontWeight: FontWeight.w400,
                    color: GREY_CLR,
                  ),
                ),
                const SizedBox(height: SPACING_M),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't Receive Code? ",
                          style: GoogleFonts.poppins(
                            fontSize: FONT_XSS,
                            fontWeight: FontWeight.w400,
                            color: GREY_CLR,
                          ),
                        ),
                        TextSpan(
                          text: "Re-Send",
                          style: GoogleFonts.poppins(
                            fontSize: FONT_XSS,
                            fontWeight: FontWeight.w600,
                            color: BLUE_SHADE_CLR,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgotPassword(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: SPACING_M),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        DEFAULT_CLR,
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
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
    );
  }
}

class OtpTextField extends StatefulWidget {
  const OtpTextField({
    super.key,
  });

  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 59,
      child: TextFormField(
        controller: otpController,
        onChanged: (value) {
          setState(() {
            otpController.text = value;
          });

          // if (value.length == 1) {
          //   FocusScope.of(context).nextFocus();
          // }
        },
        cursorColor: BLACK_CLR,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        style: FONT_14_BOLD_TXT_STYLE,
        decoration: InputDecoration(
          hintStyle: FONT_14_BOLD_TXT_STYLE,
          hintText: '0',
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: TEXTFIELD_BORDER_CLR,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: TEXTFIELD_BORDER_CLR,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
