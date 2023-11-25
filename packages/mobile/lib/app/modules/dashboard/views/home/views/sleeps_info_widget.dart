// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hatofit/app/modules/dashboard/views/home/home_controller.dart';
// import 'package:hatofit/app/themes/colors_constants.dart';
// import 'package:hatofit/app/widget/icon_wrapper.dart';
// import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';

// class SleepsInfoWidget extends GetView<HomeController> {
//   const SleepsInfoWidget({super.key});

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
//                   'Sleeps',
//                   style: Theme.of(context).textTheme.displaySmall,
//                 ),
//                 IconWrapper(
//                   icon: Icons.bedtime,
//                   backgroundColor:
//                       ColorConstants.orangeYellow.withOpacity(0.35),
//                   iconColor: ColorConstants.orangeYellow,
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
//                   : controller.sleepMapping.isEmpty
//                       ? Center(
//                           child: Text(
//                           'No sleeps data yet from Google Fit\nBetween:\n${DateFormat('d').format(DateTime.now().subtract(const Duration(days: 1)))} - ${DateFormat('d MMMM yyyy').format(DateTime.now())}',
//                           textAlign: TextAlign.center,
//                         ))
//                       : Container(
//                           child: SfLinearGauge(
//                             markerPointers: [
//                               LinearShapePointer(
//                                   value: controller.sleepPointerGauge.value)
//                             ],
//                             minorTicksPerInterval: 4,
//                             useRangeColorForAxis: true,
//                             animateAxis: true,
//                             axisTrackStyle: LinearAxisTrackStyle(thickness: 1),
//                             ranges: const <LinearGaugeRange>[
//                               LinearGaugeRange(
//                                   startValue: 0,
//                                   endValue: 33,
//                                   position: LinearElementPosition.outside,
//                                   color: Color(0xffF45656)),
//                               LinearGaugeRange(
//                                   startValue: 33,
//                                   endValue: 66,
//                                   position: LinearElementPosition.outside,
//                                   color: Color(0xff0DC9AB)),
//                               LinearGaugeRange(
//                                   startValue: 66,
//                                   endValue: 100,
//                                   position: LinearElementPosition.outside,
//                                   color: Color(0xffFFC93E)),
//                             ],
//                           ),
//                         ),
//             ),
//           ],
//         ));
//   }
// }
