import 'dart:isolate';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/models/session_model.dart';
import 'package:polar_hr_devices/services/polar_service.dart';
import 'package:polar_hr_devices/services/storage_service.dart';

import '../../services/internet_service.dart';

class FreeWorkoutController extends GetxController {
  final PolarService _pCon = Get.find<PolarService>();
  DateTime _startTime = DateTime.now();
  final title = 'Free Workout';
  final List<Map<String, dynamic>> hrList = [];

  String findElapsed() {
    final DateTime startTime =
        DateTime.fromMicrosecondsSinceEpoch(hrList.first['time']);
    final DateTime endTime =
        DateTime.fromMicrosecondsSinceEpoch(hrList.last['time']);
    final Duration elapsed = endTime.difference(startTime);
    return elapsed.toString().split('.')[0];
  }

  SessionModel? session;

  @override
  void onInit() {
    _startTime = DateTime.now();
    _pCon.isStartWorkout.value = true;
    _pCon.starWorkout('EMPTY', 0, 'EMPTY');
    super.onInit();
  }

  @override
  void onClose() {
    _pCon.isStartWorkout.value = false;
    hrList.clear();
    savePrompt();
    super.onClose();
  }

  void getData() {
    session = _pCon.sessMod.value;
  }

  void savePrompt() {
    getData();
    final TextEditingController titleController = TextEditingController();
    Get.defaultDialog(
      title: 'Save Workout',
      content: Column(
        children: [
          const Text('Save Workout?'),
          const SizedBox(height: 16),
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  StorageService().saveToJSON(
                      'session/raw/log-${titleController.text}.json', session);
                  InternetService().postSession(session);
                  Get.back();
                },
                child: const Text('No'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        ],
      ),
    );
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
