import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';

class IconWrapper extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double? size;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final double? borderWidth;

  const IconWrapper({
    super.key,
    required this.icon,
    required this.color,
    this.size,
    this.borderRadius,
    this.borderWidth,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Dimens.width32,
      height: height ?? Dimens.width32,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(Dimens.radius8),
        border: Border.all(
          color: color.withOpacity(0.35),
          width: borderWidth ?? Dimens.width2,
        ),
      ),
      child: Icon(
        icon,
        size: size ?? Dimens.width20,
        color: color,
      ),
    );
  }
}
