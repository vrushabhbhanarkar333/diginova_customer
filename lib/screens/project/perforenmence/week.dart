import 'package:diginova/global/constant.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Week extends StatefulWidget {
  const Week({
    super.key,
  });

  @override
  State<Week> createState() => _WeekState();
}

class _WeekState extends State<Week> {
  final int completed = 98;
  final int onGoing = 67;
  late List<_ChartData> data;
  late List<_ChartData> data1;
  late TooltipBehavior _tooltip;
  @override
  void initState() {
    data = [
      _ChartData('Project1', 10),
      _ChartData('Project2', 12),
      _ChartData('Project3', 11),
    ];
    data1 = [
      _ChartData('Project1', 7),
      _ChartData('Project2', 7),
      _ChartData('Project3', 9),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 162,
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
                  Image.asset('assets/images/Vector (2).png'),
                  const SizedBox(height: SPACING_M),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Completed',
                          style: GoogleFonts.poppins(
                            fontSize: FONT_16,
                            fontWeight: FontWeight.w600,
                            color: WHITE_CLR,
                          ),
                        ),
                        Text(
                          '98%',
                          style: GoogleFonts.poppins(
                            fontSize: FONT_16,
                            fontWeight: FontWeight.w600,
                            color: WHITE_CLR,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: SPACING_XS),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      lineHeight: 8.0,
                      percent: completed / 100,
                      animation: true,
                      barRadius: const Radius.circular(25),
                      backgroundColor: const Color(0XFFE5E5E5),
                      progressColor: LIGHT_BLUE_CLR,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 162,
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
                  Image.asset('assets/images/ic_round-add-task.png'),
                  const SizedBox(height: SPACING_M),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'On going',
                          style: GoogleFonts.poppins(
                            fontSize: FONT_16,
                            fontWeight: FontWeight.w600,
                            color: WHITE_CLR,
                          ),
                        ),
                        Text(
                          '$onGoing%',
                          style: GoogleFonts.poppins(
                            fontSize: FONT_16,
                            fontWeight: FontWeight.w600,
                            color: WHITE_CLR,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: SPACING_XS),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      lineHeight: 8.0,
                      percent: onGoing / 100,
                      animation: true,
                      barRadius: const Radius.circular(25),
                      backgroundColor: const Color(0XFFE5E5E5),
                      progressColor: LIGHT_BLUE_CLR,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: SPACING_XL,
        ),
        Card(
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          color: WHITE_CLR,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(
                  'Status',
                  style: GoogleFonts.poppins(
                    fontSize: FONT_SM,
                    fontWeight: FontWeight.w600,
                    color: BLACK_CLR,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(
                    // isVisible: false,
                    labelStyle: GoogleFonts.poppins(
                      fontSize: FONT_XS,
                      fontWeight: FontWeight.w400,
                      color: GRAY_CLR_SHADE,
                    ),
                  ),
                  primaryYAxis: NumericAxis(
                    axisLine: const AxisLine(color: Colors.transparent),
                    minimum: 0,
                    maximum: 12,
                    interval: 2,
                    labelStyle: GoogleFonts.poppins(
                      fontSize: FONT_XS,
                      fontWeight: FontWeight.w400,
                      color: GRAY_CLR_SHADE,
                    ),
                  ),
                  tooltipBehavior: _tooltip,
                  series: <CartesianSeries<_ChartData, String>>[
                    ColumnSeries<_ChartData, String>(
                      dataSource:
                          data, // Use the same data for the second series
                      xValueMapper: (_ChartData data, _) => data.x,
                      yValueMapper: (_ChartData data, _) => data.y,
                      color: BLACK_SHADE_CLR, // Change color as needed
                      width: 0.4,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    ColumnSeries<_ChartData, String>(
                      spacing: 0.5,
                      dataSource: data1,
                      xValueMapper: (_ChartData data1, _) => data1.x,
                      yValueMapper: (_ChartData data1, _) => data1.y,
                      color: LIGHT_BLUE_CLR,
                      width: 0.8,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: SPACING_SM),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 10,
                    width: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: LIGHT_BLUE_CLR,
                    ),
                  ),
                  const SizedBox(width: SPACING_XS),
                  Text(
                    'Completed',
                    style: GoogleFonts.poppins(
                      fontSize: FONT_XS,
                      color: GRAY_CLR_SHADE,
                    ),
                  ),
                  const SizedBox(width: SPACING_MD),
                  Container(
                    height: 10,
                    width: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: BLACK_SHADE_CLR,
                    ),
                  ),
                  const SizedBox(width: SPACING_XS),
                  Text(
                    'On Going',
                    style: GoogleFonts.poppins(
                      fontSize: FONT_XS,
                      color: GRAY_CLR_SHADE,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: SPACING_LG),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: DottedLine(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  lineLength: double.infinity,
                  lineThickness: 1.0,
                  dashLength: 8.0,
                  dashColor: BLACK_CLR_SHADE,
                  dashRadius: 0.0,
                  dashGapLength: 9.0,
                ),
              ),
              const SizedBox(height: SPACING_SM),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Status',
                  style: GoogleFonts.poppins(
                    fontSize: FONT_SM,
                    fontWeight: FontWeight.w600,
                    color: BLACK_CLR,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: LinearPercentIndicator(
                  padding: EdgeInsets.zero,
                  lineHeight: 18,
                  percent: onGoing / 100,
                  animation: true,
                  barRadius: const Radius.circular(25),
                  backgroundColor: BLACK_CLR_SHADE,
                  progressColor: LIGHT_BLUE_CLR,
                  trailing: Padding(
                    padding: const EdgeInsets.only(left: 21),
                    child: Text(
                      'PCB',
                      style: GoogleFonts.poppins(
                        fontSize: FONT_14,
                        fontWeight: FontWeight.w500,
                        color: BLACK_CLR,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: SPACING_M),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: LinearPercentIndicator(
                  padding: EdgeInsets.zero,
                  lineHeight: 18,
                  percent: 30 / 100,
                  animation: true,
                  barRadius: const Radius.circular(25),
                  backgroundColor: BLACK_CLR_SHADE,
                  progressColor: LIGHT_BLUE_CLR,
                  trailing: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Panel',
                      style: GoogleFonts.poppins(
                        fontSize: FONT_14,
                        fontWeight: FontWeight.w500,
                        color: BLACK_CLR,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: SPACING_M),
            ],
          ),
        ),
      ],
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);
  final String x;
  final double y;
}
