import 'package:flutter/material.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';


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
          Text(
              day,
         style: Theme.of(context).textTheme.bodySmall,
          ),
          Container(
            height: 28,
            width: 28,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                  date.toString(),
             style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
