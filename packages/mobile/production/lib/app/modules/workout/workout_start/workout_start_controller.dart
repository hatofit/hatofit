import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/exercise_model.dart';
import 'package:hatofit/app/models/session_model.dart';
import 'package:hatofit/app/modules/history/history_controller.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';
import 'package:hatofit/app/services/internet_service.dart';
import 'package:hatofit/app/services/storage_service.dart';
import 'package:intl/intl.dart';

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

  void nextInstruction(totalInstruction) {
    if (nowInstruction.value + 1 >= totalInstruction) {
      countDownTimer.value.reset();
      bleService.isStartWorkout.value = false;
      isAllExerciseFinish.value = true;
      Get.offNamed(AppRoutes.dashboard);
      _historyController.fetchHistory();
    }
    if ((nowInstruction.value + 1) < totalInstruction) {
      countDownTimer.value.restart(
          duration: workout.instructions[nowInstruction.value].duration);
      isNowExerciseFinish.value = false;
      nowInstruction.value++;
    }
  }

  final sessionDataItem = <SessionDataItem>[].obs;

  startWorkout() {
    int counter = 0;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (bleService.isStartWorkout.value == false) {
        SessionModel session = SessionModel(
          exerciseId: workout.id,
          startTime: _startTime,
          endTime: DateTime.now().microsecondsSinceEpoch,
          timelines: [],
          data: sessionDataItem,
        );
        final DateTime strtTime =
            DateTime.fromMicrosecondsSinceEpoch(_startTime);
        final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');
        final String formatted = formatter.format(strtTime);
        StorageService()
            .saveToJSON('session/raw/$formatted-${workout.name}.json', session);
        InternetService().postSession(session);
        timer.cancel();
      } else {
        sessionDataItem.add(SessionDataItem(
          second: counter,
          timeStamp: DateTime.now().microsecondsSinceEpoch,
          devices: bleService.sesionValue,
        ));
      }
      bleService.sesionValue.clear();
      counter++;
    });
  }

  @override
  void onInit() {
    bleService.isStartWorkout.value = true;
    // bleService.starWorkout(workout.id, workout.duration, 'EMPTY');
    super.onInit();
  }
}
