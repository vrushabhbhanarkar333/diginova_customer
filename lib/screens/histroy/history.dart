import 'package:diginova/global/appbar.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/histroy/qr_history.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String appBarTitle = 'History';
  final TextEditingController _searchController = TextEditingController();
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
            title: 'History',
            fontWeight: FontWeight.w500,
            fontSize: FONT_16,
            color: PURPLE_SHADE_CLR,
            onPressed: () => Navigator.pop(context),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              children: [
                const SizedBox(
                  height: SPACING_MD,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      controller: _searchController,
                      cursorColor: TEXTFIELD_HINT_TXT_CLR,
                      textInputAction: TextInputAction.done,
                      // onChanged: _filterChats,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: WHITE_CLR,
                        hintText: 'Search Help',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: FONT_SM,
                          fontWeight: FontWeight.w400,
                          color: const Color(0XFF8F9098),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0XFFE0E2E7),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(13),
                          ),
                        ),
                        disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0XFFE0E2E7),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(13),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0XFFE0E2E7),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(13),
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 18,
                          color: Color(0XFF2F3036),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: SPACING_LG,
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    padding: EdgeInsets.zero,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return const OrDetails();
                    },
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

class OrDetails extends StatelessWidget {
  const OrDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: mediaQueryW(context) * 0.9,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 5,
                height: 90,
                decoration: const BoxDecoration(
                  color: DEFAULT_CLR,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                  ),
                ),
              ),
              Image.asset(
                'assets/images/qr_code.jpg',
                fit: BoxFit.fill,
                width: 80,
              ),
              SizedBox(
                width: mediaQueryW(context) * 0.1,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Project No : ',
                          style: GoogleFonts.inter(
                            fontSize: FONT_14,
                            fontWeight: FontWeight.bold,
                            color: BLACK_CLR,
                          ),
                        ),
                        TextSpan(
                          text: 'DG8797',
                          style: GoogleFonts.inter(
                            fontSize: FONT_14,
                            fontWeight: FontWeight.bold,
                            color: GREY_BLUR_SHADE_CLR,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SPACING_SM,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Customer ID :',
                          style: GoogleFonts.inter(
                            fontSize: FONT_XSS,
                            fontWeight: FontWeight.bold,
                            color: BLACK_CLR,
                          ),
                        ),
                        TextSpan(
                          text: '56657',
                          style: GoogleFonts.inter(
                            fontSize: FONT_XSS,
                            fontWeight: FontWeight.bold,
                            color: GREY_BLUR_SHADE_CLR,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SPACING_MD,
                  ),
                  Text(
                    '12-Feb-2024, 4:00 PM',
                    style: GoogleFonts.inter(
                      fontSize: FONT_XSS,
                      fontWeight: FontWeight.bold,
                      color: WARM_GRAY_CLR,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: mediaQueryW(context) * 0.05,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QRhistory()),
                  );
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: BLACK_CLR,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
