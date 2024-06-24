import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/authentication/phone_otp_verification.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

// ignore: camel_case_types
class UpdateScreen_2 extends StatefulWidget {
  const UpdateScreen_2({super.key});

  @override
  State<UpdateScreen_2> createState() => _UpdateScreen_2State();
}

// ignore: camel_case_types
class _UpdateScreen_2State extends State<UpdateScreen_2> {
  bool isChecked = false;
  bool isChecked_1 = false;
  bool isChecked_3 = false;
  bool isChecked_4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            BACKGROUNDIMAGE,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 35),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 15,
                              weight: 20,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '2/4:STEP 2',
                            style: GoogleFonts.poppins(
                              fontSize: FONT_XSS,
                              fontWeight: FontWeight.bold,
                              color: BLACK_CLR_SHADE,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8, top: 10),
                            child: StepProgressIndicator(
                              size: 7,
                              totalSteps: 6,
                              currentStep: 2,
                              selectedColor: BLUE_DARK_CLR,
                              unselectedColor: WHITE_CLR,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: GREY_CLR,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Text(
                        'Nearest airport',
                        style: GoogleFonts.poppins(
                          fontSize: FONT_16,
                          fontWeight: FontWeight.w600,
                          color: BLACK_CLR,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      cursorColor: TEXTFIELD_BG_CLR,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 12),
                        hintText: 'Full Name',
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
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Text(
                        'Nearest railway station',
                        style: GoogleFonts.poppins(
                          fontSize: FONT_16,
                          fontWeight: FontWeight.w600,
                          color: BLACK_CLR,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      cursorColor: TEXTFIELD_BG_CLR,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 12),
                        hintText: 'Name',
                        hintStyle: TEXTFIELD_HINT_TXT_STYLE,
                        fillColor: Colors.white,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: TEXTFIELD_BORDER_CLR,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          // borderSide: BorderSide(
                          //   color: TEXTFIELD_BORDER_CLR,
                          // ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        '. Avaliability of accommodationn facility within\n  site premisees: (Preferred)',
                        style: GoogleFonts.poppins(
                          fontSize: FONT_14,
                          fontWeight: FontWeight.w600,
                          color: BLACK_CLR_SHADE,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                    ),
                    Text(
                      "Yes",
                      style: GoogleFonts.poppins(
                        fontSize: FONT_14,
                        fontWeight: FontWeight.w500,
                        color: BLACK_CLR,
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    Checkbox(
                      value: isChecked_1,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked_1 = value!;
                        });
                      },
                    ),
                    Text(
                      "No",
                      style: GoogleFonts.poppins(
                        fontSize: FONT_14,
                        fontWeight: FontWeight.w500,
                        color: BLACK_CLR,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        'If No, please mention site nearby accommodation \n  cityArea (Hotel details)',
                        style: GoogleFonts.poppins(
                          fontSize: FONT_14,
                          fontWeight: FontWeight.normal,
                          color: BLACK_CLR_SHADE,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: SPACING_M),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      cursorColor: TEXTFIELD_BG_CLR,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 12),
                        hintText: 'comment',
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
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        '. Avaliability of accommodationn facility within\n  site premisees: (Preferred)',
                        style: GoogleFonts.poppins(
                          fontSize: FONT_14,
                          fontWeight: FontWeight.w600,
                          color: BLACK_CLR_SHADE,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Checkbox(
                        value: isChecked_3,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked_3 = value!;
                          });
                        },
                      ),
                    ),
                    Text(
                      "Yes",
                      style: GoogleFonts.poppins(
                        fontSize: FONT_14,
                        fontWeight: FontWeight.w500,
                        color: BLACK_CLR,
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    Checkbox(
                      value: isChecked_4,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked_4 = value!;
                        });
                      },
                    ),
                    Text(
                      "No",
                      style: GoogleFonts.poppins(
                        fontSize: FONT_14,
                        fontWeight: FontWeight.w500,
                        color: BLACK_CLR,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        '(pick and drop GE team from guest house within\n site premises or nearest safe & hygiene location)',
                        style: GoogleFonts.poppins(
                          fontSize: FONT_14,
                          fontWeight: FontWeight.normal,
                          color: BLACK_CLR_SHADE,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        'PO No. and Date. (*If Chargeable visit)',
                        style: GoogleFonts.poppins(
                          fontSize: FONT_14,
                          fontWeight: FontWeight.normal,
                          color: BLACK_CLR_SHADE,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      cursorColor: TEXTFIELD_BG_CLR,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 12),
                        hintText: 'Po no',
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
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: SPACING_M),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: SizedBox(
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PhoneOtpVerification(),
                          ),
                        );
                      },
                      child: Text(
                        "Next",
                        style: GoogleFonts.poppins(
                          fontSize: FONT_XSS,
                          fontWeight: FontWeight.w600,
                          color: WHITE_CLR,
                        ),
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
