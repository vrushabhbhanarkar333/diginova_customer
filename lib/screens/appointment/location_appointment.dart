import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/appointment/process.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationAppointment extends StatefulWidget {
  const LocationAppointment({super.key});

  @override
  State<LocationAppointment> createState() => _LocationAppointmentState();
}

class _LocationAppointmentState extends State<LocationAppointment> {
  @override
  void initState() {
    super.initState();
    // Call the method to show the bottom sheet automatically
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showBottomSheet(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onTap: () {
              _showBottomSheet(context);
            },
            child: Image.asset(
              'assets/images/locationAppointment.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      barrierColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 322,
          width: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: PADDING_MD,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: SPACING_XL),
                Text(
                  'Your Location',
                  style: GoogleFonts.poppins(
                      fontSize: FONT_14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0XFF828282)),
                ),
                const SizedBox(height: SPACING_XS),
                Text(
                  'Right Joy Pvt. Ltd',
                  style: FONT_16_SEMI_BOLD_TXT_STYLE,
                ),
                const SizedBox(height: SPACING_MD),
                Text(
                  'Street / Building / Flat',
                  style: GoogleFonts.poppins(
                      fontSize: FONT_14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0XFF828282)),
                ),
                const SizedBox(height: SPACING_XS),
                Text(
                  '1234 Single Street, Bangalore',
                  style: FONT_16_SEMI_BOLD_TXT_STYLE,
                ),
                const SizedBox(height: SPACING_MD),
                Text(
                  'Your Name',
                  style: GoogleFonts.poppins(
                      fontSize: FONT_14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0XFF828282)),
                ),
                const SizedBox(height: SPACING_XS),
                Text(
                  'Vishwa',
                  style: FONT_16_SEMI_BOLD_TXT_STYLE,
                ),
                const SizedBox(height: SPACING_LG),
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
                            Radius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Process(),
                        ),
                      );
                    },
                    child: Text(
                      "Finish",
                      style: TEXT_STYLE_XSS,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
