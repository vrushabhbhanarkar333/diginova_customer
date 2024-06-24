import 'package:diginova/controller/help_desk_controller/help_desk_controller.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/help_desk/chat.dart';
import 'package:diginova/screens/help_desk/raise_ticket.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpDeskScreenBottom extends StatefulWidget {
  final bool isRaiseTicketSelected;
  // final Function() navigateToHomePage; // Callback function
  const HelpDeskScreenBottom(
      {Key? key,
      // required this.navigateToHomePage,
      required this.isRaiseTicketSelected})
      : super(key: key);
// Parameter to indicate if Raise Ticket button should be selected
  // const HelpDeskScreenBottom({super.key, required this.isRaiseTicketSelected});

  @override
  // ignore: library_private_types_in_public_api
  _HelpDeskScreenBottomState createState() => _HelpDeskScreenBottomState();
}

class _HelpDeskScreenBottomState extends State<HelpDeskScreenBottom> {
  final HelpDeskController _helpDeskController = Get.put(HelpDeskController());

  @override
  void initState() {
    super.initState();
    _helpDeskController.isChatSelected.value = true;
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
            // leading: IconButton(
            //   onPressed: () {
            //     // widget.navigateToHomePage();
            //     // Navigator.popUntil(context, (route) => route.isFirst);
            //   },
            //   icon: const Icon(
            //     Icons.arrow_back_ios,
            //     size: 18,
            //   ),
            // ),
            title: Text(
              _helpDeskController.appBarTitle.value,
              style: TEXT_STYLE_M_SEMI_BOLD,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: mediaQueryH(context) * 0.12,
              left: 18,
              right: 18,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Center(
                //   child: Text(
                //     'Help desk',
                //     style: FONT_14_SEMI_BOLD_TXT_STYLE,
                //   ),
                // ),
                // SizedBox(
                //   height: mediaQueryH(context) * 0.03,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            _helpDeskController
                                .selectChat(); // Set app bar title for Chat
                          },
                        );
                      },
                      child: AnimatedContainer(
                        duration: Durations.extralong1,
                        // Your Chat button widget
                        decoration: BoxDecoration(
                          color: _helpDeskController.isChatSelected.value
                              ? DEFAULT_CLR
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: 31,
                        width: MediaQuery.of(context).size.width * 0.43,
                        child: Center(
                          child: Text(
                            "Chat Now",
                            style: GoogleFonts.poppins(
                              fontSize: FONT_XSS,
                              fontWeight: FontWeight.w600,
                              color: _helpDeskController.isChatSelected.value
                                  ? WHITE_CLR
                                  : GREY_SHADES_CLR,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _helpDeskController
                              .selectRaiseTicket(); // Set app bar title for Raise Ticket
                        });
                      },
                      child: AnimatedContainer(
                        duration: Durations.extralong1,

                        // Your Raise Ticket button widget
                        decoration: BoxDecoration(
                          color: _helpDeskController.isTicketSelected.value
                              ? DEFAULT_CLR
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: 31,
                        width: MediaQuery.of(context).size.width * 0.43,
                        child: Center(
                          child: Text(
                            "Raise Ticket",
                            style: GoogleFonts.poppins(
                              fontSize: FONT_XSS,
                              fontWeight: FontWeight.w600,
                              color: _helpDeskController.isTicketSelected.value
                                  ? WHITE_CLR
                                  : GREY_SHADES_CLR,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _helpDeskController.isChatSelected.value
                    ? const ChatScreen()
                    : _helpDeskController.isTicketSelected.value
                        ? const RaiseTicket()
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
