import 'package:flutter/material.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';
import 'package:polar_hr_devices/widget/icon_wrapper.dart';

class SleepsInfoWidget extends StatelessWidget {
  final double width;
  final double height;
  const SleepsInfoWidget(
      {super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: ColorPalette.orangeYellow20,
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
                  text: 'Sleeps',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                IconWrapper(
                  icon: Icons.bedtime,
                  backgroundColor: ColorPalette.orangeYellow35,
                  iconColor: ColorPalette.orangeYellow,
                ),
              ],
            ),
            SizedBox(
                height: height * 0.4,
                width: width * 0.85,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        CustomText(
                          text: '20',
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          text: 'hr',
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: '40',
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          text: 'mn',
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ));
  }
}
