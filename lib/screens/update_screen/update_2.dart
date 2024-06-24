// ignore_for_file: camel_case_types

import 'package:diginova/controller/site_reading_controller.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/update_screen/update_3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class UpdateScreen_2 extends StatefulWidget {
  const UpdateScreen_2({super.key});

  @override
  State<UpdateScreen_2> createState() => _UpdateScreen_2State();
}

class _UpdateScreen_2State extends State<UpdateScreen_2> {
  final SiteReadinessController _updateScreen2Controller =
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
                        '2/4: STEP 2',
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
                          currentStep: 2,
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
                        _updateScreen2Controller.openBottomSheet();
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: DIVIDER_CLR,
                  thickness: 1,
                ),
                const SizedBox(height: SPACING_M),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nearest airport',
                        style: GoogleFonts.poppins(
                          fontSize: FONT_14,
                          fontWeight: FontWeight.w500,
                          color: BLACK_CLR_SHADE,
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
                            hintText: 'Full name',
                            filled: true,
                            fillColor: WHITE_SHADE_CLR,
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
                        'Nearest railway station',
                        style: GoogleFonts.poppins(
                          fontSize: FONT_14,
                          fontWeight: FontWeight.w500,
                          color: BLACK_CLR_SHADE,
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
                            fillColor: WHITE_SHADE_CLR,
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
                        textAlign: TextAlign.start,
                        '* Avaliability of accommodation facility within  site premises: (Preferred)',
                        style: GoogleFonts.poppins(
                          fontSize: FONT_14,
                          fontWeight: FontWeight.w500,
                          color: BLACK_CLR_SHADE,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(
                            () => Checkbox(
                              value: _updateScreen2Controller.isChecked.value,
                              onChanged: (bool? value) {
                                if (value != null && value) {
                                  _updateScreen2Controller.selectYes();
                                }
                              },
                            ),
                          ),
                          Text(
                            "Yes",
                            style: GoogleFonts.poppins(
                              fontSize: FONT_14,
                              fontWeight: FontWeight.w500,
                              color: BLACK_CLR,
                            ),
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          Obx(
                            () => Checkbox(
                              value: _updateScreen2Controller.isChecked1.value,
                              onChanged: (bool? value) {
                                if (value != null && value) {
                                  _updateScreen2Controller.selectNo();
                                }
                              },
                            ),
                          ),
                          Text(
                            "No",
                            style: GoogleFonts.poppins(
                              fontSize: FONT_14,
                              fontWeight: FontWeight.w500,
                              color: BLACK_CLR,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'If No, please mention site nearby accommodation cityArea (Hotel details)',
                        style: GoogleFonts.poppins(
                          fontSize: FONT_14,
                          fontWeight: FontWeight.w500,
                          color: TXT_FIELD_HINT_CLR,
                        ),
                      ),
                      const SizedBox(height: SPACING_MD),
                      TextFormField(
                        maxLines: 4,
                        cursorColor: TEXTFIELD_BG_CLR,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 12),
                          hintText: 'Full name',
                          filled: true,
                          fillColor: WHITE_SHADE_CLR,
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
                      const SizedBox(height: SPACING_MD),
                      Text(
                        '* Availability of Local transportation facility by customer at site: (Preferred)',
                        style: GoogleFonts.poppins(
                          fontSize: FONT_14,
                          fontWeight: FontWeight.w500,
                          color: BLACK_CLR_SHADE,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(
                            () => Checkbox(
                              value: _updateScreen2Controller.isChecked2.value,
                              onChanged: (bool? value) {
                                _updateScreen2Controller.selectYes1();
                              },
                            ),
                          ),
                          Text(
                            "Yes",
                            style: GoogleFonts.poppins(
                              fontSize: FONT_14,
                              fontWeight: FontWeight.w500,
                              color: BLACK_CLR,
                            ),
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          Obx(
                            () => Checkbox(
                              value: _updateScreen2Controller.isChecked3.value,
                              onChanged: (bool? value) {
                                _updateScreen2Controller.selectNo1();
                              },
                            ),
                          ),
                          Text(
                            "No",
                            style: GoogleFonts.poppins(
                              fontSize: FONT_14,
                              fontWeight: FontWeight.w500,
                              color: BLACK_CLR,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        '(pick and drop GE team from guest house within site premises or nearest safe & hygiene location)',
                        style: GoogleFonts.poppins(
                          fontSize: FONT_14,
                          fontWeight: FontWeight.w400,
                          color: GRAY_CLR_SHADE,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'PO No. and Date. (*If Chargeable visit)',
                        style: GoogleFonts.poppins(
                          fontSize: FONT_14,
                          fontWeight: FontWeight.w500,
                          color: BLACK_CLR_SHADE,
                        ),
                      ),
                      const SizedBox(height: SPACING_SM),
                      SizedBox(
                        height: 56,
                        child: TextFormField(
                          cursorColor: TEXTFIELD_BG_CLR,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.calendar_month_outlined,
                                  color: GREY_COLOR_SHADE,
                                )),
                            contentPadding: const EdgeInsets.only(left: 12),
                            hintText: 'Name',
                            filled: true,
                            fillColor: WHITE_SHADE_CLR,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(DEFAULT_CLR),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const UpdateScreen_3(),
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
                const SizedBox(height: SPACING_MD),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
