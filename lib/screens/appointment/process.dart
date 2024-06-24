import 'package:diginova/global/appbar.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/utils/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Process extends StatelessWidget {
  const Process({super.key});

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
              // Navigator.pop(context);
            },
            title: 'Process',
            fontWeight: FontWeight.w500,
            fontSize: FONT_M,
            color: BLACK_CLR,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: mediaQueryH(context) * 0.1,
              left: PADDING_XS,
              right: PADDING_XS,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: SPACING_XL),
                  Container(
                    height: 189,
                    width: 189,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: DEFAULT_CLR,
                        width: 8,
                      ),
                    ),
                    child: Image.asset('assets/images/mdi_check-thick.png'),
                  ),
                  const SizedBox(height: SPACING_LG),
                  Text(
                    'Sucessfully Service booking',
                    style: TEXT_STYLE_FONT_20_SEMI_BOLD_DEFAULT_CLR,
                  ),
                  const SizedBox(height: SPACING_M),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: PADDING_LG),
                    child: Text(
                      'Your Service has been processed details of booking are included below',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: FONT_XS,
                        fontWeight: FontWeight.w500,
                        color: GREY_COLOR_SHADE,
                      ),
                    ),
                  ),
                  const SizedBox(height: SPACING_M),
                  Text('September 13, 2024 10:14 PM',
                      style: GoogleFonts.inter(
                        fontSize: FONT_14,
                        fontWeight: FontWeight.w500,
                        color: BLACK_CLR,
                      )),
                  SizedBox(height: mediaQueryH(context) * 0.1),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: PADDING_SM,
                    ),
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
                                Radius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const BottomNavigationBarScreen(),
                              ),
                              (route) => false);
                        },
                        child: Text(
                          "Done",
                          style: TEXT_STYLE_XSS,
                        ),
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
