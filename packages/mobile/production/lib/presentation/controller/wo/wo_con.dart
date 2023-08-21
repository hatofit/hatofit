import 'dart:isolate';

import 'package:dartz/dartz.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/services/local_storage.dart';
import 'package:hatofit/app/services/polar_service.dart';
import 'package:hatofit/data/models/session.dart';
import 'package:hatofit/domain/usecases/api/sesion/save_session_api_uc.dart';

class WoCon extends GetxController {
  final SaveSessionApiUc _saveSessionApiUc;
  WoCon(this._saveSessionApiUc);
  final store = Get.find<LocalStorageService>();

  ///
  /// General
  ///
  final isWOStart = false.obs;
  final PolarService _pCon = Get.find<PolarService>();

  Future<void> postSession(Session session) async {
    try {
      final token = store.token;
      final res = await _saveSessionApiUc.execute(Tuple2(session, token!));
      res.fold((failure) {
        Get.snackbar(failure.message, failure.details);
      }, (success) {
        Get.snackbar('Success', 'Session saved');
      });
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
    }
  }

  String findElapsed(int first, int last) {
    final DateTime startTime = DateTime.fromMicrosecondsSinceEpoch(first);
    final DateTime endTime = DateTime.fromMicrosecondsSinceEpoch(last);
    final Duration elapsed = endTime.difference(startTime);
    return elapsed.toString().split('.')[0];
  }

  ///
  /// Free Workout
  ///
  Session? session;

  final List<Map<String, dynamic>> hrList = [];
  void add(int time, int hr) {
    hrList.add({'time': time, 'hr': hr});
  }

  void getData() {
    session = _pCon.sessMod.value;
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
