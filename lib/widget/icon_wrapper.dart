import 'package:flutter/material.dart';

class IconWrapper extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double containerSize;
  final double iconSize;
  final BorderRadius borderRadius;

  const IconWrapper(
      {Key? key,
      required this.icon,
      required this.backgroundColor,
      required this.iconColor,
      this.containerSize = 42,
      this.iconSize = 28,
      this.borderRadius = const BorderRadius.all(Radius.circular(8))})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerSize,
      height: containerSize,
      decoration:
          BoxDecoration(color: backgroundColor, borderRadius: borderRadius),
      child: Icon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
    );
  }
}
