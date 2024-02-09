import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/heart_rate.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';
import 'package:hatofit/utils/hr_zone.dart';
import 'package:hatofit/utils/snackbar.dart';
import 'package:hatofit/utils/streaming_utils.dart';
import 'package:hatofit/utils/time_utils.dart';
import 'package:vibration/vibration.dart';

class FreeWorkoutController extends GetxController {
  final BluetoothService bleService = Get.find<BluetoothService>();
  final int _startTime = DateTime.now().microsecondsSinceEpoch;
  final hrZone = HrZoneutils();
  final RxString elapsedTime = "".obs;
  final hrPecentage = 0.obs;
  final RxInt currentHeartRate = 0.obs;
  final List<Map<String, dynamic>> hrList = [];
  HrZoneType hrZoneType = HrZoneType.VERYLIGHT;
  final strmUtls = StreamingUtils();
  Worker? worker;
  final isLoading = false.obs;
  final isVibrate = false.obs;

  @override
  void onInit() {
    worker = ever(
        bleService.detectedDevices
            .firstWhere((element) => element.isConnect.value == true)
            .hr, (dynamic hrValue) {
      _addHr(DateTime.now().microsecondsSinceEpoch, hrValue);
      _startCalcHr();
      _userZone(hrValue);
    });
    bleService.isStartWorkout.value = true;
    strmUtls.startWorkout();
    super.onInit();
  }

  @override
  void onClose() {
    bleService.isStartWorkout.value = false;
    if (worker != null) worker!.dispose();
    super.onClose();
  }

  void _userZone(int hr) {
    final HrZoneType nowZone = hrZone.findZone(hr);
    hrZoneType = nowZone;
    if (nowZone == HrZoneType.MAXIMUM) {
      Future.delayed(const Duration(seconds: 1), () {
        // Vibration.vibrate(duration: 1000);
        Get.snackbar(
          'Zone',
          icon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[200],
            ),
            child: hrZoneType.image,
          ),
          hrZoneType.name,
          backgroundColor: hrZoneType.color,
        );
      });
      if (isVibrate.value == false) {
        Future.delayed(const Duration(milliseconds: 1500), () {
          Vibration.vibrate(duration: 1000);
        });
        isVibrate.value = true;
      }
    }
    hrPecentage.value = hrZone.findPercentage(hr);
    isVibrate.value = true;
  }

  void saveWorkout(String title) async {
    isLoading.value = true;
    try {
      bleService.isStartWorkout.value = false;
      final res = await strmUtls.saveWorkout(
        title,
        _startTime,
        [],
      );
      if (res != null && res == 200) {
        MySnackbar.success('Success', 'Data saved successfully');
        Get.offAllNamed(AppRoutes.dashboard);
      } else {
        MySnackbar.error('Error', '$res.body');
      }
    } catch (e) {
      MySnackbar.error('Error', 'Something went wrong');
    } finally {
      isLoading.value = false;
    }
  }

  void _addHr(int time, int hr) {
    hrList.add({'time': time, 'hr': hr});
    currentHeartRate.value = hr;
  }

  final hrStats = HrStats(
    avg: 0,
    max: 0,
    min: 0,
    last: 0,
    time: '',
    sfSpot: [
      HrChart(DateTime.now(), 0),
    ],
  ).obs;

  void finishWorkout() {
    bleService.isStartWorkout.value = false;
    Get.toNamed(AppRoutes.pickWoType);
  }

  _startCalcHr() {
    if (hrList.isEmpty) {
      throw ArgumentError('hrList cannot be empty.');
    }

    int min = hrList[0]['hr'];
    int max = hrList[0]['hr'];
    num total = 0;
    List<HrChart> sfSpot = [];

    for (var entry in hrList) {
      final hr = entry['hr'];
      if (hr < min) min = hr;
      if (hr > max) max = hr;
      total += hr;

      sfSpot.add(HrChart(
        DateTime.fromMicrosecondsSinceEpoch(entry['time']),
        hr.toDouble(),
      ));
    }

    final avg = total ~/ hrList.length;
    final last = hrList.last['hr'];
    final elapsedTime = TimeUtils.elapsed(
      hrList.first['time'],
      hrList.last['time'],
    );
    hrStats.value = HrStats(
      avg: avg,
      max: max,
      min: min,
      last: last,
      sfSpot: sfSpot,
      time: elapsedTime,
    );
  }
}
