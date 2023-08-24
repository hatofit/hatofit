import 'dart:async';
import 'dart:isolate';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/session_model.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';
import 'package:hatofit/app/services/storage_service.dart';
import 'package:hatofit/utils/debug_logger.dart';
import 'package:intl/intl.dart';

import '../../../services/internet_service.dart';

class FreeWorkoutController extends GetxController {
  final BluetoothService bleService = Get.find<BluetoothService>();
  final int _startTime = DateTime.now().microsecondsSinceEpoch;
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

  @override
  void onInit() {
    hrList.clear();
    bleService.sesionValue.clear();
    bleService.isStartWorkout.value = true;
    super.onInit();
  }

  @override
  void onClose() {
    hrList.clear();
    bleService.sesionValue.clear();
    bleService.isStartWorkout.value = true;
    savePrompt();
    super.onClose();
  }

  final sessionDataItem = <SessionDataItem>[];

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
      }
      bleService.sesionValue.clear();
      counter++;
    });
  }

  void savePrompt() {
    // getData();
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
                  Get.offNamed('/');
                },
                child: const Text('No'),
              ),
              ElevatedButton(
                onPressed: () {
                  SessionModel session = SessionModel(
                    exerciseId: null,
                    startTime: _startTime,
                    endTime: DateTime.now().microsecondsSinceEpoch,
                    timelines: [],
                    data: sessionDataItem,
                  );
                  final DateTime strtTime =
                      DateTime.fromMicrosecondsSinceEpoch(_startTime);
                  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');
                  final String formatted = formatter.format(strtTime);
                  logger.i(session);
                  StorageService().saveToJSON(
                      'session/raw/$formatted-${null}-${titleController.text}',
                      session);
                  InternetService().postSession(session);
                  Get.offNamed('/');
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
