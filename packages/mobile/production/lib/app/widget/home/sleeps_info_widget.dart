import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/themes/colors_constants.dart';
import 'package:hatofit/app/widget/icon_wrapper.dart';

class SleepsInfoWidget extends StatelessWidget {
  const SleepsInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.45;
    final height = MediaQuery.of(context).size.height * 0.11;
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
