import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/privacy_policy/privacy_policy.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class History extends StatelessWidget {
  const History({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PADDING_MD),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: SPACING_XL),
          const SizedBox(height: SPACING_XL),
          const SizedBox(height: SPACING_XL),
          const SizedBox(height: SPACING_XL),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrivacyPolicy(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: const Color(0XFFEAF2FF),
                ),
                height: 100,
                width: 100,
                child: const Icon(
                  Icons.image,
                  size: 32,
                  color: BLUE_CLR_SHADE,
                ),
              ),
            ),
          ),
          const SizedBox(height: SPACING_LG),
          Text(
            'Nothing here.For now.',
            style: GoogleFonts.inter(
              fontSize: FONT_M,
              fontWeight: FontWeight.w900,
              color: BLACK_SHADE,
            ),
          ),
          const SizedBox(height: SPACING_SM),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: PADDING_XL),
            child: Text(
              'This is where you\'ll find your finished Appointment',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: FONT_14,
                fontWeight: FontWeight.w500,
                color: WARM_GRAY_CLR,
              ),
            ),
          )
        ],
      ),
    );
  }
}
