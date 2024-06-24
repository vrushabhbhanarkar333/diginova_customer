// ignore_for_file: deprecated_member_use

import 'package:diginova/controller/project_controller/project_controller.dart';
import 'package:diginova/screens/help_desk/chatbot.dart';
import 'package:diginova/screens/help_desk/help.dart';
import 'package:diginova/screens/project/project.dart';
import 'package:diginova/utils/bottom_nav_pages.dart/help.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/home/home.dart';
import 'package:diginova/utils/bottom_nav_pages.dart/appointment.dart';
import 'package:diginova/utils/bottom_nav_pages.dart/ongoing_page.dart';
import 'package:get/get.dart';

import 'bottom_nav_pages.dart/chatbot_new.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavigationBarScreenState createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _selectedIndex = 0;
  DateTime? currentBackPressTime; // Variable to track back button presses

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    // BottomOnGoingScreen(),
    ProjectScreen(),
    const BottomAppointment(),
    // HelpDeskScreenBottom(
    //   isRaiseTicketSelected: false,
    // )
    // ChatbotScreen(),
    // const ChatBot(),
    HelpDeskScreenBottom(isRaiseTicketSelected: false)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void navigateToHomePage() {
    setState(() {
      _selectedIndex = 0; // Reset index to zero
    });
    Navigator.popUntil(
        context, (route) => route.isFirst); // Navigate to homepage
  }

  final ProjectDetailsController _projectController =
      Get.put(ProjectDetailsController());

  @override
  void initState() {
    // TODO: implement initState
    _fetchProjectData();
    super.initState();
  }

  void _fetchProjectData() async {
    await _projectController.fetchProjectDetails();
  }

  @override
  Widget build(BuildContext context) {
    return
        // WillPopScope(
        //   onWillPop: () async {
        //     // Check if back button is pressed within 2 seconds of the last press
        //     if (currentBackPressTime == null ||
        //         DateTime.now().difference(currentBackPressTime!) >
        //             const Duration(seconds: 2)) {
        //       currentBackPressTime = DateTime.now();
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         SnackBar(
        //           content: Text(
        //             'Press back again to exit',
        //             style: TEXT_STYLE,
        //           ),
        //           duration: const Duration(seconds: 2),
        //         ),
        //       );
        //       return false; // Do not exit the app
        //     }
        //     return true; // Exit the app
        //   },
        //   child:
        Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: DEFAULT_CLR,
        unselectedItemColor: BLACK_CLR,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Home.svg',
              color: _selectedIndex == 0 ? SELECTED_ICON_CLR : BLACK_CLR,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/pen.svg',
              color: _selectedIndex == 1 ? SELECTED_ICON_CLR : BLACK_CLR,
            ),
            label: "Project",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/service.svg',
              color: _selectedIndex == 2 ? SELECTED_ICON_CLR : BLACK_CLR,
            ),
            label: "Appointment",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/uiw_message.svg',
              color: _selectedIndex == 3 ? SELECTED_ICON_CLR : BLACK_CLR,
            ),
            label: "Help Desk",
          ),
        ],
      ),
      // ),
    );
  }
}
