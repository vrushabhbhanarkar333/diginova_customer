import 'package:diginova/global/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PdfBtn extends StatelessWidget {
  final String title;
  final String value;

  const PdfBtn({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd,MMM yyyy').format(DateTime.now());

    return Padding(
      padding: const EdgeInsets.only(right: SPACING_XS),
      child: SizedBox(
        // height: 145.69,
        width: 157,
        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Color.fromARGB(255, 245, 245, 245),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          surfaceTintColor: Colors.transparent,
          color: CATEGORIES_BG_CLR,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: SPACING_MD,
                  top: SPACING_SM,
                  bottom: SPACING_XS,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClipOval(
                      child: Container(
                        height: 4,
                        width: 4,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 5),
                    ClipOval(
                      child: Container(
                        height: 4,
                        width: 4,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: SPACING_XS),
                    ClipOval(
                      child: Container(
                        height: 4,
                        width: 4,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset('assets/images/files/pdf.png'),
              const SizedBox(height: SPACING_XS),
              Text(
                '$title.pdf',
                style: FONT_16_SEMI_BOLD_TXT_STYLE,
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: PADDING_XS),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      value,
                      style: GoogleFonts.poppins(
                        fontSize: FONT_XS,
                        fontWeight: FontWeight.w400,
                        color: BLACK_CLR_SHADE,
                      ),
                    ),
                    Text(
                      formattedDate,
                      style: GoogleFonts.poppins(
                        fontSize: FONT_XS,
                        fontWeight: FontWeight.w400,
                        color: BLACK_CLR_SHADE,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: SPACING_SM),
            ],
          ),
        ),
      ),
    );
  }
}
