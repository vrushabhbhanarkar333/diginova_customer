import 'dart:developer';

import 'package:another_stepper/another_stepper.dart';
import 'package:diginova/controller/project_controller/inprogress_controller.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/model/project_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'project_ongoing.dart';

class InProgress extends StatefulWidget {
  const InProgress({super.key});

  @override
  State<InProgress> createState() => _InProgressState();
}

class _InProgressState extends State<InProgress> {
  final InProgressController _inProgressController = InProgressController();

  @override
  void initState() {
    super.initState();
    _inProgressController.fetchProjectData();
    print(
        'Print statement for the Project Progress Screen ${_inProgressController.fetchProjectData()}');
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      log("Building InProgress widget");
      if (_inProgressController.projectDataList.isEmpty) {
        log("Project data list is empty");
        debugPrint('Project data list is empty');
        return Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: GestureDetector(
            onTap: () {
              _inProgressController.currentStep;
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => OngoingProject(
              //       projectController: projectData,
              //     ),
              //   ),
              // );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            // projectData.projectID ?? "Unknown",
                            'Project Test Name',
                            style: GoogleFonts.poppins(
                              fontSize: FONT_M,
                              fontWeight: FontWeight.w600,
                              color: BLACK_CLR,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => OngoingProject(
                              //       projectController: projectData,
                              //     ),
                              //   ),
                              // );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: _inProgressController.onWork.value
                                    ? DEFAULT_CLR
                                    : SELECTED_ICON_CLR,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              height: 31,
                              width: MediaQuery.of(context).size.width * 0.20,
                              child: Center(
                                child: Text(
                                  "On Work",
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
                    const SizedBox(height: 8),
                    const Divider(color: DIVIDER_CLR),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            // projectData.projectName,
                            'Test Project',
                            style: GoogleFonts.poppins(
                              fontSize: FONT_M,
                              fontWeight: FontWeight.w600,
                              color: BLACK_CLR,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            // projectData.projectDetails,
                            'Its a details about the Test project..',
                            style: GoogleFonts.poppins(
                              fontSize: FONT_XSS,
                              fontWeight: FontWeight.w500,
                              color: GREY_BLUR_SHADE_CLR,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: AnotherStepper(
                        iconHeight: 20,
                        iconWidth: 20,
                        // activeIndex: projectData.steps.length,
                        activeIndex: 2,
                        barThickness: 1.5,
                        stepperList: List.generate(
                          // projectData.steps.length,
                          2,
                          (index) {
                            return StepperData(
                              iconWidget: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0XFF0052B4),
                                  //  projectData.steps.isNotEmpty &&
                                  //         projectData.steps[index].status
                                  //                 .toString()
                                  //                 .toLowerCase() ==
                                  //             "completed"
                                  //     ? const Color(0XFF0052B4)
                                  //     : DIVIDER_CLR,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    // projectData.steps[index].stepNumber
                                    // .toString(),
                                    "12345",
                                    style: TEXT_STYLE_XS.copyWith(
                                      color: WHITE_CLR,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        stepperDirection: Axis.horizontal,
                        inActiveBarColor:
                            Colors.blue.toString().toLowerCase() == "completed"
                                ? DIVIDER_CLR
                                : const Color(0XFF0052B4),
                        activeBarColor: Colors.green.toString().toLowerCase() ==
                                "on progress"
                            ? const Color(0XFF0052B4)
                            : DIVIDER_CLR,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 25, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              '3 Jully 2024',
                              style: GoogleFonts.poppins(
                                fontSize: FONT_XSS,
                                fontWeight: FontWeight.w500,
                                color: GREY_BLUR_SHADE_CLR,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              // projectData.endDate != null
                              //     ? 'Estimated ${DateFormat('dd MMM yyyy').format(DateTime.parse(projectData.endDate!))}'
                              //     : "Unknown",
                              'Estimated ${DateFormat('dd MMM yyyy')}',
                              style: GoogleFonts.poppins(
                                fontSize: FONT_XSS,
                                fontWeight: FontWeight.w500,
                                color: GREY_BLUR_SHADE_CLR,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Started',
                            style: GoogleFonts.poppins(
                              fontSize: FONT_14,
                              fontWeight: FontWeight.w500,
                              color: BLACK_CLR,
                            ),
                          ),
                          Text(
                            'Finishing',
                            style: GoogleFonts.poppins(
                              fontSize: FONT_14,
                              fontWeight: FontWeight.w500,
                              color: BLACK_CLR,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        );
        // const Center(
        //   child:
        //       // CircularProgressIndicator()
        //       // Text('No Projects found'),
        // );
      } else {
        log("Project data list is not empty, length: ${_inProgressController.projectDataList.length}");
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: _inProgressController.projectDataList.length,
          itemBuilder: (context, index) {
            ProjectDataModel projectData =
                _inProgressController.projectDataList[index];
            log("Project Data at index $index: ${projectData.projectName}");

            return Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: GestureDetector(
                onTap: () {
                  _inProgressController.currentStep;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OngoingProject(
                        projectController: projectData,
                      ),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                projectData.projectID ?? "Unknown",
                                style: GoogleFonts.poppins(
                                  fontSize: FONT_M,
                                  fontWeight: FontWeight.w600,
                                  color: BLACK_CLR,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OngoingProject(
                                        projectController: projectData,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: _inProgressController.onWork.value
                                        ? DEFAULT_CLR
                                        : SELECTED_ICON_CLR,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  height: 31,
                                  width:
                                      MediaQuery.of(context).size.width * 0.20,
                                  child: Center(
                                    child: Text(
                                      "On Work",
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
                        const SizedBox(height: 8),
                        const Divider(color: DIVIDER_CLR),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                projectData.projectName,
                                style: GoogleFonts.poppins(
                                  fontSize: FONT_M,
                                  fontWeight: FontWeight.w600,
                                  color: BLACK_CLR,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                projectData.projectDetails,
                                style: GoogleFonts.poppins(
                                  fontSize: FONT_XSS,
                                  fontWeight: FontWeight.w500,
                                  color: GREY_BLUR_SHADE_CLR,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: AnotherStepper(
                            iconHeight: 20,
                            iconWidth: 20,
                            activeIndex: projectData.steps.length,
                            barThickness: 1.5,
                            stepperList: List.generate(
                              projectData.steps.length,
                              (index) {
                                return StepperData(
                                  iconWidget: Container(
                                    decoration: BoxDecoration(
                                      color: projectData.steps.isNotEmpty &&
                                              projectData.steps[index].status
                                                      .toString()
                                                      .toLowerCase() ==
                                                  "completed"
                                          ? const Color(0XFF0052B4)
                                          : DIVIDER_CLR,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        projectData.steps[index].stepNumber
                                            .toString(),
                                        style: TEXT_STYLE_XS.copyWith(
                                          color: WHITE_CLR,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            stepperDirection: Axis.horizontal,
                            inActiveBarColor: projectData.steps.last.status
                                        .toString()
                                        .toLowerCase() ==
                                    "completed"
                                ? DIVIDER_CLR
                                : const Color(0XFF0052B4),
                            activeBarColor: projectData.steps.last.status
                                        .toString()
                                        .toLowerCase() ==
                                    "on progress"
                                ? const Color(0XFF0052B4)
                                : DIVIDER_CLR,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 25, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  DateFormat('dd MMM yyyy').format(
                                      DateTime.parse(projectData.startDate)),
                                  style: GoogleFonts.poppins(
                                    fontSize: FONT_XSS,
                                    fontWeight: FontWeight.w500,
                                    color: GREY_BLUR_SHADE_CLR,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  projectData.endDate != null
                                      ? 'Estimated ${DateFormat('dd MMM yyyy').format(DateTime.parse(projectData.endDate!))}'
                                      : "Unknown",
                                  style: GoogleFonts.poppins(
                                    fontSize: FONT_XSS,
                                    fontWeight: FontWeight.w500,
                                    color: GREY_BLUR_SHADE_CLR,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Started',
                                style: GoogleFonts.poppins(
                                  fontSize: FONT_14,
                                  fontWeight: FontWeight.w500,
                                  color: BLACK_CLR,
                                ),
                              ),
                              Text(
                                'Finishing',
                                style: GoogleFonts.poppins(
                                  fontSize: FONT_14,
                                  fontWeight: FontWeight.w500,
                                  color: BLACK_CLR,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }
    });
  }
}
