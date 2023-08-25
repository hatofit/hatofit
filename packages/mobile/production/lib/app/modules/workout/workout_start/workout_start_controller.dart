import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/exercise_model.dart';
import 'package:hatofit/app/models/session_model.dart';
import 'package:hatofit/app/modules/history/history_controller.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';
import 'package:hatofit/app/services/internet_service.dart';
import 'package:hatofit/app/services/storage_service.dart';
import 'package:hatofit/utils/debug_logger.dart';
import 'package:hatofit/utils/hr_zone.dart';
import 'package:intl/intl.dart';
import 'package:vibration/vibration.dart';

class WorkoutStartController extends GetxController {
  final workout = Get.arguments as ExerciseModel;
  final int _startTime = DateTime.now().microsecondsSinceEpoch;

  final nowInstruction = 0.obs;
  final countDownTimer = CountDownController().obs;
  final isPause = false.obs;
  final isNowExerciseFinish = false.obs;
  final isAllExerciseFinish = false.obs;

  final BluetoothService bleService = Get.find<BluetoothService>();
  final HistoryController _historyController = Get.find<HistoryController>();

  final sessionDataItem = <SessionDataItem>[];
  HrZoneType? hrZoneType;

  @override
  void onInit() {
    bleService.sesionValue.clear();
    bleService.isStartWorkout.value = true;
    Vibration.vibrate(duration: 500);
    Future.delayed(const Duration(seconds: 3), () {
      startWorkout();
    });
    super.onInit();
  }

  @override
  void onClose() {
    bleService.sesionValue.clear();
    bleService.isStartWorkout.value = false;
    super.onClose();
  }

  void nextInstruction(totalInstruction) {
    if (nowInstruction.value + 1 >= totalInstruction) {
      bleService.isStartWorkout.value = false;
      saveWorkout(workout.id);
      countDownTimer.value.reset();
      isAllExerciseFinish.value = true;
      _historyController.fetchHistory();
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

  startWorkout() {
    int counter = 0;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (bleService.isStartWorkout.value == false) {
        timer.cancel();
      } else {
        sessionDataItem.add(SessionDataItem(
          second: counter,
          timeStamp: DateTime.now().microsecondsSinceEpoch,
          devices: bleService.sesionValue,
        ));
        logger.d(sessionDataItem.length);
        bleService.sesionValue.clear();
        counter++;
      }
    });
  }

  void saveWorkout(String title) {
    SessionModel session = SessionModel(
      exerciseId: title,
      startTime: _startTime,
      endTime: DateTime.now().microsecondsSinceEpoch,
      timelines: [],
      data: sessionDataItem,
    );
    final DateTime strtTime = DateTime.fromMicrosecondsSinceEpoch(_startTime);
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');
    final String formatted = formatter.format(strtTime);
    logger.i(session);
    StorageService().saveToJSON('session/raw/$formatted-$title', session);
    InternetService().postSession(session);
    Get.offAllNamed(AppRoutes.dashboard);
  }
}
