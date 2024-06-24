import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/qr_scan/qr_scan.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatelessWidget {
  const Search({super.key});

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
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset('assets/icons/Vector.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 130,
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: GestureDetector(
                        onTap: () {},
                        child: TextFormField(
                          cursorColor: TEXTFIELD_HINT_TXT_CLR,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            filled: true,
                            fillColor: WHITE_CLR,
                            hintText: 'Asset',
                            hintStyle: TEXTFIELD_HINT_TXT_STYLE,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 18,
                              color: TEXTFIELD_HINT_TXT_CLR,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QrScanner(),
                          ),
                        );
                      },
                      child: Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          color: DEFAULT_CLR,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Image.asset(
                          'assets/icons/homeScreenIcons/Filter.png',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: SPACING_MD),
                Text(
                  'Recent search',
                  style: GoogleFonts.poppins(
                    fontSize: FONT_XSS,
                    fontWeight: FontWeight.w400,
                    color: const Color(0XFF000000),
                  ),
                ),
                const SizedBox(
                  height: SPACING_M,
                ),
                const SearchCustomBtn(
                  text: 'System',
                ),
                const SizedBox(
                  height: SPACING_MD,
                ),
                const SearchCustomBtn(
                  text: 'Project',
                ),
                const SizedBox(
                  height: SPACING_MD,
                ),
                const SearchCustomBtn(
                  text: 'Files',
                ),
                const SizedBox(height: SPACING_M),
                Center(
                  child: Text(
                    'No more search',
                    style: GoogleFonts.poppins(
                      fontSize: FONT_14,
                      fontWeight: FontWeight.w400,
                      color: BLACK_CLR,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SearchCustomBtn extends StatelessWidget {
  final String text;
  const SearchCustomBtn({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.history,
              size: 15,
            ),
            const SizedBox(width: SPACING_SM),
            Text(
              text,
              style: TEXT_STYLE_XSS_MEDIUM,
            ),
          ],
        ),
        Image.asset(
          'assets/icons/arrowup.png',
          color: const Color(0XFF000000),
        )
      ],
    );
  }
}
