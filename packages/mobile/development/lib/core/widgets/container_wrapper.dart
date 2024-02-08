import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';

class ContainerWrapper extends StatelessWidget {
  final Widget child;
  final double? paddingSize;
  final Color? color;
  final double? width;
  final double? height;
  final Border? border;
  const ContainerWrapper({
    super.key,
    required this.child,
    this.paddingSize,
    this.color,
    this.width,
    this.height,
    this.border,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(paddingSize ?? Dimens.width8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.width8),
          color: color ?? Theme.of(context).cardColor,
          border: border),
      width: width ?? double.infinity,
      height: height,
      child: child,
    );
  }
}
