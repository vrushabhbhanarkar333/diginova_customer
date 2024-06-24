import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/update/update_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

// ignore: camel_case_types
class UpdateScreen_1 extends StatefulWidget {
  const UpdateScreen_1({super.key});

  @override
  State<UpdateScreen_1> createState() => _UpdateScreen_1State();
}

// ignore: camel_case_types
class _UpdateScreen_1State extends State<UpdateScreen_1> {
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
                            '1/4:STEP 1',
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
                              currentStep: 1,
                              selectedColor: BLUE_DARK_CLR,
                              unselectedColor: TEXTFIELD_BORDER_CLR,
                              roundedEdges: Radius.circular(20),
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
                        'Site Name',
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
                      style: TEXT_STYLE_XS,
                      cursorColor: TEXTFIELD_BG_CLR,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 12),
                        hintText: 'Full Name',
                        hintStyle: TEXTFIELD_HINT_TXT_STYLE,
                        filled: true, // Enable filled background
                        fillColor: Colors.white, // Set white background color

                        // enabledBorder: const OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //     color: TEXTFIELD_BORDER_CLR,
                        //   ),
                        //   borderRadius: BorderRadius.all(
                        //     Radius.circular(8),
                        //   ),
                        // ),
                        // focusedBorder: const OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //     color: TEXTFIELD_BORDER_CLR,
                        //   ),
                        //   borderRadius: BorderRadius.all(
                        //     Radius.circular(8),
                        //   ),
                        // ),
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
                        'Site Manager',
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
                        hintText: 'Name',
                        hintStyle: TEXTFIELD_HINT_TXT_STYLE,
                        filled: true, // Enable filled background
                        fillColor: Colors.white, // Set white background color

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
                        'Contact',
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
                        hintText: '+91 98987657',
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
                        'Email',
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
                        hintText: 'Levon.admin@gmail.com',
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
                        'Site full postal address',
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
                        hintText: 'hsr',
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
                            builder: (context) => const UpdateScreen_2(),
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
