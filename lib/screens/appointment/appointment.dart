import 'dart:convert';
import 'dart:developer';

import 'package:diginova/controller/appointment/appointment_controller.dart';
import 'package:diginova/provider/service_booking.dart';
import 'package:diginova/screens/appointment/timing.dart';
import 'package:http/http.dart' as http;
import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/appointment/history.dart';
import 'package:diginova/screens/appointment/upcoming.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../global/utility.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  final AppointmentController _appointmentController = AppointmentController();

  @override
  void initState() {
    super.initState();
    _appointmentController.upComing.value = true;

    _fetchBookings();
  }

  Future<void> _fetchBookings() async {
    setState(() {});

    try {
      final Map<String, String> userData = await UserDataManager.getLoginInfo();
      String jwtToken = userData['jwtToken'] ?? '';
      String uid = userData['uid'] ?? '';
      log(uid);

      final String apiUrl = '${BASE_URL}service/requests/my/';

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $jwtToken',
        },
      );

      if (response.statusCode == 200) {
        log(response.body);
        final List<dynamic> data = json.decode(response.body);

        // Explicitly cast List<dynamic> to List<Map<String, dynamic>>
        List<Map<String, dynamic>> bookingsData =
            List<Map<String, dynamic>>.from(data);

        // Use Provider to update the bookings data
        // ignore: use_build_context_synchronously
        Provider.of<ServiceBookingProvider>(context, listen: false)
            .setbookings(bookingsData);
      } else {
        log('Failed to fetch bookings: ${response.statusCode}');
      }
    } catch (error) {
      log('Error fetching bookings: $error');
    }

    setState(() {});
  }

  @override
  void dispose() {
    // Clean up any resources or controllers here if necessary
    // For example, if you have a TextEditingController, you should dispose of it here
    // _controller.dispose();
    super.dispose();
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
          Column(
            children: [
              SizedBox(
                height: mediaQueryH(context) * 0.08,
              ),
              // Center(
              //   child: Text(
              //     'Appointment',
              //     style: FONT_14_SEMI_BOLD_TXT_STYLE,
              //   ),
              // ),
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
                        MaterialPageRoute(builder: (context) => const Timing()),
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
                  top: mediaQueryH(context) * 0.15,
                  left: 16,
                  right: 16,
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
                                    color: _appointmentController.upComing.value
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
                                    color: _appointmentController.history.value
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
                      if (_appointmentController.history.value) const History()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
