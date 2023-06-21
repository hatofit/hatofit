import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/pages/excercise/excercise_detail_controller.dart';
import 'package:polar_hr_devices/widget/appBar/custom_app_bar.dart';

class ExcerciseDetailPage extends GetView<ExcerciseController> {
  const ExcerciseDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: "Excercise Detail Page",
        screenColor: ColorPalette.black00,
      ),
      body: Center(
        child: Text(
          "History Page",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
