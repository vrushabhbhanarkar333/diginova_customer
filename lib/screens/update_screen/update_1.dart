import 'package:diginova/controller/site_reading_controller.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/update_screen/update_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

// ignore: camel_case_types
class UpdateScreen_1 extends StatefulWidget {
  const UpdateScreen_1({super.key});

  @override
  State<UpdateScreen_1> createState() => _UpdateScreen_1State();
}

// ignore: camel_case_types
class _UpdateScreen_1State extends State<UpdateScreen_1> {
  final SiteReadinessController _update1Controller =
      Get.put(SiteReadinessController());
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
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0, // Remove shadow
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 15,
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1/4: STEP 1',
                        style: GoogleFonts.poppins(
                          fontSize: FONT_XSS,
                          fontWeight: FontWeight.bold,
                          color: BLACK_CLR_SHADE,
                        ),
                      ),
                      const SizedBox(height: SPACING_MD),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.23,
                        child: StepProgressIndicator(
                          size: 5,
                          totalSteps: 4,
                          currentStep: 1,
                          selectedColor: BLUE_DARK_CLR,
                          unselectedColor: TEXTFIELD_BORDER_CLR,
                          roundedEdges: const Radius.circular(20),
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        _update1Controller.openBottomSheet();
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: SPACING_MD),
                const Divider(
                  color: DIVIDER_CLR,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                    left: 25,
                    right: 25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Site Name',
                        style: GoogleFonts.poppins(
                          fontSize: FONT_14,
                          fontWeight: FontWeight.w400,
                          color: BLACK_CLR,
                        ),
                      ),
                      const SizedBox(height: SPACING_XS),
                      SizedBox(
                        height: 56,
                        child: TextFormField(
                          cursorColor: TEXTFIELD_BG_CLR,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 12),
                            hintText: 'Full Name',
                            filled: true,
                            fillColor: WHITE_CLR,
                            hintStyle: GoogleFonts.inter(
                              fontSize: FONT_14,
                              fontWeight: FontWeight.w400,
                              color: TXT_FIELD_HINT_CLR,
                            ),
                            enabledBorder: const OutlineInputBorder(
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
                          ),
                        ),
                      ),
                      const SizedBox(height: SPACING_M),
                      Text(
                        'Site Manager',
                        style: GoogleFonts.poppins(
                          fontSize: FONT_14,
                          fontWeight: FontWeight.w400,
                          color: BLACK_CLR,
                        ),
                      ),
                      const SizedBox(height: SPACING_XS),
                      SizedBox(
                        height: 56,
                        child: TextFormField(
                          cursorColor: TEXTFIELD_BG_CLR,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 12),
                            hintText: 'Name',
                            filled: true,
                            fillColor: WHITE_CLR,
                            hintStyle: GoogleFonts.inter(
                              fontSize: FONT_14,
                              fontWeight: FontWeight.w400,
                              color: TXT_FIELD_HINT_CLR,
                            ),
                            enabledBorder: const OutlineInputBorder(
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
                          ),
                        ),
                      ),
                      const SizedBox(height: SPACING_M),
                      Text(
                        'Contact',
                        style: GoogleFonts.poppins(
                          fontSize: FONT_14,
                          fontWeight: FontWeight.w400,
                          color: BLACK_CLR,
                        ),
                      ),
                      const SizedBox(height: SPACING_XS),
                      SizedBox(
                        height: 56,
                        child: TextFormField(
                          cursorColor: TEXTFIELD_BG_CLR,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 12),
                            hintText: '+91 9009909090',
                            filled: true,
                            fillColor: WHITE_CLR,
                            hintStyle: GoogleFonts.inter(
                              fontSize: FONT_14,
                              fontWeight: FontWeight.w400,
                              color: TXT_FIELD_HINT_CLR,
                            ),
                            enabledBorder: const OutlineInputBorder(
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
                          ),
                        ),
                      ),
                      const SizedBox(height: SPACING_M),
                      Text(
                        'Email',
                        style: GoogleFonts.poppins(
                          fontSize: FONT_14,
                          fontWeight: FontWeight.w400,
                          color: BLACK_CLR,
                        ),
                      ),
                      const SizedBox(height: SPACING_XS),
                      SizedBox(
                        height: 56,
                        child: TextFormField(
                          cursorColor: TEXTFIELD_BG_CLR,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 12),
                            hintText: 'Levon@13gmail.com',
                            filled: true,
                            fillColor: WHITE_CLR,
                            hintStyle: GoogleFonts.inter(
                              fontSize: FONT_14,
                              fontWeight: FontWeight.w400,
                              color: TXT_FIELD_HINT_CLR,
                            ),
                            enabledBorder: const OutlineInputBorder(
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
                          ),
                        ),
                      ),
                      const SizedBox(height: SPACING_M),
                      Text(
                        'Site full postal address',
                        style: GoogleFonts.poppins(
                          fontSize: FONT_14,
                          fontWeight: FontWeight.w400,
                          color: BLACK_CLR,
                        ),
                      ),
                      const SizedBox(height: SPACING_XS),
                      SizedBox(
                        height: 56,
                        child: TextFormField(
                          cursorColor: TEXTFIELD_BG_CLR,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 12),
                            hintText: 'Hsr',
                            filled: true,
                            fillColor: WHITE_CLR,
                            hintStyle: GoogleFonts.inter(
                              fontSize: FONT_14,
                              fontWeight: FontWeight.w400,
                              color: TXT_FIELD_HINT_CLR,
                            ),
                            enabledBorder: const OutlineInputBorder(
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
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: SPACING_M),
                Padding(
                  padding: const EdgeInsets.all(
                    16,
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
                              Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UpdateScreen_2(),
                          ),
                        );
                      },
                      child: Text(
                        "Next",
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
        ],
      ),
    );
  }
}

class SiteReadinessBottomSheet extends StatelessWidget {
  const SiteReadinessBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0XFFEDF7FF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: ListView.builder(
          itemCount: updateList.length,
          itemBuilder: (context, index) {
            return SiteReadinessCard(
              title: "${updateList[index]['title']} ${index + 1}",
              description: updateList[index]['Description'],
              icons: index == 0
                  ? const Icon(
                      Icons.check_circle_outlined,
                      size: 25,
                      color: GREEN_SHADE_CLR,
                    )
                  : index == 1
                      ? Image.asset(
                          'assets/icons/inprocess_cercle.png',
                          height: 24,
                          width: 24,
                        )
                      : index == 2
                          ? Image.asset(
                              'assets/icons/edit_cercle.png',
                              height: 24,
                              width: 24,
                            )
                          : index == 3
                              ? Image.asset(
                                  'assets/icons/edit_cercle.png',
                                  height: 24,
                                  width: 24,
                                )
                              : Container(),
            );
          },
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> updateList = [
  {
    'title': 'Step',
    'Description': 'This step is completed',
  },
  {
    'title': 'Step',
    'Description': 'This step is Progress',
  },
  {
    'title': 'Step',
    'Description': 'This is todo step',
  },
  {
    'title': 'Step',
    'Description': 'This is another todo step',
  },
];

class SiteReadinessCard extends StatelessWidget {
  final String title;
  final String description;
  final Widget icons;
  const SiteReadinessCard({
    super.key,
    required this.title,
    required this.description,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Card(
        elevation: 0.5,
        surfaceTintColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: FONT_16,
                      color: BLACK_CLR,
                    ),
                  ),
                  icons,
                ],
              ),
              const SizedBox(height: SPACING_SM),
              Text(
                description,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: FONT_14,
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
