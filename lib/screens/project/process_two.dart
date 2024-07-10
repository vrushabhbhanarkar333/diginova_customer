import 'package:diginova/global/appbar.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/model/project_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

class FinishedProjectDetails extends StatefulWidget {
  final ProjectDetails projectDetails;
  const FinishedProjectDetails({super.key, required this.projectDetails});

  @override
  State<FinishedProjectDetails> createState() => _FinishedProjectDetailsState();
}

class _FinishedProjectDetailsState extends State<FinishedProjectDetails> {
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
          AppBarNova(
            onPressed: () {
              Navigator.pop(context);
            },
            title: 'Process',
            fontWeight: FontWeight.w500,
            fontSize: FONT_M,
            color: BLACK_CLR,
          ),
          Positioned(
            top: mediaQueryH(context) * 0.15,
            left: 18,
            right: 18,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: mediaQueryH(context) * 0.6,
                    child: Card(
                      elevation: 0.2,
                      surfaceTintColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 25,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Project 234 - Levon Techo',
                                    style: TEXT_STYLE_SM_BOLD),
                                SizedBox(
                                  height: 18.16,
                                  width: 73,
                                  child: ElevatedButton(
                                    style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                        GREEN_SHADE_CLR,
                                      ),
                                      padding: MaterialStatePropertyAll(
                                        EdgeInsets.zero,
                                      ),
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'Completed',
                                      style: GoogleFonts.poppins(
                                        fontSize: FONT_XS,
                                        fontWeight: FontWeight.w500,
                                        color: WHITE_SHADE_CLR,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '383, 2nd floor, 9th Main Rd, 7th Sector, HSR Layout, Bengaluru, Karnataka 560102',
                              style: GoogleFonts.poppins(
                                fontSize: FONT_XSS,
                                fontWeight: FontWeight.w500,
                                color: GREY_SHADE_CLRS,
                              ),
                            ),
                            const Divider(color: DIVIDER_CLR),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Estimated 21 Feb 2024',
                                      style: GoogleFonts.poppins(
                                        fontSize: FONT_XSS,
                                        fontWeight: FontWeight.w500,
                                        color: GREY_BLUR_SHADE_CLR,
                                      ),
                                    ),
                                    const SizedBox(height: SPACING_SM),
                                    Text(
                                      'Finishing',
                                      style: GoogleFonts.poppins(
                                        fontSize: FONT_XSS,
                                        fontWeight: FontWeight.w500,
                                        color: BLACK_CLR_SHADE,
                                      ),
                                    ),
                                  ],
                                ),
                                CircularPercentIndicator(
                                  center: Text(
                                    '20%',
                                    style: GoogleFonts.poppins(
                                      fontSize: FONT_XS,
                                      fontWeight: FontWeight.w500,
                                      color: BLACK_CLR_SHADE,
                                    ),
                                  ),
                                  radius: 22,
                                  percent: 0.2,
                                  animation: true,
                                  backgroundColor: const Color(0XFFF5F8FB),
                                  progressColor: const Color(0XFF136AD4),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Image.asset(
                                      'assets/images/ProfileImage.png',
                                    ),
                                    Positioned(
                                      left: 28,
                                      child: Image.asset(
                                        'assets/images/ProfileImage.png',
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: SPACING_XL),
                                Text(
                                  'Work by Kiran , Santhosh',
                                  style: GoogleFonts.poppins(
                                    fontSize: FONT_XSS,
                                    fontWeight: FontWeight.w500,
                                    color: BLACK_CLR_SHADE,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Day 1 - Process Complete',
                              style: GoogleFonts.poppins(
                                fontSize: FONT_16,
                                fontWeight: FontWeight.w600,
                                color: BLACK_CLR,
                              ),
                            ),
                            Text(
                              widget.projectDetails.projectDescription!,
                              style: GoogleFonts.poppins(
                                fontSize: FONT_XSS,
                                fontWeight: FontWeight.w500,
                                color: GREY_SHADE_CLRS,
                              ),
                            ),
                            Center(
                              child: Image.asset(
                                'assets/images/icons8-pdf-48 1.png',
                              ),
                            ),
                            Center(
                              child: Text(
                                'control-panel.pdf',
                                style: GoogleFonts.poppins(
                                  fontSize: FONT_XS,
                                  fontWeight: FontWeight.w500,
                                  color: GREY_BLUE_SHADE_CLRS,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Done",
                        style: TEXT_STYLE_XSS,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
