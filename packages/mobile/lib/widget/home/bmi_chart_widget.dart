import 'package:flutter/material.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'BMI',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const IconWrapper(
                  icon: Icons.monitor_weight,
                  backgroundColor: ColorPalette.aqua35,
                  iconColor: ColorPalette.aqua,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '24.9',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xFFD6FFDD),
                  ),
                  child: Text(
                    "You're Healthy",
                    style: Theme.of(context).textTheme.bodySmall,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 8),
                    Container(
                      width: 1,
                      height: height * 0.2,
                      decoration: const BoxDecoration(
                        color: ColorPalette.aqua,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 8),
                        Text(
                          'Height',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '170',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Text(
                              ' cm',
                              style: Theme.of(context).textTheme.bodySmall,
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
                      height: height * 0.2,
                      decoration: const BoxDecoration(
                        color: ColorPalette.aqua,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 8),
                        Text(
                          'Weight',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '70',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            Text(
                              ' kg',
                              style: Theme.of(context).textTheme.bodySmall,
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
