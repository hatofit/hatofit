import 'package:flutter/material.dart';

class IconWrapper extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double containerSize;
  final double iconSize;
  final BorderRadius borderRadius;
  final double borderWidth;

  const IconWrapper({
    Key? key,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    this.containerSize = 32,
    this.iconSize = 20,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.borderWidth = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerSize,
      height: containerSize,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: Border.all(color: backgroundColor, width: borderWidth),
      ),
      child: Icon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
    );
  }
}
