import 'dart:developer';

import 'package:diginova/model/ongoing_project_model.dart';
import 'package:diginova/model/project_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../global/constant.dart';

class OngoingProject extends StatefulWidget {
  ProjectDataModel projectController;
  OngoingProject({super.key, required this.projectController});

  @override
  State<OngoingProject> createState() => _OngoingProjectState();
}

class _OngoingProjectState extends State<OngoingProject> {
  // final ProjectDetailsController _projectController =
  //     Get.put(ProjectDetailsController());

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate a delay for fetching data
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });
  }

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
          _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                      AppBar(
                        centerTitle: true,
                        title: Text(
                          'Ongoing',
                          style: TEXT_STYLE_M_SEMI_BOLD,
                        ),
                        backgroundColor: Colors.transparent,
                        leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 15,
                          ),
                        ),
                      ),
                      // Center(
                      //   child: Text(
                      //     'Ongoing',
                      //     style: TEXT_STYLE_M_SEMI_BOLD,
                      //   ),
                      // ),

                      Padding(
                        padding: const EdgeInsets.all(PADDING_SM),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: PADDING_XS, horizontal: PADDING_SM),
                              decoration: BoxDecoration(
                                color: WHITE_CLR,
                                borderRadius:
                                    BorderRadius.circular(BORDER_RADIUS_XL),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.projectController.projectName ??
                                            "",
                                        style: TEXT_STYLE_MD.copyWith(
                                            color: BLACK_CLR),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              BORDER_RADIUS_LG),
                                          color: SELECTED_ICON_CLR,
                                        ),
                                        padding:
                                            const EdgeInsets.all(PADDING_XS),
                                        child: Text(
                                          'On work',
                                          style: TEXT_STYLE_SM_BOLD.copyWith(
                                              color: WHITE_CLR),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Divider(
                                    color: DIVIDER_CLR,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        DateFormat('dd MMM yyyy').format(
                                          DateTime.parse(
                                            widget.projectController
                                                    .startDate ??
                                                "",
                                          ),
                                        ),
                                        style: GoogleFonts.poppins(
                                          fontSize: FONT_14,
                                          fontWeight: FontWeight.normal,
                                          color: BLACK_CLR,
                                        ),
                                      ),
                                      Text(
                                        'Estimated ${DateFormat('dd MMM yyyy').format(
                                          DateTime.parse(
                                            widget.projectController.endDate ??
                                                "",
                                          ),
                                        )}',
                                        style: GoogleFonts.poppins(
                                          fontSize: FONT_14,
                                          fontWeight: FontWeight.normal,
                                          color: BLACK_CLR,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: SPACING_XS),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Started',
                                        style: GoogleFonts.poppins(
                                          fontSize: FONT_14,
                                          fontWeight: FontWeight.bold,
                                          color: BLACK_CLR,
                                        ),
                                      ),
                                      Text(
                                        'Finishing',
                                        style: GoogleFonts.poppins(
                                          fontSize: FONT_14,
                                          fontWeight: FontWeight.bold,
                                          color: BLACK_CLR,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: widget.projectController.steps.length,
                              itemBuilder: (context, index) {
                                final projectData = widget.projectController;
                                final step = projectData.steps[index];
                                final bool isCompleted =
                                    step.status == 'Completed';

                                return StatusItemWidget(
                                  date: DateFormat('dd MMM yyyy').format(
                                    DateTime.parse(
                                        projectData.createdDate ?? ""),
                                  ),
                                  firstImage: projectData.imageUrl ?? "",
                                  time: '20.53',
                                  status:
                                      'Work ${projectData.steps[index].status}',
                                  work:
                                      '${projectData.steps[index].title} Status',
                                  cardClr: isCompleted
                                      ? SELECTED_ICON_CLR
                                      : const Color.fromARGB(
                                          255, 238, 238, 238),
                                  fontClr:
                                      isCompleted ? WHITE_CLR : Colors.black,
                                  // done: true,
                                );
                              },
                            ),
                          ],
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

class StatusItemWidget extends StatelessWidget {
  final String date;
  final Color cardClr;
  final Color fontClr;
  final String time;
  final String status;
  final String work;
  final String firstImage;
  // final bool done;

  const StatusItemWidget({
    super.key,
    required this.date,
    required this.time,
    required this.status,
    required this.work,
    required this.firstImage,
    // required thisImage,
    required this.cardClr,
    required this.fontClr,
  });

  @override
  Widget build(BuildContext context) {
    // Color containerColor =
    // ? SELECTED_ICON_CLR
    // : const Color.fromARGB(255, 235, 233, 233);
    // Color fontColor = done ? WHITE_CLR : Colors.black;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              const SizedBox(height: 5.0),
              Text(date, style: TEXT_STYLE_XS_BOLD),
              Text(
                time,
                style: TEXT_STYLE.copyWith(fontSize: FONT_XS),
              )
            ],
          ),
          const SizedBox(width: 8.0),
          Column(
            children: [
              Container(height: 45, width: 10, color: cardClr),
              Container(
                height: 35,
                width: 35,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: cardClr),
                child: const Icon(Icons.circle, color: Colors.white),
              ),
              Container(height: 45, width: 10, color: cardClr)
            ],
          ),
          const SizedBox(width: 8.0),
          Container(
            width: MediaQuery.of(context).size.width * 0.57,
            padding: const EdgeInsets.all(PADDING_XS),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(BORDER_RADIUS_MD),
                color: cardClr),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TEXT_STYLE.copyWith(
                      fontSize: FONT_SM,
                      fontWeight: FontWeight.w900,
                      color: fontClr,
                    ),
                    children: [
                      TextSpan(
                        text: status,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  work,
                  style: TEXT_STYLE.copyWith(
                    fontSize: FONT_XSS,
                    fontWeight: FontWeight.w500,
                    color: fontClr,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundImage: NetworkImage(
                            firstImage == ""
                                ? firstImage
                                : "https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image-300x225.png",
                          ),
                        ),
                        // Positioned(
                        //   left: MediaQuery.of(context).size.width * 0.03,
                        //   child: CircleAvatar(
                        //     radius: 10,
                        //     backgroundImage: NetworkImage(
                        //       secondImage,
                        //     ),
                        //   ),

                        //   //  Image.network(
                        //   //   secondImage,
                        //   //   width: MediaQuery.of(context).size.width * 0.05,
                        //   //   height: MediaQuery.of(context).size.height * 0.05,
                        //   // ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Text(
                      'Work by team',
                      style: GoogleFonts.poppins(
                        fontSize: FONT_SM,
                        fontWeight: FontWeight.normal,
                        color: fontClr,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
