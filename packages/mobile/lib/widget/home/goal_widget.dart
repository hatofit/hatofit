import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';

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
          color: Get.isDarkMode
              ? ColorPalette.darkContainer
              : ColorPalette.lightContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Goal',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text(
                  'Leg Day',
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
            SizedBox(
                height: height * 0.4,
                width: width * 0.85,
                child: TextButton(
                  onPressed: () => {Get.toNamed(AppRoutes.setting)},
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
