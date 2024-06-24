import 'package:diginova/controller/help_desk_controller/help_desk_controller.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/help_desk/raise_ticket.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpDeskScreen extends StatefulWidget {
  final bool
      isRaiseTicketSelected; // Parameter to indicate if Raise Ticket button should be selected
  const HelpDeskScreen({Key? key, required this.isRaiseTicketSelected})
      : super(key: key);

  @override
  _HelpDeskScreenState createState() => _HelpDeskScreenState();
}

class _HelpDeskScreenState extends State<HelpDeskScreen> {
  final HelpDeskController _helpDeskController = Get.put(HelpDeskController());

  @override
  void initState() {
    super.initState();
    _helpDeskController.isChatSelected.value = false;
    _helpDeskController.isTicketSelected.value =
        true; // Set Raise Ticket as selected initially
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
          AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 18,
              ),
            ),
            title: Text(
              _helpDeskController.appBarTitle.value,
              style: TEXT_STYLE_M_SEMI_BOLD,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: mediaQueryH(context) * 0.08,
              left: 18,
              right: 18,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: mediaQueryH(context) * 0.05,
                ),
                // GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       _helpDeskController
                //           .selectRaiseTicket(); // Set app bar title for Raise Ticket
                //     });
                //   },
                //   child: AnimatedContainer(
                //     duration: Durations.extralong1,
                //     decoration: BoxDecoration(
                //       color: DEFAULT_CLR,
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //     height: 31,
                //     width: MediaQuery.of(context).size.width * 0.43,
                //     child: Center(
                //       child: Text(
                //         "Raise Ticket",
                //         style: GoogleFonts.poppins(
                //           fontSize: FONT_XSS,
                //           fontWeight: FontWeight.w600,
                //           color: WHITE_CLR,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 20),
                const RaiseTicket(), // Display only Raise Ticket section
              ],
            ),
          ),
        ],
      ),
    );
  }
}
