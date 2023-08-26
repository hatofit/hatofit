import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hatofit/app/themes/colors_constants.dart';

class HrLinesChart extends StatefulWidget {
  HrLinesChart({super.key, required this.hrData});
  final Map<String, double> hrData;
  final Color barBackgroundColor = ColorConstants.crimsonRed.withOpacity(0.35);
  final Color barColor = ColorConstants.crimsonRed.withOpacity(0.5);

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
          color: ColorConstants.crimsonRed,
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 10,
            color: ColorConstants.crimsonRed.withOpacity(0.35),
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> showingGroups() =>
      // data from value widget.hrData not the key
      List.generate(widget.hrData.length, (i) {
        return makeGroupData(i, widget.hrData.values.toList()[i]);
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
            reservedSize: 32,
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
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;

    switch (value.toInt()) {
      case 0:
        text = Text(
          widget.hrData.keys.toList()[0],
          style: style,
        );
        break;
      case 1:
        text = Text(
          widget.hrData.keys.toList()[1],
          style: style,
        );
        break;
      case 2:
        text = Text(
          widget.hrData.keys.toList()[2],
          style: style,
        );
        break;
      case 3:
        text = Text(
          widget.hrData.keys.toList()[3],
          style: style,
        );
        break;
      case 4:
        text = Text(
          widget.hrData.keys.toList()[4],
          style: style,
        );
        break;
      default:
        text = Text(
          widget.hrData.keys.toList()[0],
          style: style,
        );
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }
}
