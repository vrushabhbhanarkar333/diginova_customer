import 'package:diginova/global/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFoldersBtn extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  String? folder;

  // final String value;

  MyFoldersBtn({super.key, required this.title, required this.onTap, this.folder
      // required this.value,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: SPACING_XS),
        child: SizedBox(
          // height: mediaQueryH(context) * 0.15,
          // width: mediaQueryH(context) * 0.15,
          child: Container(
            padding: const EdgeInsets.all(PADDING_XS),
            decoration: BoxDecoration(
              color: CATEGORIES_BG_CLR,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color.fromARGB(255, 245, 245, 245),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(folder != null
                    ? 'assets/images/files/pdf.png'
                    : 'assets/images/files/folders.png'),
                const SizedBox(height: SPACING_MD),
                Text(
                  title,
                  style: FONT_16_SEMI_BOLD_TXT_STYLE,
                ),
                // Text(
                //   value,
                //   style: GoogleFonts.poppins(
                //     fontSize: FONT_XSS,
                //     fontWeight: FontWeight.w400,
                //     color: BLACK_CLR_SHADE,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
