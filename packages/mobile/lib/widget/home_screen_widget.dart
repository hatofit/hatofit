import 'package:flutter/material.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/models/calories_pie_chart.dart';
import 'package:polar_hr_devices/models/sleep_text_info.dart';
import 'package:polar_hr_devices/models/water_bottle_chart.dart';
import 'package:polar_hr_devices/models/weight_text_info.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';
import 'package:polar_hr_devices/widget/icon_wrapper.dart';

class HomeWrapperWidget extends StatefulWidget {
  final String text;
  final int index;
  final double width;
  final double height;
  final IconData icon;
  final Color firstColor;
  final Color secondColor;
  final Color thirdColor;
  const HomeWrapperWidget({
    Key? key,
    required this.text,
    required this.index,
    required this.width,
    required this.height,
    required this.icon,
    required this.firstColor,
    required this.secondColor,
    required this.thirdColor,
  }) : super(key: key);

  @override
  State<HomeWrapperWidget> createState() => _HomeWrapperWidgetState();
}

class _HomeWrapperWidgetState extends State<HomeWrapperWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.firstColor,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: 'Today',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: ColorPalette.black75,
                    ),
                    CustomText(
                      text: widget.text,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                IconWrapper(
                  icon: widget.icon,
                  backgroundColor: widget.secondColor,
                  iconColor: widget.thirdColor,
                ),
              ],
            ),
            if (widget.index == 0)
              CaloriesPieScreen(
                height: widget.height,
                width: widget.width,
              )
            else if (widget.index == 1)
              SleepTextScreen(
                height: widget.height,
                width: widget.width,
              )
            else if (widget.index == 2)
              WaterBottleScreen(
                height: widget.height,
                width: widget.width,
              )
            else if (widget.index == 3)
              WeightTextScreen(
                height: widget.height,
                width: widget.width,
              ),
          ],
        ));
  }
}
