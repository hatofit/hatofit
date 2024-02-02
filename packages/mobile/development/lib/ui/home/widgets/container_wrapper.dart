import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';

class ContainerWrapper extends StatelessWidget {
  const ContainerWrapper({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.width8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.width8),
        color: Theme.of(context).cardColor,
      ),
      child: child,
    );
  }
}
