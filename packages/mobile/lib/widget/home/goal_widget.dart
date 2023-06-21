import 'package:flutter/material.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';

class GoalWidget extends StatelessWidget {
  final double width;
  final double height;
  const GoalWidget({super.key, required this.width, required this.height});

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Goal',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                CustomText(
                  text: 'Leg Day',
                  fontSize: 14,
                )
              ],
            ),
            SizedBox(
                height: height * 0.4,
                width: width * 0.85,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        ColorPalette.crimsonRed),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Start Now',
                    style: TextStyle(
                      color: ColorPalette.black00,
                      fontSize: 14,
                    ),
                  ),
                ))
          ],
        ));
  }
}
