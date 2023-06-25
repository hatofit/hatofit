import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/modules/dashboard/dashboard_controller.dart';
import 'package:polar_hr_devices/modules/history/history_controller.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';

import 'dart:io';
import 'package:path_provider/path_provider.dart';

class HistoryDetailPage extends StatelessWidget {
  const HistoryDetailPage({super.key});
  Future<bool> requestStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> saveWorkoutVariablesToFile(Workout workout) async {
    bool hasPermission = await requestStoragePermission();

    if (hasPermission) {
      Directory  directory = await getApplicationDocumentsDirectory();

      // ignore: unnecessary_null_comparison
      if (directory != null) {
        Directory hatoFitDir = Directory('${directory.path}/HatoFit');
        if (!hatoFitDir.existsSync()) {
          hatoFitDir.createSync();
        }

        String fileName = '${workout.date}.txt';
        String filePath = '${hatoFitDir.path}/$fileName';

        File file = File(filePath);
        await file.writeAsString('${workout.name}\n${workout.date}');

      } else {
      }
    } else {
      Permission.storage.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController = Get.find();
    final Workout workout = Get.arguments;

    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: dashboardController.screenWidth * 0.95,
              child: const CustomText(text: 'Detail'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                saveWorkoutVariablesToFile(workout);
              },
              child: const Text('Save Workout Variables'),
            ),
          ],
        ),
      ),
    );
  }
}
