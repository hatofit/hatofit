import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/modules/dashboard/views/home/home_controller.dart';
import 'package:hatofit/app/themes/colors_constants.dart';
import 'package:hatofit/app/widget/icon_wrapper.dart';

class BMIChartWidget extends GetView<HomeController> {
  const BMIChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = Get.width * 0.45;
    final height = Get.height * 0.24;
    final double bmiValue = controller.userBMI();
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? ColorConstants.darkContainer
            : ColorConstants.lightContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'BMI',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              IconWrapper(
                icon: Icons.monitor_weight,
                backgroundColor: ColorConstants.aqua.withOpacity(0.35),
                iconColor: ColorConstants.aqua,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                bmiValue.toStringAsFixed(1),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Get.isDarkMode
                      ? const Color(0xFFD6FFDD).withOpacity(0.1)
                      : const Color(0xFFD6FFDD),
                ),
                child: Text(
                  controller.bmiStatus(bmiValue),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
          // BMI chart using custom paint widget
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                height: 15,
                child: CustomPaint(
                  size: const Size(300, 10), // Adjust the size as needed
                  painter: BMIPainter(bmiValue),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFB5D4F1),
                      Color(0xFF81E5DB),
                      Color(0xFFE8D284),
                      Color(0xFFE2798E),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '15',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                '20',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                '25',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                '30',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                '40',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Row(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         const SizedBox(width: 8),
          //         Container(
          //           width: 1,
          //           height: height * 0.2,
          //           decoration: const BoxDecoration(
          //             color: ColorConstants.aqua,
          //           ),
          //         ),
          //         const SizedBox(width: 8),
          //         Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             const SizedBox(width: 8),
          //             Text(
          //               'Height',
          //               style: Theme.of(context).textTheme.bodySmall,
          //             ),
          //             Row(
          //               crossAxisAlignment: CrossAxisAlignment.baseline,
          //               textBaseline: TextBaseline.alphabetic,
          //               children: [
          //                 Text(
          //                   '170',
          //                   style: Theme.of(context).textTheme.headlineMedium,
          //                 ),
          //                 Text(
          //                   ' cm',
          //                   style: Theme.of(context).textTheme.bodySmall,
          //                 )
          //               ],
          //             )
          //           ],
          //         ),
          //       ],
          //     ),
          //     Row(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Container(
          //           width: 1,
          //           height: height * 0.2,
          //           decoration: const BoxDecoration(
          //             color: ColorConstants.aqua,
          //           ),
          //         ),
          //         const SizedBox(width: 8),
          //         Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             const SizedBox(width: 8),
          //             Text(
          //               'Weight',
          //               style: Theme.of(context).textTheme.bodySmall,
          //             ),
          //             Row(
          //               crossAxisAlignment: CrossAxisAlignment.baseline,
          //               textBaseline: TextBaseline.alphabetic,
          //               children: [
          //                 Text(
          //                   '70',
          //                   style: Theme.of(context).textTheme.headlineLarge,
          //                 ),
          //                 Text(
          //                   ' kg',
          //                   style: Theme.of(context).textTheme.bodySmall,
          //                 )
          //               ],
          //             )
          //           ],
          //         ),
          //         const SizedBox(width: 8),
          //       ],
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

class BMIPainter extends CustomPainter {
  final double bmiValue;

  BMIPainter(this.bmiValue);

  @override
  void paint(Canvas canvas, Size size) {
    final dotPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    final xPosition = (size.width - 10) * ((bmiValue - 15) / 25);
    final yPosition = size.height / 2;
    canvas.drawCircle(
      Offset(xPosition, yPosition),
      5.0,
      borderPaint,
    );

    canvas.drawCircle(
      Offset(xPosition, yPosition),
      5.0,
      dotPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
