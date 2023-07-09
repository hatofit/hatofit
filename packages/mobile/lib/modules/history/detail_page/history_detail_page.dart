import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/modules/dashboard/dashboard_controller.dart';

class HistoryDetailPage extends StatelessWidget {
  const HistoryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController = Get.find();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: dashboardController.screenWidth * 0.95,
              child: const Text('Detail'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Save Workout Variables'),
            ),
          ],
        ),
      ),
    );
  }
}
