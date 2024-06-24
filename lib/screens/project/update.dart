import 'package:diginova/controller/project_controller/recent_update_controller.dart';
import 'package:diginova/global/appbar.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/project/perforenmence/performence.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Update extends StatelessWidget {
  const Update({super.key});

  @override
  Widget build(BuildContext context) {
    final RecentUpdateController _recentUpdateController =
        Get.put(RecentUpdateController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            BACKGROUNDIMAGE,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 249,
                  child: Card(
                    margin: EdgeInsets.zero,
                    elevation: 0.7,
                    color: WHITE_SHADE_CLR,
                    surfaceTintColor: Colors.transparent,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        AppBarNova(
                          onPressed: () => Navigator.pop(context),
                          title: '',
                          fontWeight: FontWeight.normal,
                          fontSize: 0,
                          color: Colors.transparent,
                        ),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: PADDING_MD,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _recentUpdateController
                                            .updateList[index]['title'],
                                        style: TEXT_STYLE_FONT_20_SEMI_BOLD,
                                      ),
                                      Text(
                                        _recentUpdateController
                                            .updateList[index]['days'],
                                        style: GoogleFonts.poppins(
                                          fontSize: FONT_XS,
                                          fontWeight: FontWeight.w400,
                                          color: BLUR_GREY_SHADE_CLRS,
                                        ),
                                      ),
                                      const SizedBox(height: SPACING_MD),
                                      SizedBox(
                                        height: 35.03,
                                        width: 124,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const PerformanceScreen(),
                                              ),
                                            );
                                          },
                                          style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    DEFAULT_CLR),
                                            shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadiusDirectional.all(
                                                  Radius.circular(48.25),
                                                ),
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            "Get PDF",
                                            style: GoogleFonts.poppins(
                                              fontSize: FONT_XS,
                                              fontWeight: FontWeight.w600,
                                              color: WHITE_CLR,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Image.asset('assets/images/image 1.png',
                                      width: mediaQueryW(context) * 0.3)
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: PADDING_MD,
                    left: PADDING_MD,
                  ),
                  child: Text(
                    'Description',
                    style: FONT_14_SEMI_BOLD_TXT_STYLE,
                  ),
                ),
                const SizedBox(height: SPACING_LG),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: SPACING_MD),
                      itemCount: descriptionList.length,
                      itemBuilder: (context, index) {
                        return RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${index + 1}. ',
                                style: GoogleFonts.poppins(
                                  fontSize: FONT_16,
                                  fontWeight: FontWeight.w400,
                                  color: DEFAULT_CLR,
                                ),
                              ),
                              TextSpan(
                                text: descriptionList[index]['title'],
                                style: GoogleFonts.poppins(
                                  fontSize: FONT_16,
                                  fontWeight: FontWeight.w400,
                                  color: DEFAULT_CLR,
                                ),
                              ),
                              TextSpan(
                                text: ': ',
                                style: GoogleFonts.poppins(
                                  fontSize: FONT_16,
                                  fontWeight: FontWeight.w500,
                                  color: DEFAULT_CLR,
                                ),
                              ),
                              TextSpan(
                                text: descriptionList[index]['descr'],
                                style: GoogleFonts.poppins(
                                  fontSize: FONT_16,
                                  fontWeight: FontWeight.w400,
                                  color: BLUR_GREY_SHADE_CLRS,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
