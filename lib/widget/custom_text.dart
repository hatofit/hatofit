import 'package:flutter/material.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final int maxLines;
  final TextOverflow textOverflow;
  final TextAlign textAlign;

  const CustomText({
    super.key,
    required this.text,
    this.color = ColorPalette.black,
    this.fontFamily = 'Popins',
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.maxLines = 24,
    this.textOverflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLines,
        overflow: textOverflow,
        textAlign: textAlign,
        style: TextStyle(
          color: color,
          fontFamily: fontFamily,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ));
  }
}
