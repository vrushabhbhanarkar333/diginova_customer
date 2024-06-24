import 'package:diginova/controller/project_controller/performance_controller.dart';
import 'package:diginova/global/appbar.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/project/perforenmence/day.dart';
import 'package:diginova/screens/project/perforenmence/month.dart';
import 'package:diginova/screens/project/perforenmence/week.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Monitor extends StatefulWidget {
  const Monitor({super.key});

  @override
  State<Monitor> createState() => _MonitorState();
}

class _MonitorState extends State<Monitor> {
  final PerformanceController _performanceController = PerformanceController();
  @override
  void initState() {
    _performanceController.isWeek.value = true;
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
            title: 'Monitor',
            fontWeight: FontWeight.w600,
            fontSize: FONT_20,
            color: BLACK_CLR_SHADE,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 120,
              left: 15,
              right: 15,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 36,
                        width: 102,
                        child: TextButton(
                          style: ButtonStyle(
                            padding: const MaterialStatePropertyAll(
                              EdgeInsets.zero,
                            ),
                            backgroundColor: MaterialStatePropertyAll(
                              _performanceController.isDay.value
                                  ? DEFAULT_CLR
                                  : WHITE_SHADE_CLR,
                            ),
                            shape: MaterialStatePropertyAll(
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
                            setState(() {
                              _performanceController.selectDay();
                            });
                          },
                          child: Text(
                            'Day',
                            style: GoogleFonts.poppins(
                              fontSize: FONT_SM,
                              fontWeight: FontWeight.w600,
                              color: _performanceController.isDay.value
                                  ? WHITE_SHADE_CLR
                                  : BLACK_CLR_SHADE,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 36,
                        width: 102,
                        child: TextButton(
                          style: ButtonStyle(
                            padding:
                                const MaterialStatePropertyAll(EdgeInsets.zero),
                            backgroundColor: MaterialStatePropertyAll(
                              _performanceController.isWeek.value
                                  ? DEFAULT_CLR
                                  : WHITE_SHADE_CLR,
                            ),
                            shape: MaterialStatePropertyAll(
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
                            setState(() {
                              _performanceController.selectWeek(context);
                            });
                          },
                          child: Text(
                            'Week',
                            style: GoogleFonts.poppins(
                              fontSize: FONT_SM,
                              fontWeight: FontWeight.w600,
                              color: _performanceController.isWeek.value
                                  ? WHITE_SHADE_CLR
                                  : BLACK_CLR_SHADE,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 36,
                        width: 102,
                        child: TextButton(
                          style: ButtonStyle(
                            padding:
                                const MaterialStatePropertyAll(EdgeInsets.zero),
                            backgroundColor: MaterialStatePropertyAll(
                              _performanceController.isMonth.value
                                  ? DEFAULT_CLR
                                  : WHITE_SHADE_CLR,
                            ),
                            shape: MaterialStatePropertyAll(
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
                            setState(() {
                              _performanceController.selectMonth();
                            });
                          },
                          child: Text(
                            'Month',
                            style: GoogleFonts.poppins(
                              fontSize: FONT_SM,
                              fontWeight: FontWeight.w600,
                              color: _performanceController.isMonth.value
                                  ? WHITE_SHADE_CLR
                                  : BLACK_CLR_SHADE,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: SPACING_LG),
                  if (_performanceController.isDay.value) Day(),
                  if (_performanceController.isWeek.value) const Week(),
                  if (_performanceController.isMonth.value) Month(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
