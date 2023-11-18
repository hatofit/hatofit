import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/exercise_model.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';
import 'package:hatofit/utils/hr_zone.dart';
import 'package:hatofit/utils/streaming_utils.dart';
import 'package:vibration/vibration.dart';

class WorkoutStartController extends GetxController {
  final workout = Get.arguments as ExerciseModel;
  final int _startTime = DateTime.now().microsecondsSinceEpoch;

  final nowInstruction = 0.obs;
  final countDownTimer = CountDownController().obs;
  final isPause = false.obs;
  final isNowExerciseFinish = false.obs;
  final isAllExerciseFinish = false.obs;

  final strmUtls = StreamingUtils();

  final BluetoothService bleService = Get.find<BluetoothService>();

  HrZoneType? hrZoneType;

  @override
  void onInit() {
    bleService.isStartWorkout.value = true;
    bleService.sesionValue.clear();
    strmUtls.startWorkout();
    super.onInit();
  }

  @override
  void onClose() {
    bleService.isStartWorkout.value = false;
    bleService.sesionValue.clear();
    super.onClose();
  }

  void nextInstruction(totalInstruction) {
    if (nowInstruction.value + 1 >= totalInstruction) {
      bleService.isStartWorkout.value = false;
      saveWorkout(workout.id);
      countDownTimer.value.reset();
      isAllExerciseFinish.value = true;
      update();
    }
    if ((nowInstruction.value + 1) < totalInstruction) {
      countDownTimer.value.restart(
          duration: workout.instructions[nowInstruction.value].duration);
      isNowExerciseFinish.value = false;
      nowInstruction.value++;
    }
  }

  void userZone(int hr) {
    final HrZoneType nowZone = HrZoneutils().findZone(hr);
    if (hrZoneType != nowZone) {
      hrZoneType = nowZone;
      Future.delayed(const Duration(seconds: 1), () {
        Vibration.vibrate(duration: 1000);
        Get.snackbar(
          'Zone',
          icon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[200],
            ),
            child: hrZoneType!.image,
          ),
          hrZoneType!.name,
          backgroundColor: hrZoneType!.color,
        );
      });
      Future.delayed(const Duration(milliseconds: 1500), () {
        Vibration.vibrate(duration: 1000);
      });
    }
  }

  void saveWorkout(String title) async {
    bleService.isStartWorkout.value = false;
    final res = await strmUtls.saveWorkout(
      title,
      _startTime,
      [],
    );
    if (res != null && res == 200) {
      Get.offAllNamed(AppRoutes.dashboard);
    } else {
      Get.snackbar(
        'Error',
        'Something went wrong',
        backgroundColor: Colors.red,
      );
    }
  }
}
