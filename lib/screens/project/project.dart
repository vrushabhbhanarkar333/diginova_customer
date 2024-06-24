import 'package:diginova/controller/project_controller/project_controller.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/project/in_progress.dart';
import 'package:diginova/screens/project/work_complete.dart';

import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'project_ongoing.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final ProjectDetailsController _projectController =
      Get.put(ProjectDetailsController());

  @override
  void initState() {
    _projectController.isProgressive.value = true;
    _projectController.isFinished.value = false;
    super.initState();
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
          Obx(
            () => AppBar(
              centerTitle: true,
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
              title: Text(
                _projectController.appBarTitle.value,
                style: TEXT_STYLE_M_SEMI_BOLD,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    _projectController.setIsProgressive(true);
                    _projectController.setIsFinished(false);
                  },
                  icon: const Icon(Icons.search),
                  color: BLUE_DARK_CLR,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: mediaQueryH(context) * 0.12,
              left: 18,
              right: 18,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _projectController.setIsProgressive(true);
                          _projectController.setIsFinished(false);
                          setState(() {});
                        },
                        child: Obx(
                          () => Container(
                            decoration: BoxDecoration(
                              color: _projectController.isProgressive.value
                                  ? SELECTED_ICON_CLR
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                width: 3,
                                color: Colors.white,
                              ),
                            ),
                            height: 35,
                            width: MediaQuery.of(context).size.width * 0.43,
                            child: Center(
                              child: Text(
                                "In Progress",
                                style: GoogleFonts.poppins(
                                  fontSize: FONT_XSS,
                                  fontWeight: FontWeight.w600,
                                  color: _projectController.isProgressive.value
                                      ? WHITE_CLR
                                      : GREY_SHADES_CLR,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _projectController.setIsProgressive(false);
                          _projectController.setIsFinished(true);
                          setState(() {});
                        },
                        child: Obx(
                          () => Container(
                            decoration: BoxDecoration(
                              color: _projectController.isFinished.value
                                  ? SELECTED_ICON_CLR
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                width: 3,
                                color: Colors.white,
                              ),
                            ),
                            height: 35,
                            width: MediaQuery.of(context).size.width * 0.43,
                            child: Center(
                              child: Text(
                                "Finished",
                                style: GoogleFonts.poppins(
                                  fontSize: FONT_XSS,
                                  fontWeight: FontWeight.w600,
                                  color: _projectController.isFinished.value
                                      ? WHITE_CLR
                                      : GREY_SHADES_CLR,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    child: Obx(
                      () => _projectController.isProgressive.value
                          // ? const OngoingProject()
                          ? InProgress()
                          : _projectController.isFinished.value
                              ? const FinishedScreen()
                              : const Center(
                                  child:
                                      // CircularProgressIndicator(),
                                      Text(
                                          'Not loaded')), // Empty container if none selected
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
