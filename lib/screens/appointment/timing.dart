// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'dart:convert';
import 'dart:developer';
import 'package:diginova/provider/service_booking.dart';
import 'package:provider/provider.dart';

import 'appointment.dart';
import 'package:diginova/controller/appointment/titming_controller.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/global/generate_image_url.dart';
import 'package:diginova/global/utility.dart';
import 'package:diginova/screens/appointment/location_appointment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Timing extends StatefulWidget {
  const Timing({super.key});

  @override
  State<Timing> createState() => _TimingState();
}

class _TimingState extends State<Timing> {
  final TimingController _timingController = TimingController();
  FilePickerResult? selectedFiles;
  bool _isLoading = false;
  DateTime selectedDate = DateTime.now();
  String selectedTime = '';
  late ServiceBookingProvider _bookingsProvider;
  @override
  void initState() {
    super.initState();

    _bookingsProvider =
        Provider.of<ServiceBookingProvider>(context, listen: false);
    // _pickImage();
  }

  @override
  void dispose() {
    // Clean up any resources or controllers here if necessary
    // For example, if you have a TextEditingController, you should dispose of it here
    // _controller.dispose();
    super.dispose();
  }

  Future<String> _uploadFile(source) async {
    try {
      if (source != null) {
        final fileExtension = path.extension(source.path);
        String fileName = createUniqueS3FilenameWithDate(source.name);

        final generateImageUrl = GenerateImageUrl();
        final uploadFile = await generateImageUrl.callForMultiFile(
            fileName, fileExtension, source);

        log('Upload status: $uploadFile');

        return fileName;
      }
      return "";
    } catch (e) {
      log('Error picking image: $e');
      return 'Error picking image: $e';
    }
  }

  Future<void> _updateData() async {
    setState(() {
      _isLoading = true;
    });
    _bookingsProvider.setLoading(true);

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final userData = await UserDataManager.getLoginInfo();
      final jwtToken = userData['jwtToken'] ?? '';
      final customerId = userData['customerId'] ?? '';
      final firstName = userData['name']!.split(" ")[0];
      final lastName = userData['name']!.split(" ")[1];
      final projectId = prefs.getString('selectedItem');

      List<String> filesName = [];

      if (selectedFiles != null) {
        for (var element in selectedFiles!.files) {
          String fileName = await _uploadFile(element);
          filesName.add(fileName);
        }
      }

      Map<String, dynamic> details = {
        "customerId": customerId,
        "projectId": projectId,
        "scheduleTime": _timingController.selectedTime.toString(),
        "ScheduleDate": selectedDate.toString(),
        "problem": _timingController.problemController.text,
        "mediaFIle": filesName,
        "status": "ACTIVE"
      };
      log('$details');
      final response = await http.post(
        Uri.parse('${BASE_URL}service/requests'),
        headers: {
          'Authorization': 'Bearer $jwtToken',
          'accept': 'text/plain',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(details),
      );

      if (response.statusCode == 201) {
        // final responseBody = jsonDecode(response.body);
        const successMessage = 'Request added successfully';
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(successMessage),
          ),
        );
        // log('response.body');
        // log(responseBody);
        Map<String, dynamic> setDet = {
          "customerId": customerId,
          "projectId": projectId,
          "scheduleTime": _timingController.selectedTime.toString(),
          "ScheduleDate": selectedDate.toString(),
          "problem": _timingController.problemController.text,
          "mediaFIle": filesName,
          "status": "ACTIVE",
          "createdBy": <String, dynamic>{
            "firstName": firstName,
            "lastName": lastName
          },
        };
        // details.assign(
        //     "createdBy", {"firstName": firstName, "lastName": lastName});
        // details.assign("ScheduleDate", selectedDate.toString());
        _bookingsProvider.setLoading(false);
        _bookingsProvider.addBooking(setDet);
        log('Navigating to the appointment page...'); // Log navigation attempt
        Navigator.pop(context
            // MaterialPageRoute(builder: (context) => const Appointment()),
            );
      } else {
        final errorResponse = jsonDecode(response.body);
        final errorMessage = errorResponse['error'] ?? "Something went wrong!";
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
        log('Failed to add request');
        // log(response.body);
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
      log('Error: $error');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String currentMonthName = monthNames[_timingController.now.month - 1];

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            BACKGROUNDIMAGE,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Obx(
              () => Padding(
                padding: EdgeInsets.only(
                    top: mediaQueryH(context) * 0.05,
                    left: PADDING_MD,
                    right: PADDING_MD,
                    bottom: PADDING_SM),
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Appointment()),
                                  );
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  size: 18,
                                ),
                              ),
                              SizedBox(width: mediaQueryW(context) * 0.2),
                              Text(
                                'Timings',
                                style: TEXT_STYLE_M_SEMI_BOLD,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: SPACING_SM,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Schedules',
                                style: TEXT_STYLE.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: FONT_20,
                                  color: PURPLE_CLR,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    currentMonthName,
                                    style: TEXT_STYLE.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: FONT_XSS,
                                      color: PURPLE_NORMAL_SHADE_CLR,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                    color: PURPLE_CLR,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: SPACING_M),
                          Calendar(onDateSelected: (DateTime date) {
                            setState(() {
                              selectedDate = date;
                            });
                          }),
                          const SizedBox(height: SPACING_M),
                          Text(
                            'Visit Hour',
                            style: TEXT_STYLE.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: FONT_20,
                              color: PURPLE_CLR,
                            ),
                          ),
                          const SizedBox(height: SPACING_M),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TimeSelector(
                                bgColor: _timingController.isTime.value
                                    ? DEFAULT_CLR
                                    : WHITE_SHADE_CLR,
                                fromtime: '10:00 AM',
                                totime: '12:00 PM',
                                fontColor: PURPLE_CLR,
                                fontSize: FONT_XSS,
                                onPressed: () {
                                  _timingController
                                      .selecteTime('10:00 AM - 12:00 PM');
                                },
                                isSelected:
                                    _timingController.selectedTime.value ==
                                        '10:00 AM - 12:00 PM',
                              ),
                              TimeSelector(
                                bgColor: _timingController.isTime.value
                                    ? DEFAULT_CLR
                                    : WHITE_SHADE_CLR,
                                fromtime: '12:00 PM',
                                totime: '02:00 PM',
                                fontColor: PURPLE_CLR,
                                fontSize: FONT_XSS,
                                onPressed: () {
                                  _timingController
                                      .selecteTime('12:00 PM - 02:00 PM');
                                },
                                isSelected:
                                    _timingController.selectedTime.value ==
                                        '12:00 PM - 02:00 PM',
                              ),
                            ],
                          ),
                          const SizedBox(height: SPACING_M),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TimeSelector(
                                bgColor: _timingController.isTime.value
                                    ? DEFAULT_CLR
                                    : WHITE_SHADE_CLR,
                                fromtime: '02:00 PM',
                                totime: '04:00 PM',
                                fontColor: PURPLE_CLR,
                                fontSize: FONT_XSS,
                                onPressed: () {
                                  _timingController
                                      .selecteTime('02:00 PM - 04:00 PM');
                                },
                                isSelected:
                                    _timingController.selectedTime.value ==
                                        '02:00 PM - 04:00 PM',
                              ),
                              TimeSelector(
                                bgColor: _timingController.isTime.value
                                    ? DEFAULT_CLR
                                    : WHITE_SHADE_CLR,
                                fromtime: '04:00 PM',
                                totime: '06:00 PM',
                                fontColor: PURPLE_CLR,
                                fontSize: FONT_XSS,
                                onPressed: () {
                                  _timingController
                                      .selecteTime('04:00 PM - 06:00 PM');
                                },
                                isSelected:
                                    _timingController.selectedTime.value ==
                                        '04:00 PM - 06:00 PM',
                              ),
                            ],
                          ),
                          const SizedBox(height: SPACING_M),
                          Text(
                            'Problem',
                            style: TEXT_STYLE.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: FONT_20,
                              color: PURPLE_CLR,
                            ),
                          ),
                          const SizedBox(height: SPACING_MD),
                          TextField(
                            controller: _timingController.problemController,
                            maxLines: 5,
                            decoration: InputDecoration(
                              hintText: 'Write your problem',
                              hintStyle: TEXT_STYLE.copyWith(
                                fontSize: FONT_14,
                                fontWeight: FontWeight.w500,
                                color: const Color(0XFF6B779A),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(PADDING_XS)),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(46, 158, 158, 158),
                                ),
                              ),
                              fillColor: WHITE_SHADE_CLR,
                              filled: true,
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(PADDING_XS)),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(46, 158, 158, 158),
                                ),
                              ),
                            ),
                          ),
                          // const SizedBox(height: SPACING_LG),
                          ListView.separated(
                            shrinkWrap: true,
                            itemCount: selectedFiles?.files.length ?? 0,
                            itemBuilder: (context, index) {
                              return Text(
                                  selectedFiles?.files[index].name ?? '',
                                  style: TEXT_STYLE.copyWith());
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 5,
                              );
                            },
                          ),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: DEFAULT_CLR,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () async {
                                selectedFiles = await FilePicker.platform
                                    .pickFiles(allowMultiple: true);
                                if (selectedFiles == null) {
                                  log("No file selected");
                                } else {
                                  setState(() {});
                                  for (var element in selectedFiles!.files) {
                                    log(element.name);
                                  }
                                }
                              },
                              child: Text(
                                "Attach files",
                                style: TEXT_STYLE.copyWith(color: WHITE_CLR),
                              ),
                            ),
                          ),
                          const SizedBox(height: SPACING_LG),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  DEFAULT_CLR,
                                ),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                // _showBottomSheet(context);
                                _updateData();
                              },
                              child: Text(
                                "Continue",
                                style: TEXT_STYLE_XSS,
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    Get.bottomSheet(
      Container(
        height: 322,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: SPACING_XL),
            Text(
              'Confirmation',
              style: FONT_16_SEMI_BOLD_TXT_STYLE,
            ),
            const SizedBox(height: SPACING_SM),
            Text(
              'Saurabh',
              style: FONT16_SEMI_BOLD_TXT_STYLE,
            ),
            const SizedBox(height: SPACING_SM),
            Text(
              'Right joy Pvt. ltd',
              style: FONT16_SEMI_BOLD_TXT_STYLE,
            ),
            const SizedBox(height: SPACING_SM),
            Text(
              '1234 Single street, Bangalore',
              style: FONT16_SEMI_BOLD_TXT_STYLE,
            ),
            const SizedBox(height: SPACING_XL),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: PADDING_SM),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(DEFAULT_CLR),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => const LocationAppointment());
                  },
                  child: Text(
                    "Continue",
                    style: TEXT_STYLE_XSS,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//Calendar widget

class Calendar extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const Calendar({super.key, required this.onDateSelected});

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selectedDate = DateTime.now(); // Tracking the selected date
  int currentDateSelectedIndex = 0; // For Horizontal Date
  ScrollController scrollController =
      ScrollController(); // To track scroll of ListView

  List<String> listOfDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  @override
  Widget build(BuildContext context) {
    int daysInMonth =
        DateTime(selectedDate.year, selectedDate.month + 1, 0).day;
    List<DateTime> daysInMonthExcludingSundays =
        List.generate(daysInMonth, (index) {
      return DateTime(selectedDate.year, selectedDate.month, index + 1);
    }).where((date) => date.weekday != DateTime.sunday).toList();

    return SizedBox(
      height: 60.22,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 8.0); // Adjust your spacing here
        },
        itemCount: daysInMonthExcludingSundays.length,
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          DateTime date = daysInMonthExcludingSundays[index];
          return InkWell(
            onTap: () {
              setState(() {
                currentDateSelectedIndex = index;
                selectedDate = date;
                widget.onDateSelected(selectedDate);
              });
            },
            child: Container(
              height: 60.22,
              width: 56.46,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(10.0), // Adjust border radius
                color: currentDateSelectedIndex == index
                    ? DEFAULT_CLR
                    : Colors.white, // Replace DEFAULT_CLR and WHITE_SHADE_CLR
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    date.day.toString(),
                    style: TEXT_STYLE.copyWith(
                        fontSize: 14, // Adjust font size
                        fontWeight: FontWeight.w600,
                        color: currentDateSelectedIndex == index
                            ? WHITE_SHADE_CLR
                            : PURPLE_CLR // Replace WHITE_SHADE_CLR and PURPLE_CLR
                        ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    listOfDays[date.weekday - 1],
                    style: TEXT_STYLE.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: currentDateSelectedIndex == index
                            ? WHITE_SHADE_CLR
                            : PURPLE_CLR // Replace WHITE_SHADE_CLR and PURPLE_NORMAL_SHADE_CLR
                        ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class TimeSelector extends StatelessWidget {
  final String fromtime;
  final String totime;
  final Color fontColor;
  final Color bgColor;
  FontWeight? fontWeight;
  final double fontSize;
  final VoidCallback onPressed;
  final bool isSelected;

  TimeSelector({
    super.key,
    required this.fromtime,
    required this.totime,
    required this.fontColor,
    this.fontWeight,
    required this.fontSize,
    required this.onPressed,
    required this.bgColor,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(PADDING_XS),

        // height: 33.88,
        // width: mediaQueryW(context) * 0.22,
        decoration: BoxDecoration(
          color: isSelected ? bgColor : WHITE_SHADE_CLR,
          borderRadius: BorderRadius.circular(
            BORDER_RADIUS_MD,
          ),
          border: Border.all(
            color: const Color.fromARGB(46, 158, 158, 158),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$fromtime - $totime',
              style: TEXT_STYLE.copyWith(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
                color: isSelected ? WHITE_SHADE_CLR : fontColor,
              ),
            ),
            // Text(
            //   timeFormate,
            //   style: TEXT_STYLE.copyWith(
            //     fontSize: fontSize,
            //     fontWeight: FontWeight.w500,
            //     color: isSelected ? WHITE_SHADE_CLR : fontColor,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

List<String> monthNames = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];
