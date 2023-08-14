import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/core/themes/colors_constants.dart';

import 'package:polar_hr_devices/presentation/widget/icon_wrapper.dart';

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
                  'Sleeps',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                IconWrapper(
                  icon: Icons.bedtime,
                  backgroundColor:
                      ColorConstants.orangeYellow.withOpacity(0.35),
                  iconColor: ColorConstants.orangeYellow,
                ),
              ],
            ),
            SizedBox(
                height: height * 0.4,
                width: width * 0.85,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '20',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Text(
                          ' hr',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '40',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Text(
                          ' mn',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ));
  }
}
