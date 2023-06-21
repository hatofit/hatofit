import 'package:flutter/material.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';
import 'package:polar_hr_devices/widget/icon_wrapper.dart';

class BMIChartWidget extends StatelessWidget {
  final double width;
  final double height;
  const BMIChartWidget({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: ColorPalette.aqua20,
              blurRadius: 5,
              offset: Offset(0, 1),
            ),
          ],
          color: ColorPalette.black00,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'BMI',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                IconWrapper(
                  icon: Icons.monitor_weight,
                  backgroundColor: ColorPalette.aqua35,
                  iconColor: ColorPalette.aqua,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  text: '24.9',
                  fontSize: 24,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: ColorPalette.aqua50,
                  ),
                  child: const CustomText(
                    text: "You're Healthy",
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            //chart
            Column(
              children: [
                SizedBox(
                  height: 15,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 75,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFB5D4F1),
                        Color(0xFF81E5DB),
                        Color(0xFFE8D284),
                        Color(0xFFE2798E),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: '15',
                  fontSize: 12,
                ),
                CustomText(
                  text: '20',
                  fontSize: 12,
                ),
                CustomText(
                  text: '25',
                  fontSize: 12,
                ),
                CustomText(
                  text: '30',
                  fontSize: 12,
                ),
                CustomText(
                  text: '40',
                  fontSize: 12,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 8),
                    Container(
                      width: 1,
                      height: height * 0.15,
                      decoration: const BoxDecoration(
                        color: ColorPalette.aqua,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 8),
                        CustomText(
                          text: 'Height',
                          fontSize: 12,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            CustomText(
                              text: '170',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            CustomText(
                              text: ' cm',
                              fontSize: 12,
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 1,
                      height: height * 0.15,
                      decoration: const BoxDecoration(
                        color: ColorPalette.aqua,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 8),
                        CustomText(
                          text: 'Weight',
                          fontSize: 12,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            CustomText(
                              text: '70',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            CustomText(
                              text: ' kg',
                              fontSize: 12,
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
