// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:diginova/global/constant.dart';
import 'package:diginova/provider/service_booking.dart';
import 'package:diginova/screens/appointment/timing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../global/utility.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({super.key});

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  String formatDateString(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat("MMMM d, yyyy").format(dateTime);
  }

  @override
  void initState() {
    _fetchBookings();
    super.initState();
  }

  Future<void> _fetchBookings() async {
    if (!mounted) return; // Check if the widget is mounted

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

      if (!mounted) return; // Check if the widget is mounted

      if (response.statusCode == 200) {
        log(response.body);
        final List<dynamic> data = json.decode(response.body);

        List<Map<String, dynamic>> bookingData =
            List<Map<String, dynamic>>.from(data);

        Provider.of<ServiceBookingProvider>(context, listen: false)
            .setbookings(bookingData);
      } else {
        log('Failed to fetch bookings: ${response.statusCode}');
      }
    } catch (error) {
      log('Error fetching bookings: $error');
    }

    if (mounted) {
      setState(() {}); // Call setState only if the widget is still mounted
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mediaQueryH(context) * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: SPACING_LG),
          Text(
            'Upcoming Visit',
            style: TEXT_STYLE.copyWith(
              fontSize: FONT_20,
              fontWeight: FontWeight.w600,
              color: PURPLE_SHADE_CLR,
            ),
          ),
          Expanded(
            child: Consumer<ServiceBookingProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (provider.bookings.isEmpty) {
                  return Center(
                      child: Text('No bookings found.', style: TEXT_STYLE));
                }

                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: provider.bookings.length,
                  itemBuilder: (context, index) {
                    final booking = provider.bookings[index];
                    return BookingCard(
                      name: booking['createdBy']['firstName'] ?? 'Unknown',
                      service: booking['problem'] ?? 'No problem description',
                      imageUrl: /*booking['projectId']['imageUrl'] ??*/ '',
                      scheduleDate: formatDateString(booking['ScheduleDate']),
                      scheduleTime: booking['scheduleTime'].toString(),
                      onTap: () {
                        // Add your onTap logic here
                      },
                    );
                  },
                );
              },
            ),
          ),
          // SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          // SizedBox(
          //   height: mediaQueryH(context) * 0.05,
          //   width: double.infinity,
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: DEFAULT_CLR,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(12),
          //       ),
          //     ),
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => const Timing()),
          //       );
          //     },
          //     child: Text(
          //       "+ Service Booking",
          //       style: TEXT_STYLE_XSS,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final String name;
  final String service;
  final String imageUrl;
  final String scheduleDate;
  final String scheduleTime;
  final VoidCallback onTap;

  const BookingCard({
    super.key,
    required this.name,
    required this.service,
    required this.imageUrl,
    required this.scheduleDate,
    required this.scheduleTime,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add your onTap logic here
      },
      child: Card(
        elevation: 0.5,
        margin: const EdgeInsets.symmetric(vertical: 5),
        surfaceTintColor: Colors.transparent,
        color: WHITE_SHADE_CLR,
        child: Padding(
          padding: const EdgeInsets.all(
            PADDING_XXS,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ListTile(
                leading: const CircleAvatar(
                  radius: 25,
                  backgroundColor: AVATAR_BG_CLR,
                  backgroundImage: AssetImage('assets/images/Avatar.png'),
                ),
                title: Text(
                  name,
                  style: TEXT_STYLE.copyWith(
                    fontSize: FONT_16,
                    fontWeight: FontWeight.bold,
                    color: PURPLE_SHADE_CLR,
                  ),
                ),
                subtitle: Text(
                  service,
                  style: TEXT_STYLE.copyWith(
                    fontSize: FONT_14,
                    color: const Color(0XFF828282),
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 23,
                  color: Color(0XFF828282),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: PADDING_XS,
                ),
                child: Divider(
                  color: DIVIDER_CLR,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons
                            .calendar_today_rounded, // Or any other IconData you want
                        size: SIZE_S,
                        color: PURPLE_SHADE_CLR,
                      ),
                      const SizedBox(width: SPACING_XXS),
                      Text(
                        scheduleDate,
                        style: TEXT_STYLE.copyWith(
                          fontSize: FONT_XSS,
                          color: PURPLE_SHADE_CLR,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.alarm_on, // Or any other IconData you want
                        size: SIZE_S,
                        color: PURPLE_SHADE_CLR,
                      ),
                      const SizedBox(width: SPACING_XXS),
                      Text(
                        scheduleTime,
                        style: TEXT_STYLE.copyWith(
                          fontSize: FONT_XSS,
                          color: PURPLE_SHADE_CLR,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
