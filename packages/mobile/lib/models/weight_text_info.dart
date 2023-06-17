import 'package:flutter/material.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';

class WeightTextScreen extends StatelessWidget {
  final double height;
  final double width;
  const WeightTextScreen({Key? key, required this.height, required this.width})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: height * 0.4,
          width: width * 0.85,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomText(
                text: '62',
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: 'kg',
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ],
          )),
    );
  }
}
