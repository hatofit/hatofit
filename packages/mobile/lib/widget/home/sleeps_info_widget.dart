import 'package:flutter/material.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sleeps',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const IconWrapper(
                  icon: Icons.bedtime,
                  backgroundColor: ColorPalette.orangeYellow35,
                  iconColor: ColorPalette.orangeYellow,
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
