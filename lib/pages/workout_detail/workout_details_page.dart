import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/pages/workout_detail/workout_details_controller.dart';
import 'package:polar_hr_devices/widget/custom_app_bar.dart';

class WorkoutDetailPage extends GetView<WorkoutDetailController> {
  const WorkoutDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: '',
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
