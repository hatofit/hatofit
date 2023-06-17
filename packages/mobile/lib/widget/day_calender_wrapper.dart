import 'package:flutter/material.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';

class DayWidget extends StatelessWidget {
  final String day;
  final int date;
  final bool isSelected;

  const DayWidget(
      {super.key,
      required this.day,
      required this.date,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    Color color = Colors.transparent;
    if (isSelected) {
      color = ColorPalette.navyBlue;
    }
    return SizedBox(
      child: Column(
        children: [
          CustomText(
            text: day,
            fontSize: 12,
            color: ColorPalette.black00,
          ),
          Container(
            height: 28,
            width: 28,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: CustomText(
                text: date.toString(),
                fontSize: 12,
                color: ColorPalette.black00,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
