import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';

import '../controller/dashboard_controller.dart';

class HistoryDetailPage extends StatelessWidget {
  const HistoryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController = Get.find();

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: dashboardController.screenWidth * 0.95,
          child: CustomText(text: 'Detail'),
        ),
      ),
    );
  }
}
