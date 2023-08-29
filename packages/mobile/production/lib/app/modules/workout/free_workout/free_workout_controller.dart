import 'dart:async';
import 'dart:isolate';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/session_model.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';
import 'package:hatofit/app/services/internet_service.dart';
import 'package:hatofit/app/services/storage_service.dart';
import 'package:hatofit/utils/hr_zone.dart';
import 'package:intl/intl.dart';
import 'package:vibration/vibration.dart';

class FreeWorkoutController extends GetxController {
  final BluetoothService bleService = Get.find<BluetoothService>();
  final int _startTime = DateTime.now().microsecondsSinceEpoch;
  final title = 'Free Workout';
  final List<Map<String, dynamic>> hrList = [];
  final sessionDataItem = <SessionDataItem>[];
  HrZoneType? hrZoneType;

  @override
  void onInit() {
    hrList.clear();
    bleService.isStartWorkout.value = true;
    bleService.sesionValue.clear();
    Vibration.vibrate(duration: 500);
    Future.delayed(const Duration(seconds: 3), () {
      startWorkout();
    });
    super.onInit();
  }

  @override
  void onClose() {
    hrList.clear();
    bleService.isStartWorkout.value = false;
    bleService.sesionValue.clear();
    super.onClose();
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

    StorageService().saveToJSON('session/raw/$formatted-$title', session);
    InternetService().postSession(session);

    Get.offAllNamed(AppRoutes.dashboard);
  }

  void add(int time, int hr) {
    hrList.add({'time': time, 'hr': hr});
  }

  final hrStats = HrStats(avg: 0, max: 0, min: 0, last: 0, flSpot: []).obs;
  Future<void> calcHr() async {
    final ReceivePort rp = ReceivePort();
    final Isolate i = await Isolate.spawn(hrCalc, (rp.sendPort, hrList));
    rp.listen(
      (mes) {
        hrStats.value = mes;
        i.kill(priority: Isolate.immediate);
        rp.close();
      },
      cancelOnError: true,
      onDone: () {
        i.kill(priority: Isolate.immediate);
        rp.close();
      },
    );
  }
}

class HrStats {
  final int avg;
  final int max;
  final int min;
  final int last;
  final List<FlSpot> flSpot;

  HrStats({
    required this.avg,
    required this.max,
    required this.min,
    required this.last,
    required this.flSpot,
  });
}

void hrCalc((SendPort, List<Map<String, dynamic>>) args) {
  final SendPort sendPort = args.$1;
  final List<Map<String, dynamic>> hrList = args.$2;

  if (hrList.length > 2) {
    final min = hrList
        .reduce((curr, next) => curr['hr'] < next['hr'] ? curr : next)['hr'];
    final max = hrList
        .reduce((curr, next) => curr['hr'] > next['hr'] ? curr : next)['hr'];
    final avg =
        hrList.map((e) => e['hr']).reduce((curr, next) => curr + next) ~/
            hrList.length;
    final last = hrList.last['hr'];
    final List<FlSpot> flSpot = hrList
        .map((e) => FlSpot(e['time'].toDouble(), e['hr'].toDouble()))
        .toList();
    sendPort.send(HrStats(
      avg: avg,
      max: max,
      min: min,
      last: last,
      flSpot: flSpot,
    ));
  } else {
    sendPort.send(HrStats(
      avg: 0,
      max: 0,
      min: 0,
      last: 0,
      flSpot: [],
    ));
  }
}
