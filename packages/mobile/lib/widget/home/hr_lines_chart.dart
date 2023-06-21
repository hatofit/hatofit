import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';

class HrLinesChart extends StatefulWidget {
  const HrLinesChart({super.key});
  final Color barBackgroundColor = ColorPalette.crimsonRed35;
  final Color barColor = ColorPalette.crimsonRed50;

  @override
  State<StatefulWidget> createState() => HrLinesChartState();
}

class HrLinesChartState extends State<HrLinesChart> {
  @override
  Widget build(BuildContext context) {
    return BarChart(mainBarData());
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    Color? barColor,
    Color? barBackgrounColor,
    double width = 16,
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: ColorPalette.crimsonRed,
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 10,
            color: ColorPalette.crimsonRed35,
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(5, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 5);
          case 1:
            return makeGroupData(1, 6.5);
          case 2:
            return makeGroupData(2, 5);
          case 3:
            return makeGroupData(3, 7.5);
          case 4:
            return makeGroupData(4, 9);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 30,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: const FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('08:00', style: style);
        break;
      case 1:
        text = const Text('08:15', style: style);
        break;
      case 2:
        text = const Text('08:30', style: style);
        break;
      case 3:
        text = const Text('08:45', style: style);
        break;
      case 4:
        text = const Text('09:00', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }
}
