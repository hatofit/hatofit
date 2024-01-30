import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';

class IconWrapper extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double? size;
  final BorderRadius? borderRadius;
  final double? borderWidth;

  const IconWrapper({
    super.key,
    required this.icon,
    required this.color,
    this.size,
    this.borderRadius,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? Dimens.width32,
      height: size ?? Dimens.width32,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(Dimens.radius8),
        border: Border.all(
          color: color.withOpacity(0.35),
          width: borderWidth ?? Dimens.width2,
        ),
      ),
      child: Icon(
        icon,
        size: size ?? 20,
        color: color,
      ),
    );
  }
}
