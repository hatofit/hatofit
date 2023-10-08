import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/heart_Rate.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';
import 'package:hatofit/utils/hr_zone.dart';
import 'package:hatofit/utils/streaming_utils.dart';
import 'package:vibration/vibration.dart';

class FreeWorkoutController extends GetxController {
  final BluetoothService bleService = Get.find<BluetoothService>();
  final int _startTime = DateTime.now().microsecondsSinceEpoch;
  final title = 'Free Workout';
  final List<Map<String, dynamic>> hrList = [];
  HrZoneType? hrZoneType;
  final strmUtls = StreamingUtils();

  @override
  void onInit() {
    bleService.isStartWorkout.value = true;
    strmUtls.startWorkout();
    super.onInit();
  }

  @override
  void onClose() {
    bleService.isStartWorkout.value = false;
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

  void add(int time, int hr) {
    hrList.add({'time': time, 'hr': hr});
  }

  final hrStats = HrStats(avg: 0, max: 0, min: 0, last: 0, sfSpot: [
    HrChart(DateTime.now(), 0),
  ]).obs;

  void finishWorkout() {
    bleService.isStartWorkout.value = false;
    Get.toNamed(AppRoutes.pickWoType);
  }

  bool isIsolateRunning = false;

  Future<void> calcHr() async {
    if (isIsolateRunning) {
      return;
    } else {
      isIsolateRunning = true;
      final ReceivePort rp = ReceivePort();
      final Isolate i = await Isolate.spawn(hrCalc, (rp.sendPort, hrList));

      rp.listen(
        (mes) {
          hrStats.value = mes;
          if (mes != null) {
            isIsolateRunning = false;
            i.kill(priority: Isolate.immediate);
            rp.close();
          }
        },
      );
    }
  }
}

@pragma('vm:entry-point')
void hrCalc((SendPort, List<Map<String, dynamic>>) args) {
  final SendPort sendPort = args.$1;
  final List<Map<String, dynamic>> hrList = args.$2;

  final min = hrList
      .reduce((curr, next) => curr['hr'] < next['hr'] ? curr : next)['hr'];
  final max = hrList
      .reduce((curr, next) => curr['hr'] > next['hr'] ? curr : next)['hr'];
  final avg = hrList.map((e) => e['hr']).reduce((curr, next) => curr + next) ~/
      hrList.length;
  final last = hrList.last['hr'];
  final List<HrChart> sfSpot = hrList
      .map((e) => HrChart(
          DateTime.fromMicrosecondsSinceEpoch(e['time']), e['hr'].toDouble()))
      .toList();

  sendPort.send(HrStats(
    avg: avg,
    max: max,
    min: min,
    last: last,
    sfSpot: sfSpot,
  ));
}
