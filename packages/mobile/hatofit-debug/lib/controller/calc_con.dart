import 'dart:isolate';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:hatofit/models/streaming_model.dart';

import '../utils/calculation.dart';

class CalcCon extends GetxController {
  final hrStats = <HrStats>[
    HrStats(
      minHr: 0,
      maxHr: 0,
      avgHr: 0,
      latestHr: 0,
      hrSpots: [
        const FlSpot(0, 0),
      ],
    ),
  ].obs;
  Future<void> calcHr(StreamingModel sm, int index) async {
    final ReceivePort rp = ReceivePort();
    final Isolate i = await Isolate.spawn(hrCalc, (rp.sendPort, sm),
        debugName: 'hrCalc$index');
    rp.listen(
      (mes) {
        hrStats[index] = mes;
        Future.delayed(const Duration(seconds: 1), () {
          i.kill(priority: Isolate.immediate);
          rp.close();
        });
      },
      cancelOnError: true,
    );
  }

  final accStats = <AccStats>[
    AccStats(
      minAcc: [0, 0, 0],
      maxAcc: [0, 0, 0],
      avgAcc: [0, 0, 0],
      latestAcc: [0, 0, 0],
      accSpots: [
        [const FlSpot(0, 0)],
        [const FlSpot(0, 0)],
        [const FlSpot(0, 0)],
      ],
    ),
  ].obs;
  Future<void> calcAcc(StreamingModel sm, int index) async {
    final ReceivePort rp = ReceivePort();
    final Isolate i = await Isolate.spawn(accCalc, (rp.sendPort, sm),
        debugName: 'accCalc$index');
    rp.listen(
      (mes) {
        accStats[index] = mes;
        Future.delayed(const Duration(seconds: 1), () {
          i.kill(priority: Isolate.immediate);
          rp.close();
        });
      },
      cancelOnError: true,
    );
  }

  final ppgStats = <PpgStats>[
    PpgStats(
      minPpg: [0, 0, 0],
      maxPpg: [0, 0, 0],
      avgPpg: [0, 0, 0],
      latestPpg: [0, 0, 0],
      ppgSpots: [
        [const FlSpot(0, 0)],
        [const FlSpot(0, 0)],
        [const FlSpot(0, 0)],
      ],
    ),
  ].obs;
  Future<void> calcPpg(StreamingModel sm, int index) async {
    final ReceivePort rp = ReceivePort();
    final Isolate i = await Isolate.spawn(ppgCalc, (rp.sendPort, sm),
        debugName: 'ppgCalc$index');
    rp.listen(
      (mes) {
        ppgStats[index] = mes;
        Future.delayed(const Duration(seconds: 1), () {
          i.kill(priority: Isolate.immediate);
          rp.close();
        });
      },
      cancelOnError: true,
    );
  }

  final ppiStats = <PpiStats>[
    PpiStats(
      minPpi: [0, 0, 0],
      maxPpi: [0, 0, 0],
      avgPpi: [0, 0, 0],
      latestPpi: [0, 0, 0],
      ppiSpots: [
        [const FlSpot(0, 0)],
        [const FlSpot(0, 0)],
        [const FlSpot(0, 0)],
      ],
    ),
  ].obs;
  Future<void> calcPpi(StreamingModel sm, int index) async {
    final ReceivePort rp = ReceivePort();
    final Isolate i = await Isolate.spawn(ppiCalc, (rp.sendPort, sm),
        debugName: 'ppiCalc$index');
    rp.listen(
      (mes) {
        ppiStats[index] = mes;
        Future.delayed(const Duration(seconds: 1), () {
          i.kill(priority: Isolate.immediate);
          rp.close();
        });
      },
      cancelOnError: true,
    );
  }

  final gyroStats = <GyroStats>[
    GyroStats(
      minGyro: [0, 0, 0],
      maxGyro: [0, 0, 0],
      avgGyro: [0, 0, 0],
      latestGyro: [0, 0, 0],
      gyroSpots: [
        [const FlSpot(0, 0)],
        [const FlSpot(0, 0)],
        [const FlSpot(0, 0)],
      ],
    ),
  ].obs;
  Future<void> calcGyro(StreamingModel sm, int index) async {
    final ReceivePort rp = ReceivePort();
    final Isolate i = await Isolate.spawn(gyroCalc, (rp.sendPort, sm),
        debugName: 'gyroCalc$index');
    rp.listen(
      (mes) {
        gyroStats[index] = mes;
        Future.delayed(const Duration(seconds: 1), () {
          i.kill(priority: Isolate.immediate);
          rp.close();
        });
      },
      cancelOnError: true,
    );
  }

  final magnStats = <MagnStats>[
    MagnStats(
      minMagn: [0, 0, 0],
      maxMagn: [0, 0, 0],
      avgMagn: [0, 0, 0],
      latestMagn: [0, 0, 0],
      magnSpots: [
        [const FlSpot(0, 0)],
        [const FlSpot(0, 0)],
        [const FlSpot(0, 0)],
      ],
    ),
  ].obs;
  Future<void> calcMagn(StreamingModel sm, int index) async {
    final ReceivePort rp = ReceivePort();
    final Isolate i = await Isolate.spawn(magnCalc, (rp.sendPort, sm),
        debugName: 'magnCalc$index');
    rp.listen(
      (mes) {
        magnStats[index] = mes;
        Future.delayed(const Duration(seconds: 1), () {
          i.kill(priority: Isolate.immediate);
          rp.close();
        });
      },
      cancelOnError: true,
    );
  }

  final ecgStats = <EcgStats>[
    EcgStats(
      minEcg: 0,
      maxEcg: 0,
      avgEcg: 0,
      latestEcg: 0,
      ecgSpots: [const FlSpot(0, 0)],
    ),
  ].obs;
  Future<void> calcEcg(StreamingModel sm, int index) async {
    final ReceivePort rp = ReceivePort();
    final Isolate i = await Isolate.spawn(ecgCalc, (rp.sendPort, sm),
        debugName: 'ecgCalc$index');
    rp.listen(
      (mes) {
        ecgStats[index] = mes;
        Future.delayed(const Duration(seconds: 1), () {
          i.kill(priority: Isolate.immediate);
          rp.close();
        });
      },
      cancelOnError: true,
    );
  }
}

class HrStats {
  final int minHr;
  final int maxHr;
  final int avgHr;
  final int latestHr;
  final List<FlSpot> hrSpots;

  HrStats({
    required this.minHr,
    required this.maxHr,
    required this.avgHr,
    required this.latestHr,
    required this.hrSpots,
  });
}

class AccStats {
  final List<int> minAcc;
  final List<int> maxAcc;
  final List<int> avgAcc;
  final List<int> latestAcc;
  final List<List<FlSpot>> accSpots;

  AccStats({
    required this.minAcc,
    required this.maxAcc,
    required this.avgAcc,
    required this.latestAcc,
    required this.accSpots,
  });
}

class PpgStats {
  final List<int> minPpg;
  final List<int> maxPpg;
  final List<int> avgPpg;
  final List<int> latestPpg;
  final List<List<FlSpot>> ppgSpots;

  PpgStats({
    required this.minPpg,
    required this.maxPpg,
    required this.avgPpg,
    required this.latestPpg,
    required this.ppgSpots,
  });
}

class PpiStats {
  final List<int> minPpi;
  final List<int> maxPpi;
  final List<int> avgPpi;
  final List<int> latestPpi;
  final List<List<FlSpot>> ppiSpots;

  PpiStats({
    required this.minPpi,
    required this.maxPpi,
    required this.avgPpi,
    required this.latestPpi,
    required this.ppiSpots,
  });
}

class GyroStats {
  final List<int> minGyro;
  final List<int> maxGyro;
  final List<int> avgGyro;
  final List<int> latestGyro;
  final List<List<FlSpot>> gyroSpots;

  GyroStats({
    required this.minGyro,
    required this.maxGyro,
    required this.avgGyro,
    required this.latestGyro,
    required this.gyroSpots,
  });
}

class MagnStats {
  final List<int> minMagn;
  final List<int> maxMagn;
  final List<int> avgMagn;
  final List<int> latestMagn;
  final List<List<FlSpot>> magnSpots;

  MagnStats({
    required this.minMagn,
    required this.maxMagn,
    required this.avgMagn,
    required this.latestMagn,
    required this.magnSpots,
  });
}

class EcgStats {
  final int minEcg;
  final int maxEcg;
  final int avgEcg;
  final int latestEcg;
  final List<FlSpot> ecgSpots;

  EcgStats({
    required this.minEcg,
    required this.maxEcg,
    required this.avgEcg,
    required this.latestEcg,
    required this.ecgSpots,
  });
}
