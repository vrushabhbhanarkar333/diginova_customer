import 'package:diginova/global/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AssetsStatusList extends StatelessWidget {
  final String image;
  final String title;
  final int indicatorPercentage;
  final int totalIndicatorPercentage;
  const AssetsStatusList({
    super.key,
    required this.image,
    required this.title,
    required this.indicatorPercentage,
    required this.totalIndicatorPercentage,
  });

  @override
  Widget build(BuildContext context) {
    double percent = indicatorPercentage / totalIndicatorPercentage;

    return Padding(
      padding: const EdgeInsets.only(bottom: PADDING_SM),
      child: Card(
        margin: EdgeInsets.zero,
        surfaceTintColor: Colors.transparent,
        elevation: 3,
        child: ListTile(
          leading: ClipOval(
            child: Container(
              height: 38,
              width: 39,
              decoration: const BoxDecoration(
                color: AVATAR_BG_CLR,
              ),
              child: Image.asset(image),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: FONT_14,
                    fontWeight: FontWeight.w500,
                    color: BLUE_BLUR_SHADE_CLR,
                  ),
                ),
              ),
              Text(
                "$indicatorPercentage/$totalIndicatorPercentage",
                style: GoogleFonts.poppins(
                  fontSize: FONT_XSS,
                  fontWeight: FontWeight.w500,
                  color: BLUE_BLUR_SHADE_CLR,
                ),
              ),
            ],
          ),
          subtitle: LinearPercentIndicator(
            lineHeight: 4.0,
            percent: percent,
            backgroundColor: const Color(0XFFE5E5E5),
            progressColor: const Color(0XFF4180D4),
          ),
        ),
      ),
    );
  }
}
