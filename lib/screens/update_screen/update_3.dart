import 'package:diginova/controller/site_reading_controller.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/update_screen/update_4.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

// ignore: camel_case_types
class UpdateScreen_3 extends StatefulWidget {
  const UpdateScreen_3({super.key});

  @override
  State<UpdateScreen_3> createState() => _UpdateScreen_3State();
}

// ignore: camel_case_types
class _UpdateScreen_3State extends State<UpdateScreen_3> {
  final SiteReadinessController _siteReadinessController =
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
                        '3/4: STEP 3',
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
                          currentStep: 3,
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
                        _siteReadinessController.openBottomSheet();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 12),
                      child: Container(
                        width: 5, // Adjust the size of the point as needed
                        height: 5,
                        decoration: const BoxDecoration(
                          color: BLACK_CLR, // Color of the point
                          shape: BoxShape.circle, // Shape of the point (circle)
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 20, top: 10),
                      child: Text(
                        'Call Request for:',
                        style: GoogleFonts.poppins(
                          fontSize: FONT_14,
                          fontWeight: FontWeight.w400,
                          color: BLACK_CLR,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: PADDING_LG, right: PADDING_SM),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Installation and commissioning',
                            style: GoogleFonts.poppins(
                              fontSize: FONT_14,
                              fontWeight: FontWeight.w400,
                              color: BLACK_CLR,
                            ),
                          ),
                          Checkbox(
                            value: _siteReadinessController.boxOne.value,
                            onChanged: (bool? value) {
                              setState(() {
                                _siteReadinessController.boxOne.value = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Service',
                            style: GoogleFonts.poppins(
                              fontSize: FONT_14,
                              fontWeight: FontWeight.w400,
                              color: BLACK_CLR,
                            ),
                          ),
                          Checkbox(
                            value: _siteReadinessController.boxTwo.value,
                            onChanged: (bool? value) {
                              setState(() {
                                _siteReadinessController.boxTwo.value = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'AMC/ROC',
                            style: GoogleFonts.poppins(
                              fontSize: FONT_14,
                              fontWeight: FontWeight.w400,
                              color: BLACK_CLR,
                            ),
                          ),
                          Checkbox(
                            value: _siteReadinessController.boxThree.value,
                            onChanged: (bool? value) {
                              setState(() {
                                _siteReadinessController.boxThree.value =
                                    value!;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Inspecton',
                            style: GoogleFonts.poppins(
                              fontSize: FONT_14,
                              fontWeight: FontWeight.w400,
                              color: BLACK_CLR,
                            ),
                          ),
                          Checkbox(
                            value: _siteReadinessController.boxFour.value,
                            onChanged: (bool? value) {
                              setState(() {
                                _siteReadinessController.boxFour.value = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'No of transformers:',
                            style: GoogleFonts.poppins(
                              fontSize: FONT_14,
                              fontWeight: FontWeight.w400,
                              color: BLACK_CLR,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8, top: 5),
                            child: Container(
                              height: 35,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: WHITE_CLR,
                              ),
                              child: Center(
                                child: Text(
                                  '2',
                                  style: GoogleFonts.poppins(
                                    fontSize: FONT_14,
                                    fontWeight: FontWeight.w400,
                                    color: GREY_COLOR_SHADE,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: SPACING_M,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17, right: 17),
                  child: Row(
                    children: [
                      Container(
                        width: 5, // Adjust the size of the point as needed
                        height: 5,
                        decoration: const BoxDecoration(
                          color: BLACK_CLR, // Color of the point
                          shape: BoxShape.circle, // Shape of the point (circle)
                        ),
                      ),
                      Text(
                        '  Transformer Status:',
                        style: GoogleFonts.poppins(
                          fontSize: FONT_14,
                          fontWeight: FontWeight.w400,
                          color: BLACK_CLR,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 17, top: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Under shutdown',
                            style: GoogleFonts.poppins(
                              fontSize: FONT_14,
                              fontWeight: FontWeight.w400,
                              color: BLACK_CLR,
                            ),
                          ),
                          Checkbox(
                            value: _siteReadinessController.boxFive.value,
                            onChanged: (bool? value) {
                              setState(() {
                                _siteReadinessController.boxFive.value = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Under service/ charged',
                            style: GoogleFonts.poppins(
                              fontSize: FONT_14,
                              fontWeight: FontWeight.w400,
                              color: BLACK_CLR,
                            ),
                          ),
                          Checkbox(
                            value: _siteReadinessController.boxSix.value,
                            onChanged: (bool? value) {
                              setState(() {
                                _siteReadinessController.boxSix.value = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Panel/drawing sr.no',
                            style: GoogleFonts.poppins(
                              fontSize: FONT_14,
                              fontWeight: FontWeight.w400,
                              color: BLACK_CLR,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8, top: 5),
                            child: Container(
                              height: 35,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: WHITE_CLR,
                              ),
                              child: Center(
                                child: Text(
                                  '2',
                                  style: GoogleFonts.poppins(
                                    fontSize: FONT_14,
                                    fontWeight: FontWeight.w400,
                                    color: GREY_COLOR_SHADE,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: SPACING_LG),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Transformer location work required at',
                              style: GoogleFonts.poppins(
                                fontSize: FONT_14,
                                fontWeight: FontWeight.w400,
                                color: BLACK_CLR,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: SPACING_M),
                      TextFormField(
                        cursorColor: TEXTFIELD_BG_CLR,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 12),
                          hintText: 'Bangaluru',
                          filled: true,
                          fillColor: WHITE_SHADE_CLR,
                          hintStyle: GoogleFonts.poppins(
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
                      const SizedBox(height: SPACING_XL),
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
                                  Radius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const UpdateScreen_4(),
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
                      const SizedBox(height: SPACING_SM),
                    ],
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
