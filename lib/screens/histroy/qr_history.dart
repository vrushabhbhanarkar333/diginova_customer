import 'package:diginova/global/appbar.dart';
import 'package:diginova/global/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class QRhistory extends StatelessWidget {
  QRhistory({super.key});

  String appBarTitle = 'History';

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
        AppBar(
          // toolbarHeight: mediaQueryH(context) * 0.1,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              size: 18,
            ),
          ),
          title: Text(
            'History',
            style: TEXT_STYLE_M
              ..copyWith(
                color: BLACK_CLR,
              ),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: mediaQueryH(context) * 0.12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: SPACING_LG),
                Image.asset(
                  'assets/images/QrCode.png',
                  fit: BoxFit.cover,
                  width: mediaQueryW(context) * 0.5,
                ),
                const SizedBox(
                  height: SPACING_MD,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Project No:',
                            style: GoogleFonts.inter(
                              fontSize: FONT_16,
                              fontWeight: FontWeight.w500,
                              color: BLACK_CLR_SHADE,
                            ),
                          ),
                          TextSpan(
                            text: 'DG8797',
                            style: GoogleFonts.inter(
                              fontSize: FONT_16,
                              fontWeight: FontWeight.w500,
                              color: GREY_BLUR_SHADE_CLR,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: SPACING_MD,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Customer ID:',
                          style: GoogleFonts.inter(
                            fontSize: FONT_14,
                            fontWeight: FontWeight.bold,
                            color: BLACK_CLR,
                          ),
                        ),
                        TextSpan(
                          text: '56657',
                          style: GoogleFonts.inter(
                            fontSize: FONT_16,
                            fontWeight: FontWeight.w500,
                            color: WARM_GRAY_CLR,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: SPACING_MD,
                ),
                Center(
                  child: Text(
                    '12-Feb-2024, 4:00 PM',
                    style: GoogleFonts.inter(
                      fontSize: FONT_XSS,
                      fontWeight: FontWeight.w500,
                      color: GRAY_CLR_SHADE,
                    ),
                  ),
                ),
                const SizedBox(height: SPACING_XL),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                  child: SizedBox(
                    height: mediaQueryH(context) * 0.05,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.defaultDialog(
                          contentPadding: EdgeInsets.zero,
                          backgroundColor: const Color(0XFFFFFFFF),
                          barrierDismissible: false,
                          title: "",
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: const Icon(
                                      Icons.cancel_outlined,
                                      color: BLACK_SHADE,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Lottie.network(
                                'https://lottie.host/88dfbcc5-b21a-40c0-ae5c-fd60e3e763b0/hnK6fQzQ0O.json',
                                // fit: BoxFit.cover,
                                height: mediaQueryH(context) * 0.1,
                                width: MediaQuery.of(context).size.width * 0.9,
                              ),
                              Text(
                                "Successfully Retrived",
                                style: GoogleFonts.poppins(
                                  fontSize: FONT_SM,
                                  fontWeight: FontWeight.w700,
                                  color: DEFAULT_CLR,
                                ),
                              ),
                              const SizedBox(height: 50),
                              SizedBox(
                                width: 123,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(BTN_BLUE_CLR),
                                    shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusDirectional.all(
                                          Radius.circular(9.77),
                                        ),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Done",
                                    style: GoogleFonts.poppins(
                                      fontSize: FONT_XSS,
                                      fontWeight: FontWeight.w600,
                                      color: WHITE_CLR,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 50),
                            ],
                          ),
                        );
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(DEFAULT_CLR),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.all(
                              Radius.circular(9.77),
                            ),
                          ),
                        ),
                      ),
                      child: Text(
                        "Retrive QR Code",
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
        ),
      ],
    ));
  }
}
