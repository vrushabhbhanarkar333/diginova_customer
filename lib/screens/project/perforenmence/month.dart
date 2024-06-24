import 'package:diginova/global/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Month extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Month({super.key});
  @override
  MonthState createState() => MonthState();
}

class MonthState extends State<Month> {
  // ignore: library_private_types_in_public_api
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  @override
  void initState() {
    data = [
      // _ChartData(11, 6),
      // _ChartData(21, 7),
      // _ChartData(32, 10),
      // _ChartData(40, 8),
      // _ChartData(50, 9),
      // _ChartData(60, 6),
      // _ChartData(7, 6),
      _ChartData('Mon', 6),
      _ChartData('Tues', 7),
      _ChartData('Wed', 10),
      _ChartData('Thurs', 4),
      _ChartData('Fri', 8),
      _ChartData('Sat', 9),
      _ChartData('Sun', 6),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.transparent,
      color: WHITE_CLR,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'This week details',
                      style: GoogleFonts.poppins(
                        fontSize: FONT_XSS,
                        fontWeight: FontWeight.w500,
                        color: BLACK_CLR,
                      ),
                    ),
                    Text(
                      'Consumption 58.4Kwh',
                      style: GoogleFonts.poppins(
                        fontSize: FONT_XSS,
                        fontWeight: FontWeight.w400,
                        color: BLACK_CLR,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.calendar_today_rounded),
                  color: WARM_GRAY_CLR,
                )
              ],
            ),
          ),
          SizedBox(
            height: 301,
            child: SfCartesianChart(
              primaryXAxis: const CategoryAxis(
                // isVisible: false,
                labelStyle: TextStyle(
                  fontSize: FONT_XS,
                  fontWeight: FontWeight.w400,
                  color: GRAY_CLR_SHADE,
                ),
              ),
              primaryYAxis: const NumericAxis(
                axisLine: AxisLine(color: Colors.transparent),
                minimum: 0,
                maximum: 12,
                interval: 2,
                labelStyle: TextStyle(
                  fontSize: FONT_XS,
                  fontWeight: FontWeight.w400,
                  color: GRAY_CLR_SHADE,
                ),
              ),
              tooltipBehavior: _tooltip,
              series: <CartesianSeries<_ChartData, String>>[
                ColumnSeries<_ChartData, String>(
                  dataSource: data,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y,
                  color: BTN_BLUE_CLR,
                  width: 0.5,
                  borderRadius: BorderRadius.circular(5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);
  final String x;
  final double y;
}
