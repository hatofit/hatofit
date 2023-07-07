import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/models/exercise_model.dart';
import 'package:polar_hr_devices/services/polar_service.dart';

class WorkoutStartController extends GetxController {
  final workout = Get.arguments as ExerciseModel;

  final nowInstruction = 0.obs;
  final countDownTimer = 0.obs;

  final PolarService _polarService = Get.find<PolarService>();

  void nextInstruction(totalInstruction) {
    if (nowInstruction.value < totalInstruction) {
      nowInstruction.value++;
    }
    if (nowInstruction.value == totalInstruction) {
      Get.back();
    }
  }

  @override
  void onInit() {
    _polarService.isStartWorkout.toggle();
    _polarService.starWorkout(workout.id, workout.duration);
    super.onInit();
  }

  @override
  void onClose() {
    _polarService.isStartWorkout.toggle();
    super.onClose();
  }
}
