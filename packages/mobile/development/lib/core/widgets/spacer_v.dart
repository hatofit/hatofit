import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';

class SpacerV extends StatelessWidget {
  const SpacerV({super.key, this.value});

  final double? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: value ?? Dimens.height8,
    );
  }
}
