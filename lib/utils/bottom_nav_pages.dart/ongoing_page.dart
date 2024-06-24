import 'dart:developer';
import 'package:diginova/controller/project_controller/project_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/model/project_data_model.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import '../../screens/authentication/login_page.dart';

class BottomOnGoingScreen extends StatefulWidget {
  ProjectDataModel? projectData;
  BottomOnGoingScreen({super.key, this.projectData});

  @override
  State<BottomOnGoingScreen> createState() => _BottomOnGoingScreenState();
}

class _BottomOnGoingScreenState extends State<BottomOnGoingScreen> {
  final ProjectDetailsController _projectController =
      Get.put(ProjectDetailsController());

  bool _isLoading = false;
  DateTime? currentBackPressTime;

  @override
  void initState() {
    super.initState();
    _fetchProjectData();
  }

  void _fetchProjectData() async {
    setState(() {
      _isLoading = true;
    });
    await _projectController.fetchProjectDetails();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void showSessionExpiredDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Session Expired",
            style: TEXT_STYLE_M_BOLD,
          ),
          content: Text(
            "Your session has expired. Please log in again.",
            style: TEXT_STYLE,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _signOut(context);
              },
              child: Text(
                "OK",
                style: TEXT_STYLE_M_BOLD,
              ),
            ),
          ],
        );
      },
    );
  }

  void _signOut(BuildContext context) async {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
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
          Obx(() {
            if (_projectController.projectDataList.value == null) {
              log("something went wrong");
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (_isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final projectData = _projectController.projectDataList.value!;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: mediaQueryH(context) * 0.08,
                    ),
                    Center(
                      child: Text(
                        'Ongoing',
                        style: TEXT_STYLE_M_SEMI_BOLD,
                      ),
                    ),
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
                                    BorderRadius.circular(BORDER_RADIUS_XL)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      projectData.projectID ?? 'N/A',
                                      style: TEXT_STYLE_MD.copyWith(
                                          color: BLACK_CLR),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            BORDER_RADIUS_LG),
                                        color: SELECTED_ICON_CLR,
                                      ),
                                      padding: const EdgeInsets.all(PADDING_XS),
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
                                        DateTime.parse(projectData.startDate ??
                                            DateTime.now().toString()),
                                      ),
                                      style: GoogleFonts.poppins(
                                        fontSize: FONT_14,
                                        fontWeight: FontWeight.normal,
                                        color: BLACK_CLR,
                                      ),
                                    ),
                                    Text(
                                      'Estimated ${DateFormat('dd MMM yyyy').format(
                                        DateTime.parse(projectData.endDate ??
                                            DateTime.now().toString()),
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
                            itemCount: projectData.steps?.length,
                            itemBuilder: (context, index) {
                              final step = projectData.steps?[index];
                              final bool isCompleted =
                                  step?.status == 'Completed';

                              return StatusItemWidget(
                                date: DateFormat('dd MMM yyyy').format(
                                  DateTime.parse(projectData.createdDate ??
                                      DateTime.now().toString()),
                                ),
                                firstImage: projectData.imageUrl ?? '',
                                time: '20.53',
                                status: 'Work ${step?.status}',
                                work: '${step?.title} Status',
                                cardClr: isCompleted
                                    ? SELECTED_ICON_CLR
                                    : const Color.fromARGB(255, 238, 238, 238),
                                fontClr: isCompleted ? WHITE_CLR : BLACK_CLR,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
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

  const StatusItemWidget({
    super.key,
    required this.date,
    required this.time,
    required this.status,
    required this.work,
    required this.firstImage,
    required this.cardClr,
    required this.fontClr,
  });

  @override
  Widget build(BuildContext context) {
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
              // Text(
              //   time,
              //   style: TEXT_STYLE.copyWith(fontSize: FONT_XS),
              // )
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
                    text: '$status\n',
                    style: TEXT_STYLE_SM_BOLD.copyWith(color: fontClr),
                    children: <TextSpan>[
                      TextSpan(
                        text: work,
                        style: TEXT_STYLE_XS.copyWith(color: fontClr),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5.0),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     // if (firstImage != null)
                //     Image.network(
                //       firstImage != ""
                //           ? firstImage
                //           : "https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image-300x225.png",
                //       height: 40,
                //       width: 40,
                //     ),
                //   ],
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
