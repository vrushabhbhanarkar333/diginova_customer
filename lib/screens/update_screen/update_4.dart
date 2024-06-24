// ignore_for_file: camel_case_types

import 'package:diginova/controller/site_reading_controller.dart';
import 'package:diginova/global/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class UpdateScreen_4 extends StatefulWidget {
  const UpdateScreen_4({Key? key}) : super(key: key);

  @override
  State<UpdateScreen_4> createState() => _UpdateScreen_4State();
}

class _UpdateScreen_4State extends State<UpdateScreen_4> {
  final SiteReadinessController _update4Controller =
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
                        '4/4: STEP 4',
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
                          currentStep: 4,
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
                        _update4Controller.openBottomSheet();
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 18,
                          right: 5,
                        ),
                        child: Container(
                          width: 5, // Adjust the size of the point as needed
                          height: 5,
                          decoration: const BoxDecoration(
                            color: BLACK_CLR, // Color of the point
                            shape:
                                BoxShape.circle, // Shape of the point (circle)
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Requirement of Covid Negative test report or vaccination certificate required (Preferred)',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                            fontSize: FONT_14,
                            fontWeight: FontWeight.w400,
                            color: BLACK_CLR,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => Checkbox(
                        value: _update4Controller.isChecked_0.value,
                        onChanged: (bool? value) {
                          _update4Controller.selectYes_0();
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
                        value: _update4Controller.isChecked_1.value,
                        onChanged: (bool? value) {
                          _update4Controller.selectNo_0();
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
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 18,
                          right: 5,
                        ),
                        child: Container(
                          width: 5, // Adjust the size of the point as needed
                          height: 5,
                          decoration: const BoxDecoration(
                            color: BLACK_CLR, // Color of the point
                            shape:
                                BoxShape.circle, // Shape of the point (circle)
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Availability of Basic PPE as per guidelines followed for COVID 19 at site',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                            fontSize: FONT_14,
                            fontWeight: FontWeight.w400,
                            color: BLACK_CLR,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => Checkbox(
                        value: _update4Controller.isChecked_2.value,
                        onChanged: (bool? value) {
                          _update4Controller.selectYes_1();
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
                        value: _update4Controller.isChecked_3.value,
                        onChanged: (bool? value) {
                          _update4Controller.selectNo_1();
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
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 18,
                          right: 5,
                        ),
                        child: Container(
                          width: 5, // Adjust the size of the point as needed
                          height: 5,
                          decoration: const BoxDecoration(
                            color: BLACK_CLR, // Color of the point
                            shape:
                                BoxShape.circle, // Shape of the point (circle)
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Any specific or standard guideline apart from defined by state (Eg. Self-quarantine)',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                            fontSize: FONT_14,
                            fontWeight: FontWeight.w400,
                            color: BLACK_CLR,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => Checkbox(
                        value: _update4Controller.isChecked_4.value,
                        onChanged: (bool? value) {
                          _update4Controller.selectYes_2();
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
                        value: _update4Controller.isChecked_5.value,
                        onChanged: (bool? value) {
                          _update4Controller.selectNo_2();
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
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 18,
                          right: 5,
                        ),
                        child: Container(
                          width: 5, // Adjust the size of the point as needed
                          height: 5,
                          decoration: const BoxDecoration(
                            color: BLACK_CLR, // Color of the point
                            shape:
                                BoxShape.circle, // Shape of the point (circle)
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'First-Aid kit and AED available within less than 4 minutes from job location',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                            fontSize: FONT_14,
                            fontWeight: FontWeight.w400,
                            color: BLACK_CLR,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => Checkbox(
                        value: _update4Controller.isChecked_6.value,
                        onChanged: (bool? value) {
                          _update4Controller.selectYes_3();
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
                        value: _update4Controller.isChecked_7.value,
                        onChanged: (bool? value) {
                          _update4Controller.selectNo_3();
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
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 5,
                        ),
                        child: Container(
                          width: 5, // Adjust the size of the point as needed
                          height: 5,
                          decoration: const BoxDecoration(
                            color: BLACK_CLR, // Color of the point
                            shape:
                                BoxShape.circle, // Shape of the point (circle)
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Availability of fire extinguishers at job location',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                            fontSize: FONT_14,
                            fontWeight: FontWeight.w400,
                            color: BLACK_CLR,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => Checkbox(
                        value: _update4Controller.isChecked_8.value,
                        onChanged: (bool? value) {
                          _update4Controller.selectYes_4();
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
                        value: _update4Controller.isChecked_9.value,
                        onChanged: (bool? value) {
                          _update4Controller.selectNo_4();
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
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 18,
                          right: 5,
                        ),
                        child: Container(
                          width: 5, // Adjust the size of the point as needed
                          height: 5,
                          decoration: const BoxDecoration(
                            color: BLACK_CLR, // Color of the point
                            shape:
                                BoxShape.circle, // Shape of the point (circle)
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Availability of Trained First Aiders & Medical responder at site',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                            fontSize: FONT_14,
                            fontWeight: FontWeight.w400,
                            color: BLACK_CLR,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => Checkbox(
                        value: _update4Controller.isChecked_10.value,
                        onChanged: (bool? value) {
                          _update4Controller.selectYes_5();
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
                        value: _update4Controller.isChecked_11.value,
                        onChanged: (bool? value) {
                          _update4Controller.selectNo_5();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Text(
                        'Name & Contact details',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                          fontSize: FONT_14,
                          fontWeight: FontWeight.w400,
                          color: BLACK_CLR,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: SPACING_SM),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    cursorColor: TEXTFIELD_BG_CLR,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 12),
                      hintText: 'Bangaluru',
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
                const SizedBox(height: SPACING_XXS),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                  child: SizedBox(
                    height: 50,
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
                              Text(
                                "Updated Successfully",
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
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: BTN_BLUE_CLR,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(9.77),
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor: BTN_BLUE_CLR,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.77),
                        ),
                      ),
                      child: Text(
                        "Finished",
                        style: GoogleFonts.poppins(
                          fontSize: FONT_XSS,
                          fontWeight: FontWeight.w600,
                          color: WHITE_CLR,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: SPACING_XL),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
