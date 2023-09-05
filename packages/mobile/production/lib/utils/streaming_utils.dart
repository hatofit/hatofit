import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:hatofit/app/models/session_model.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';
import 'package:hatofit/app/services/internet_service.dart';
import 'package:hatofit/app/services/storage_service.dart';
import 'package:hatofit/utils/debug_logger.dart';
import 'package:intl/intl.dart';

class StreamingUtils {
  final bleService = Get.find<BluetoothService>();

  final sessionDataItem = <SessionDataItem>[];
  startWorkout() {
    bleService.sesionValue.clear();
    sessionDataItem.clear();
    bleService.isStartWorkout.value = true;
    int counter = 0;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      sessionDataItem.add(SessionDataItem(
        second: counter,
        timeStamp: DateTime.now().microsecondsSinceEpoch,
        devices: List.from(bleService.sesionValue),
      ));
      logger.d(jsonEncode(sessionDataItem.length));
      if (bleService.isStartWorkout.value == false) {
        timer.cancel();
        counter = 0;
      }
      counter++;
      bleService.sesionValue.clear();
    });
  }

  Future<int?> saveWorkout(
    String title,
    int startTime,
    List<SessionTimeline> timelines,
  ) async {
    logger.f(
      jsonEncode(bleService.sesionValue),
    );
    SessionModel session = SessionModel(
        exerciseId: title,
        startTime: startTime,
        endTime: DateTime.now().microsecondsSinceEpoch,
        timelines: timelines.isEmpty ? [] : timelines,
        data: sessionDataItem);
    logger.f(
      jsonEncode(session.toJson()),
    );
    final DateTime strtTime = DateTime.fromMicrosecondsSinceEpoch(startTime);
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');
    final String formatted = formatter.format(strtTime);

    await StorageService().saveToJSON('session/raw/$formatted-$title', session);
    final res = await InternetService().postSession(session);
    return res;
  }
}
