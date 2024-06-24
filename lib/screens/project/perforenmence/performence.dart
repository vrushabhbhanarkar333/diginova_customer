import 'package:diginova/controller/project_controller/performance_controller.dart';
import 'package:diginova/global/appbar.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/project/monitor.dart';
import 'package:diginova/screens/project/perforenmence/day.dart';
import 'package:diginova/screens/project/perforenmence/month.dart';
import 'package:diginova/screens/project/perforenmence/week.dart';
import 'package:diginova/screens/project/perforenmence/year.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PerformanceScreen extends StatefulWidget {
  const PerformanceScreen({super.key});

  @override
  State<PerformanceScreen> createState() => _PerformanceScreenState();
}

class _PerformanceScreenState extends State<PerformanceScreen> {
  final PerformanceController _performanceController =
      Get.put(PerformanceController());
  @override
  void initState() {
    _performanceController.isMonth.value = true;
    _performanceController.isWeek.value = false;
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
          AppBarNova(
            onPressed: () => Navigator.pop(context),
            title: 'Performance',
            fontWeight: FontWeight.bold,
            fontSize: FONT_20,
            color: BLACK_CLR_SHADE,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 120,
              left: PADDING_MD,
              right: PADDING_MD,
            ),
            child: SingleChildScrollView(
              child: GetBuilder<PerformanceController>(
                builder: (controller) {
                  double percentage = controller.percentageValue.value / 100;
                  int intValue = controller.percentageValue.value.toInt();
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 192,
                            width: MediaQuery.of(context).size.width * 0.42,
                            decoration: BoxDecoration(
                              color: BTN_BLUE_CLR,
                              borderRadius: BorderRadius.circular(
                                BORDER_RADIUS_LG,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                    'assets/images/simple-line-icons_energy.png'),
                                const SizedBox(height: SPACING_M),
                                Text(
                                  'Energy',
                                  style: GoogleFonts.poppins(
                                    fontSize: FONT_16,
                                    fontWeight: FontWeight.w600,
                                    color: WHITE_CLR,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                height: 89,
                                width: MediaQuery.of(context).size.width * 0.42,
                                decoration: BoxDecoration(
                                  color: BTN_BLUE_CLR,
                                  borderRadius: BorderRadius.circular(
                                    BORDER_RADIUS_LG,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: PADDING_SM,
                                    vertical: PADDING_XS,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                          'assets/images/carbon_temperature-fahrenheit.png'),
                                      const SizedBox(height: SPACING_XS),
                                      Text(
                                        'Temperature',
                                        style: GoogleFonts.poppins(
                                          fontSize: FONT_16,
                                          fontWeight: FontWeight.w600,
                                          color: WHITE_CLR,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 14),
                              Container(
                                height: 89,
                                width: MediaQuery.of(context).size.width * 0.42,
                                decoration: BoxDecoration(
                                  color: BTN_BLUE_CLR,
                                  borderRadius: BorderRadius.circular(
                                    BORDER_RADIUS_LG,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: PADDING_SM,
                                    vertical: PADDING_XS,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                          'assets/images/carbon_humidity-alt.png'),
                                      const SizedBox(height: SPACING_XS),
                                      Text(
                                        'Humidity',
                                        style: GoogleFonts.poppins(
                                          fontSize: FONT_16,
                                          fontWeight: FontWeight.w600,
                                          color: WHITE_CLR,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: SPACING_MD),
                      Container(
                        height: 130,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: BTN_BLUE_CLR,
                          borderRadius: BorderRadius.circular(
                            BORDER_RADIUS_LG,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 170,
                              ),
                              child: Center(
                                child: Text(
                                  'Your Weekly Progress',
                                  style: TEXT_STYLE_MD_EXTRA_BOLD,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            CircularPercentIndicator(
                              startAngle: 110,
                              rotateLinearGradient: true,
                              circularStrokeCap: CircularStrokeCap.round,
                              lineWidth: 10,
                              center: Text(
                                '$intValue%',
                                style: GoogleFonts.poppins(
                                  fontSize: FONT_20,
                                  fontWeight: FontWeight.w600,
                                  color: WHITE_CLR,
                                ),
                              ),
                              radius: 52,
                              percent: percentage,
                              animation: false,
                              progressColor:
                                  const Color.fromARGB(255, 148, 210, 255),
                              backgroundColor: WHITE_SHADE_CLR,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: SPACING_M),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 30,
                            width: 74,
                            child: TextButton(
                              style: ButtonStyle(
                                padding:
                                    MaterialStateProperty.all(EdgeInsets.zero),
                                backgroundColor: MaterialStateProperty.all(
                                  controller.isDay.value
                                      ? DEFAULT_CLR
                                      : WHITE_SHADE_CLR,
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    side: const BorderSide(
                                      color: BLACK_CLR_SHADE,
                                      width: 0.01,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(BORDER_RADIUS_LG),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                _performanceController.selectDay();
                                setState(() {});
                              },
                              child: Text(
                                'Day',
                                style: GoogleFonts.poppins(
                                  fontSize: FONT_SM,
                                  fontWeight: FontWeight.w600,
                                  color: controller.isDay.value
                                      ? WHITE_SHADE_CLR
                                      : BLACK_CLR_SHADE,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            width: 74,
                            child: TextButton(
                              style: ButtonStyle(
                                padding:
                                    MaterialStateProperty.all(EdgeInsets.zero),
                                backgroundColor: MaterialStateProperty.all(
                                  controller.isWeek.value
                                      ? DEFAULT_CLR
                                      : WHITE_SHADE_CLR,
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    side: const BorderSide(
                                      color: BLACK_CLR_SHADE,
                                      width: 0.01,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(BORDER_RADIUS_LG),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                _performanceController.selectWeek(context);
                                setState(() {});
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Monitor(),
                                  ),
                                );
                              },
                              child: Text(
                                'Week',
                                style: GoogleFonts.poppins(
                                  fontSize: FONT_SM,
                                  fontWeight: FontWeight.w600,
                                  color: controller.isWeek.value
                                      ? WHITE_SHADE_CLR
                                      : BLACK_CLR_SHADE,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            width: 74,
                            child: TextButton(
                              style: ButtonStyle(
                                padding:
                                    MaterialStateProperty.all(EdgeInsets.zero),
                                backgroundColor: MaterialStateProperty.all(
                                  controller.isMonth.value
                                      ? DEFAULT_CLR
                                      : WHITE_SHADE_CLR,
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    side: const BorderSide(
                                      color: BLACK_CLR_SHADE,
                                      width: 0.01,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(BORDER_RADIUS_LG),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                _performanceController.selectMonth();
                                setState(() {});
                              },
                              child: Text(
                                'Month',
                                style: GoogleFonts.poppins(
                                  fontSize: FONT_SM,
                                  fontWeight: FontWeight.w600,
                                  color: controller.isMonth.value
                                      ? WHITE_CLR
                                      : BLACK_CLR_SHADE,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            width: 74,
                            child: TextButton(
                              style: ButtonStyle(
                                padding:
                                    MaterialStateProperty.all(EdgeInsets.zero),
                                backgroundColor: MaterialStateProperty.all(
                                  controller.isYear.value
                                      ? DEFAULT_CLR
                                      : WHITE_SHADE_CLR,
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    side: const BorderSide(
                                      color: BLACK_CLR_SHADE,
                                      width: 0.01,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(BORDER_RADIUS_LG),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                _performanceController.selectYear();
                                setState(() {});
                              },
                              child: Text(
                                'Year',
                                style: GoogleFonts.poppins(
                                  fontSize: FONT_SM,
                                  fontWeight: FontWeight.w600,
                                  color: controller.isYear.value
                                      ? WHITE_SHADE_CLR
                                      : BLACK_CLR_SHADE,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: SPACING_M),
                      if (controller.isDay.value) Day(),
                      if (controller.isWeek.value) const Week(),
                      if (controller.isMonth.value) Month(),
                      if (controller.isYear.value) const Year(),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
