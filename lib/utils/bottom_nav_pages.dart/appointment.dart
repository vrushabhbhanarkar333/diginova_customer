import 'package:diginova/controller/appointment/appointment_controller.dart';
import 'package:diginova/global/appbar.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/appointment/history.dart';
import 'package:diginova/screens/appointment/timing.dart';
import 'package:diginova/screens/appointment/upcoming.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomAppointment extends StatefulWidget {
  const BottomAppointment({super.key});

  @override
  State<BottomAppointment> createState() => _BottomAppointmentState();
}

class _BottomAppointmentState extends State<BottomAppointment> {
  final AppointmentController _appointmentController = AppointmentController();

  @override
  void initState() {
    _appointmentController.upComing.value = true;
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
          // AppBarNova(
          //   onPressed: () {},
          //   title: 'Appointment',
          //   fontWeight: FontWeight.w500,
          //   fontSize: FONT_M,
          //   color: BLACK_CLR,
          // ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: mediaQueryH(context) * 0.08,
                ),
                Center(
                  child: Text(
                    'Appointment',
                    style: TEXT_STYLE_M_SEMI_BOLD,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20, // Adjust the vertical padding to create space
                  ),
                  child: SizedBox(
                    height: 50, // Fixed height for the button
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: DEFAULT_CLR,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Timing()),
                        );
                      },
                      child: Text(
                        "+ Service Booking",
                        style: TEXT_STYLE_XSS,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 10,
                    bottom: 2,
                  ),
                  child: Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _appointmentController.toggleUpcoming();
                              },
                              child: Container(
                                // Your Progrssive button widget
                                decoration: BoxDecoration(
                                  color: _appointmentController.upComing.value
                                      ? DEFAULT_CLR
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                height: 31,
                                width: MediaQuery.of(context).size.width * 0.44,
                                child: Center(
                                  child: Text(
                                    "Upcoming",
                                    style: GoogleFonts.poppins(
                                      fontSize: FONT_XSS,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          _appointmentController.upComing.value
                                              ? WHITE_CLR
                                              : GREY_SHADES_CLR,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _appointmentController.toggleHistory();
                              },
                              child: Container(
                                // Your Finished button widget
                                decoration: BoxDecoration(
                                  color: _appointmentController.history.value
                                      ? DEFAULT_CLR
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                height: 31,
                                width: MediaQuery.of(context).size.width * 0.44,
                                child: Center(
                                  child: Text(
                                    "History",
                                    style: GoogleFonts.poppins(
                                      fontSize: FONT_XSS,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          _appointmentController.history.value
                                              ? WHITE_CLR
                                              : GREY_SHADES_CLR,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (_appointmentController.upComing.value)
                          const Upcoming(),
                        if (_appointmentController.history.value)
                          const History()
                      ],
                    ),
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
