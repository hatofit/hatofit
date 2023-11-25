// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:hatofit/app/models/charts/steps_data.dart';
// import 'package:hatofit/app/modules/dashboard/views/home/home_controller.dart';
// import 'package:hatofit/app/themes/colors_constants.dart';
// import 'package:hatofit/app/widget/icon_wrapper.dart';
// import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class StepsChartWidget extends GetView<HomeController> {
//   const StepsChartWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width * 0.93;
//     final height = MediaQuery.of(context).size.height * 0.3;
//     return Container(
//         width: width,
//         decoration: BoxDecoration(
//           color: Get.isDarkMode
//               ? ColorConstants.darkContainer
//               : ColorConstants.lightContainer,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Steps',
//                   style: Theme.of(context).textTheme.displaySmall,
//                 ),
//                 IconWrapper(
//                   icon: FontAwesomeIcons.ruler,
//                   backgroundColor:
//                       ColorConstants.ceruleanBlue.withOpacity(0.35),
//                   iconColor: ColorConstants.ceruleanBlue,
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: height * 0.05,
//             ),
//             Obx(
//               () => controller.healthDataList.isEmpty
//                   ? const Center(
//                       child: Text(
//                       'No sync with Google Fit yet',
//                       textAlign: TextAlign.center,
//                     ))
//                   : controller.stepsMapping.isEmpty
//                       ? Center(
//                           child: Text(
//                           'No steps data yet from Google Fit\nBetween:\n${DateFormat('d').format(DateTime.now().subtract(const Duration(days: 1)))} - ${DateFormat('d MMMM yyyy').format(DateTime.now())}',
//                           textAlign: TextAlign.center,
//                         ))
//                       : SizedBox(
//                           height: height * 0.8,
//                           child: SfCartesianChart(
//                             primaryXAxis: DateTimeAxis(
//                               dateFormat: DateFormat('d MMMM yyyy'),
//                               majorGridLines: const MajorGridLines(width: 0),
//                             ),
//                             primaryYAxis: NumericAxis(
//                               isVisible: false,
//                               majorGridLines: const MajorGridLines(width: 0),
//                             ),
//                             series: <ChartSeries>[
//                               LineSeries<StepsData, DateTime>(
//                                 dataSource: controller.stepsMapping
//                                     .map((x) => StepsData(x.dateFrom,
//                                         int.parse(x.value.toString())))
//                                     .toList(),
//                                 xValueMapper: (StepsData sales, _) =>
//                                     sales.time,
//                                 yValueMapper: (StepsData sales, _) =>
//                                     sales.steps,
//                                 color: ColorConstants.ceruleanBlue,
//                                 dataLabelSettings: const DataLabelSettings(
//                                   isVisible: true,
//                                   labelAlignment: ChartDataLabelAlignment.top,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//             ),
//           ],
//         ));
//   }
// }
