import 'dart:io';
import 'dart:isolate';

import 'package:csv/csv.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';
import 'package:hatofit/controller/calc_con.dart';
import 'package:hatofit/main.dart';
import 'package:hatofit/models/streaming_model.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

void rssiCalc((SendPort, StreamingModel) args) {
  final SendPort sendPort = args.$1;
  final StreamingModel sM = args.$2;
  final List<int> rssiList = sM.rssiData.map((e) => e.rssi).toList();
  RssiStats stats = RssiStats(
    latestRssi: 0,
    minRssi: 0,
    maxRssi: 0,
    avgRssi: 0,
    rssiSpots: [],
  );
  if (sM.rssiData.length > 2) {
    final minRssi = rssiList.reduce((curr, next) => curr < next ? curr : next);
    final maxRssi = rssiList.reduce((curr, next) => curr > next ? curr : next);
    final avgRssi =
        rssiList.reduce((curr, next) => curr + next) ~/ rssiList.length;
    final latestRssi = rssiList.last;
    List<FlSpot> rssiSpots = [];
    if (rssiList.length > 30) {
      rssiSpots = sM.rssiData
          .sublist(sM.rssiData.length - 30)
          .map((e) => FlSpot(e.timestamp.toDouble(), e.rssi.toDouble()))
          .toList();
    } else {
      rssiSpots = sM.rssiData
          .map((e) => FlSpot(e.timestamp.toDouble(), e.rssi.toDouble()))
          .toList();
    }
    stats = RssiStats(
      latestRssi: latestRssi,
      minRssi: minRssi,
      maxRssi: maxRssi,
      avgRssi: avgRssi,
      rssiSpots: rssiSpots,
    );
  } else {
    stats = stats;
  }
  sendPort.send(stats);
}

void hrCalc((SendPort, StreamingModel) args) {
  final SendPort sendPort = args.$1;
  final StreamingModel sM = args.$2;
  final List<int> hrList = sM.hrData.map((e) => e.hr).toList();
  HrStats stats = HrStats(
    latestHr: 0,
    minHr: 0,
    maxHr: 0,
    avgHr: 0,
    hrSpots: [],
  );
  if (sM.hrData.length > 2) {
    final minHr = hrList.reduce((curr, next) => curr < next ? curr : next);
    final maxHr = hrList.reduce((curr, next) => curr > next ? curr : next);
    final avgHr = hrList.reduce((curr, next) => curr + next) ~/ hrList.length;
    final latestHr = hrList.last;
    List<FlSpot> hrSpots = [];
    if (hrList.length > 30) {
      hrSpots = sM.hrData
          .sublist(sM.hrData.length - 30)
          .map((e) => FlSpot(e.timestamp.toDouble(), e.hr.toDouble()))
          .toList();
    } else {
      hrSpots = sM.hrData
          .map((e) => FlSpot(e.timestamp.toDouble(), e.hr.toDouble()))
          .toList();
    }
    stats = HrStats(
      latestHr: latestHr,
      minHr: minHr,
      maxHr: maxHr,
      avgHr: avgHr,
      hrSpots: hrSpots,
    );
  } else {
    stats = stats;
  }
  sendPort.send(stats);
}

void accCalc((SendPort, StreamingModel) args) {
  final SendPort sendPort = args.$1;
  final StreamingModel sM = args.$2;
  final List<List<int>> accList = [
    sM.accData.map((e) => e.x).toList(),
    sM.accData.map((e) => e.y).toList(),
    sM.accData.map((e) => e.z).toList(),
  ];
  AccStats stats = AccStats(
    latestAcc: [0, 0, 0],
    minAcc: [0, 0, 0],
    maxAcc: [0, 0, 0],
    avgAcc: [0, 0, 0],
    accSpots: [],
  );
  if (sM.accData.length > 2) {
    final List<int> minAcc = [
      accList[0].reduce((curr, next) => curr < next ? curr : next),
      accList[1].reduce((curr, next) => curr < next ? curr : next),
      accList[2].reduce((curr, next) => curr < next ? curr : next),
    ];
    final List<int> maxAcc = [
      accList[0].reduce((curr, next) => curr > next ? curr : next),
      accList[1].reduce((curr, next) => curr > next ? curr : next),
      accList[2].reduce((curr, next) => curr > next ? curr : next),
    ];
    final List<int> avgAcc = [
      accList[0].reduce((curr, next) => curr + next) ~/ accList[0].length,
      accList[1].reduce((curr, next) => curr + next) ~/ accList[1].length,
      accList[2].reduce((curr, next) => curr + next) ~/ accList[2].length,
    ];
    final List<int> latestAcc = [
      accList[0].last,
      accList[1].last,
      accList[2].last,
    ];
    final List<List<FlSpot>> accSpots = [];
    if (sM.accData.length > 30) {
      accSpots.add(sM.accData
          .sublist(sM.accData.length - 30)
          .map((e) => FlSpot(e.timestamp.toDouble(), e.x.toDouble()))
          .toList());
      accSpots.add(sM.accData
          .sublist(sM.accData.length - 30)
          .map((e) => FlSpot(e.timestamp.toDouble(), e.y.toDouble()))
          .toList());
      accSpots.add(sM.accData
          .sublist(sM.accData.length - 30)
          .map((e) => FlSpot(e.timestamp.toDouble(), e.z.toDouble()))
          .toList());
    } else {
      accSpots.add(sM.accData
          .map((e) => FlSpot(e.timestamp.toDouble(), e.x.toDouble()))
          .toList());
      accSpots.add(sM.accData
          .map((e) => FlSpot(e.timestamp.toDouble(), e.y.toDouble()))
          .toList());
      accSpots.add(sM.accData
          .map((e) => FlSpot(e.timestamp.toDouble(), e.z.toDouble()))
          .toList());
    }
    stats = AccStats(
      latestAcc: latestAcc,
      minAcc: minAcc,
      maxAcc: maxAcc,
      avgAcc: avgAcc,
      accSpots: accSpots,
    );
  } else {
    stats = stats;
  }
  sendPort.send(stats);
}

void ppgCalc((SendPort, StreamingModel) args) {
  final SendPort sendPort = args.$1;
  final StreamingModel sM = args.$2;
  final List<List<int>> ppgList = [
    sM.ppgData.map((e) => e.cS[0]).toList(),
    sM.ppgData.map((e) => e.cS[1]).toList(),
    sM.ppgData.map((e) => e.cS[2]).toList(),
    sM.ppgData.map((e) => e.cS[3]).toList(),
  ];
  PpgStats stats = PpgStats(
    latestPpg: [0, 0, 0, 0],
    minPpg: [0, 0, 0, 0],
    maxPpg: [0, 0, 0, 0],
    avgPpg: [0, 0, 0, 0],
    ppgSpots: [],
  );
  if (sM.ppgData.length > 2) {
    final List<int> minPpg = [
      ppgList[0].reduce((curr, next) => curr < next ? curr : next),
      ppgList[1].reduce((curr, next) => curr < next ? curr : next),
      ppgList[2].reduce((curr, next) => curr < next ? curr : next),
      ppgList[3].reduce((curr, next) => curr < next ? curr : next),
    ];
    final List<int> maxPpg = [
      ppgList[0].reduce((curr, next) => curr > next ? curr : next),
      ppgList[1].reduce((curr, next) => curr > next ? curr : next),
      ppgList[2].reduce((curr, next) => curr > next ? curr : next),
      ppgList[3].reduce((curr, next) => curr > next ? curr : next),
    ];
    final List<int> avgPpg = [
      ppgList[0].reduce((curr, next) => curr + next) ~/ ppgList[0].length,
      ppgList[1].reduce((curr, next) => curr + next) ~/ ppgList[1].length,
      ppgList[2].reduce((curr, next) => curr + next) ~/ ppgList[2].length,
      ppgList[3].reduce((curr, next) => curr + next) ~/ ppgList[3].length,
    ];
    final List<int> latestPpg = [
      ppgList[0].last,
      ppgList[1].last,
      ppgList[2].last,
      ppgList[3].last,
    ];
    final List<List<FlSpot>> ppgSpots = [];
    if (sM.ppgData.length > 30) {
      ppgSpots.add(sM.ppgData
          .sublist(sM.ppgData.length - 30)
          .map((e) => FlSpot(e.tS.toDouble(), e.cS[0].toDouble()))
          .toList());
      ppgSpots.add(sM.ppgData
          .sublist(sM.ppgData.length - 30)
          .map((e) => FlSpot(e.tS.toDouble(), e.cS[1].toDouble()))
          .toList());
      ppgSpots.add(sM.ppgData
          .sublist(sM.ppgData.length - 30)
          .map((e) => FlSpot(e.tS.toDouble(), e.cS[2].toDouble()))
          .toList());
      ppgSpots.add(sM.ppgData
          .sublist(sM.ppgData.length - 30)
          .map((e) => FlSpot(e.tS.toDouble(), e.cS[3].toDouble()))
          .toList());
    } else {
      ppgSpots.add(sM.ppgData
          .map((e) => FlSpot(e.tS.toDouble(), e.cS[0].toDouble()))
          .toList());
      ppgSpots.add(sM.ppgData
          .map((e) => FlSpot(e.tS.toDouble(), e.cS[1].toDouble()))
          .toList());
      ppgSpots.add(sM.ppgData
          .map((e) => FlSpot(e.tS.toDouble(), e.cS[2].toDouble()))
          .toList());
      ppgSpots.add(sM.ppgData
          .map((e) => FlSpot(e.tS.toDouble(), e.cS[3].toDouble()))
          .toList());
    }
    stats = PpgStats(
      latestPpg: latestPpg,
      minPpg: minPpg,
      maxPpg: maxPpg,
      avgPpg: avgPpg,
      ppgSpots: ppgSpots,
    );
  } else {
    stats = stats;
  }
  sendPort.send(stats);
}

void ppiCalc((SendPort, StreamingModel) args) {
  final SendPort sendPort = args.$1;
  final StreamingModel sM = args.$2;
  final List<List<int>> ppiList = [
    sM.ppiData.map((e) => e.ppi).toList(),
    sM.ppiData.map((e) => e.errorEstimate).toList(),
    sM.ppiData.map((e) => e.hr).toList(),
  ];
  PpiStats stats = PpiStats(
    latestPpi: [0, 0, 0],
    minPpi: [0, 0, 0],
    maxPpi: [0, 0, 0],
    avgPpi: [0, 0, 0],
    ppiSpots: [],
  );
  if (sM.ppiData.length > 2) {
    final List<int> minPpi = [
      ppiList[0].reduce((curr, next) => curr < next ? curr : next),
      ppiList[1].reduce((curr, next) => curr < next ? curr : next),
      ppiList[2].reduce((curr, next) => curr < next ? curr : next),
    ];
    final List<int> maxPpi = [
      ppiList[0].reduce((curr, next) => curr > next ? curr : next),
      ppiList[1].reduce((curr, next) => curr > next ? curr : next),
      ppiList[2].reduce((curr, next) => curr > next ? curr : next),
    ];
    final List<int> avgPpi = [
      ppiList[0].reduce((curr, next) => curr + next) ~/ ppiList[0].length,
      ppiList[1].reduce((curr, next) => curr + next) ~/ ppiList[1].length,
      ppiList[2].reduce((curr, next) => curr + next) ~/ ppiList[2].length,
    ];
    final List<int> latestPpi = [
      ppiList[0].last,
      ppiList[1].last,
      ppiList[2].last,
    ];
    final List<List<FlSpot>> ppiSpots = [];
    if (sM.ppiData.length > 30) {
      ppiSpots.add(sM.ppiData
          .sublist(sM.ppiData.length - 30)
          .map((e) => FlSpot(e.tS.toDouble(), e.ppi.toDouble()))
          .toList());
      ppiSpots.add(sM.ppiData
          .sublist(sM.ppiData.length - 30)
          .map((e) => FlSpot(e.tS.toDouble(), e.errorEstimate.toDouble()))
          .toList());
      ppiSpots.add(sM.ppiData
          .sublist(sM.ppiData.length - 30)
          .map((e) => FlSpot(e.tS.toDouble(), e.hr.toDouble()))
          .toList());
    } else {
      ppiSpots.add(sM.ppiData
          .map((e) => FlSpot(e.tS.toDouble(), e.ppi.toDouble()))
          .toList());
      ppiSpots.add(sM.ppiData
          .map((e) => FlSpot(e.tS.toDouble(), e.errorEstimate.toDouble()))
          .toList());
      ppiSpots.add(sM.ppiData
          .map((e) => FlSpot(e.tS.toDouble(), e.hr.toDouble()))
          .toList());
    }
    stats = PpiStats(
      latestPpi: latestPpi,
      minPpi: minPpi,
      maxPpi: maxPpi,
      avgPpi: avgPpi,
      ppiSpots: ppiSpots,
    );
  } else {
    stats = stats;
  }
  sendPort.send(stats);
}

void gyroCalc((SendPort, StreamingModel) args) {
  final SendPort sendPort = args.$1;
  final StreamingModel sM = args.$2;
  final List<List<double>> gyroList = [
    sM.gyroData.map((e) => e.x).toList(),
    sM.gyroData.map((e) => e.y).toList(),
    sM.gyroData.map((e) => e.z).toList(),
  ];
  GyroStats stats = GyroStats(
    latestGyro: [0, 0, 0],
    minGyro: [0, 0, 0],
    maxGyro: [0, 0, 0],
    avgGyro: [0, 0, 0],
    gyroSpots: [],
  );
  if (sM.gyroData.length > 2) {
    final List<int> minGyro = [
      gyroList[0].reduce((curr, next) => curr < next ? curr : next).toInt(),
      gyroList[1].reduce((curr, next) => curr < next ? curr : next).toInt(),
      gyroList[2].reduce((curr, next) => curr < next ? curr : next).toInt(),
    ];
    final List<int> maxGyro = [
      gyroList[0].reduce((curr, next) => curr > next ? curr : next).toInt(),
      gyroList[1].reduce((curr, next) => curr > next ? curr : next).toInt(),
      gyroList[2].reduce((curr, next) => curr > next ? curr : next).toInt(),
    ];
    final List<int> avgGyro = [
      gyroList[0].reduce((curr, next) => curr + next).toInt() ~/
          gyroList[0].length,
      gyroList[1].reduce((curr, next) => curr + next).toInt() ~/
          gyroList[1].length,
      gyroList[2].reduce((curr, next) => curr + next).toInt() ~/
          gyroList[2].length,
    ];
    final List<int> latestGyro = [
      gyroList[0].last.toInt(),
      gyroList[1].last.toInt(),
      gyroList[2].last.toInt(),
    ];
    final List<List<FlSpot>> gyroSpots = [];
    if (sM.gyroData.length > 30) {
      gyroSpots.add(sM.gyroData
          .sublist(sM.gyroData.length - 30)
          .map((e) => FlSpot(e.tS.toDouble(), e.x.toDouble()))
          .toList());
      gyroSpots.add(sM.gyroData
          .sublist(sM.gyroData.length - 30)
          .map((e) => FlSpot(e.tS.toDouble(), e.y.toDouble()))
          .toList());
      gyroSpots.add(sM.gyroData
          .sublist(sM.gyroData.length - 30)
          .map((e) => FlSpot(e.tS.toDouble(), e.z.toDouble()))
          .toList());
    } else {
      gyroSpots.add(sM.gyroData
          .map((e) => FlSpot(e.tS.toDouble(), e.x.toDouble()))
          .toList());
      gyroSpots.add(sM.gyroData
          .map((e) => FlSpot(e.tS.toDouble(), e.y.toDouble()))
          .toList());
      gyroSpots.add(sM.gyroData
          .map((e) => FlSpot(e.tS.toDouble(), e.z.toDouble()))
          .toList());
    }
    stats = GyroStats(
      latestGyro: latestGyro,
      minGyro: minGyro,
      maxGyro: maxGyro,
      avgGyro: avgGyro,
      gyroSpots: gyroSpots,
    );
  } else {
    stats = stats;
  }
  sendPort.send(stats);
}

void magnCalc((SendPort, StreamingModel) args) {
  final SendPort sendPort = args.$1;
  final StreamingModel sM = args.$2;
  final List<List<double>> magnList = [
    sM.magnData.map((e) => e.x).toList(),
    sM.magnData.map((e) => e.y).toList(),
    sM.magnData.map((e) => e.z).toList(),
  ];
  MagnStats stats = MagnStats(
    latestMagn: [0, 0, 0],
    minMagn: [0, 0, 0],
    maxMagn: [0, 0, 0],
    avgMagn: [0, 0, 0],
    magnSpots: [],
  );
  if (sM.magnData.length > 2) {
    final List<int> minMagn = [
      magnList[0].reduce((curr, next) => curr < next ? curr : next).toInt(),
      magnList[1].reduce((curr, next) => curr < next ? curr : next).toInt(),
      magnList[2].reduce((curr, next) => curr < next ? curr : next).toInt(),
    ];
    final List<int> maxMagn = [
      magnList[0].reduce((curr, next) => curr > next ? curr : next).toInt(),
      magnList[1].reduce((curr, next) => curr > next ? curr : next).toInt(),
      magnList[2].reduce((curr, next) => curr > next ? curr : next).toInt(),
    ];
    final List<int> avgMagn = [
      magnList[0].reduce((curr, next) => curr + next).toInt() ~/
          magnList[0].length,
      magnList[1].reduce((curr, next) => curr + next).toInt() ~/
          magnList[1].length,
      magnList[2].reduce((curr, next) => curr + next).toInt() ~/
          magnList[2].length,
    ];
    final List<int> latestMagn = [
      magnList[0].last.toInt(),
      magnList[1].last.toInt(),
      magnList[2].last.toInt(),
    ];
    final List<List<FlSpot>> magnSpots = [];
    if (sM.magnData.length > 30) {
      magnSpots.add(sM.magnData
          .sublist(sM.magnData.length - 30)
          .map((e) => FlSpot(e.tS.toDouble(), e.x.toDouble()))
          .toList());
      magnSpots.add(sM.magnData
          .sublist(sM.magnData.length - 30)
          .map((e) => FlSpot(e.tS.toDouble(), e.y.toDouble()))
          .toList());
      magnSpots.add(sM.magnData
          .sublist(sM.magnData.length - 30)
          .map((e) => FlSpot(e.tS.toDouble(), e.z.toDouble()))
          .toList());
    } else {
      magnSpots.add(sM.magnData
          .map((e) => FlSpot(e.tS.toDouble(), e.x.toDouble()))
          .toList());
      magnSpots.add(sM.magnData
          .map((e) => FlSpot(e.tS.toDouble(), e.y.toDouble()))
          .toList());
      magnSpots.add(sM.magnData
          .map((e) => FlSpot(e.tS.toDouble(), e.z.toDouble()))
          .toList());
    }
    stats = MagnStats(
      latestMagn: latestMagn,
      minMagn: minMagn,
      maxMagn: maxMagn,
      avgMagn: avgMagn,
      magnSpots: magnSpots,
    );
  } else {
    stats = stats;
  }
  sendPort.send(stats);
}

void ecgCalc((SendPort, StreamingModel) args) {
  final SendPort sendPort = args.$1;
  final StreamingModel sM = args.$2;
  final List<int> ecgList = sM.ecgData.map((e) => e.voltage).toList();
  EcgStats stats =
      EcgStats(latestEcg: 0, minEcg: 0, maxEcg: 0, avgEcg: 0, ecgSpots: []);

  if (sM.ecgData.length > 2) {
    final int minEcg =
        ecgList.reduce((curr, next) => curr < next ? curr : next);
    final int maxEcg =
        ecgList.reduce((curr, next) => curr > next ? curr : next);
    final int avgEcg =
        ecgList.reduce((curr, next) => curr + next) ~/ ecgList.length;
    final int latestEcg = ecgList.last;
    List<FlSpot> ecgSpots = [];
    if (sM.ecgData.length > 30) {
      ecgSpots = sM.ecgData
          .sublist(sM.ecgData.length - 30)
          .map((e) => FlSpot(e.tS.toDouble(), e.voltage.toDouble()))
          .toList();
    } else {
      ecgSpots = sM.ecgData
          .map((e) => FlSpot(e.tS.toDouble(), e.voltage.toDouble()))
          .toList();
    }
    stats = EcgStats(
      latestEcg: latestEcg,
      minEcg: minEcg,
      maxEcg: maxEcg,
      avgEcg: avgEcg,
      ecgSpots: ecgSpots,
    );
  } else {
    stats = stats;
  }
  sendPort.send(stats);
}

void svToLocal(
    (
      SendPort,
      StreamingModel,
      String,
      RootIsolateToken,
      int,
    ) args) async {
  logger.e('Data : ${args.$2.toJson()}');
  final RootIsolateToken iT = args.$4;
  BackgroundIsolateBinaryMessenger.ensureInitialized(iT);
  final SendPort sendPort = args.$1;
  final StreamingModel streamingModel = args.$2;
  final String name = args.$3;
  final int distance = args.$5;
  final DateTime now = DateTime.now();
  final String date = DateFormat('yyyy-MM-dd HH:mm').format(now);
  final Directory? dir = await getExternalStorageDirectory();

  final List<List<dynamic>> csv = [];
  final int maxLength = [
    streamingModel.hrData.length,
    streamingModel.accData.length,
    streamingModel.ppgData.length,
    streamingModel.ppiData.length,
    streamingModel.gyroData.length,
    streamingModel.magnData.length,
    streamingModel.ecgData.length,
  ].reduce((curr, next) => curr > next ? curr : next);
  logger.e('Raw : ${streamingModel.toJson()}');
  csv.add(['Time Stamp', 'Distance', 'RSSI', '']);
  for (int i = 0; i < maxLength; i++) {
    if (i < streamingModel.hrData.length) {
      csv.add([
        DateTime.fromMicrosecondsSinceEpoch(
          streamingModel.rssiData[i].timestamp,
        ),
        distance,
        streamingModel.rssiData[i].rssi,
        '',
      ]);
    } else {
      csv.add(['', '', '', '']);
    }
  }

  if (streamingModel.hrData.isNotEmpty) {
    if (streamingModel.hrData.last.rrsMs.isEmpty) {
      csv[0].add('Time Stamp');
      csv[0].add('BPM');
      csv[0].add('');
      for (int i = 0; i < maxLength; i++) {
        if (i < streamingModel.hrData.length) {
          csv[i + 1].add(
            DateTime.fromMicrosecondsSinceEpoch(
                streamingModel.hrData[i].timestamp),
          );
          csv[i + 1].add(streamingModel.hrData[i].hr);
          csv[i + 1].add('');
        } else {
          csv[i + 1].add('');
          csv[i + 1].add('');
          csv[i + 1].add('');
        }
      }
    } else {
      csv[0].add('Time Stamp');
      csv[0].add('BPM');
      csv[0].add('RRSMS');
      csv[0].add('');
      csv[0].add('');
      for (int i = 0; i < maxLength; i++) {
        if (i < streamingModel.hrData.length) {
          csv[i + 1].add(
            DateTime.fromMicrosecondsSinceEpoch(
                streamingModel.hrData[i].timestamp),
          );
          csv[i + 1].add(streamingModel.hrData[i].hr);
          // csv[i + 1].add(streamingModel.hrData[i].rrsMs[0]);
          // csv[i + 1].add(streamingModel.hrData[i].rrsMs[1]);
          csv[i + 1].add('');
        } else {
          csv[i + 1].add('');
          csv[i + 1].add('');
          csv[i + 1].add('');
          // csv[i + 1].add('');
          // csv[i + 1].add('');
        }
      }
    }
  }

  if (streamingModel.accData.isNotEmpty) {
    csv[0].add('Time Stamp');
    csv[0].add('X');
    csv[0].add('Y');
    csv[0].add('Z');
    csv[0].add('');
    for (int i = 0; i < maxLength; i++) {
      if (i < streamingModel.accData.length) {
        csv[i + 1].add(
          DateTime.fromMicrosecondsSinceEpoch(
              streamingModel.accData[i].timestamp),
        );
        csv[i + 1].add(streamingModel.accData[i].x);
        csv[i + 1].add(streamingModel.accData[i].y);
        csv[i + 1].add(streamingModel.accData[i].z);
        csv[i + 1].add('');
      } else {
        csv[i + 1].add('');
        csv[i + 1].add('');
        csv[i + 1].add('');
        csv[i + 1].add('');
        csv[i + 1].add('');
      }
    }
  }

  if (streamingModel.ppgData.isNotEmpty) {
    csv[0].add('Time Stamp');
    csv[0].add('Channel 1');
    csv[0].add('Channel 2');
    csv[0].add('Channel 3');
    csv[0].add('Channel 4');
    csv[0].add('');
    for (int i = 0; i < maxLength; i++) {
      if (i < streamingModel.ppgData.length) {
        csv[i + 1].add(
          DateTime.fromMicrosecondsSinceEpoch(streamingModel.ppgData[i].tS),
        );
        csv[i + 1].add(streamingModel.ppgData[i].cS[0]);
        csv[i + 1].add(streamingModel.ppgData[i].cS[1]);
        csv[i + 1].add(streamingModel.ppgData[i].cS[2]);
        csv[i + 1].add(streamingModel.ppgData[i].cS[3]);
        csv[i + 1].add('');
      } else {
        csv[i + 1].add('');
        csv[i + 1].add('');
        csv[i + 1].add('');
        csv[i + 1].add('');
        csv[i + 1].add('');
        csv[i + 1].add('');
      }
    }
  }

  if (streamingModel.ppiData.isNotEmpty) {
    csv[0].add('Time Stamp');
    csv[0].add('PPI');
    csv[0].add('Error Estimate');
    csv[0].add('BPM');
    csv[0].add('');
    for (int i = 0; i < maxLength; i++) {
      if (i < streamingModel.ppiData.length) {
        csv[i + 1].add(
          DateTime.fromMicrosecondsSinceEpoch(streamingModel.ppiData[i].tS),
        );
        csv[i + 1].add(streamingModel.ppiData[i].ppi);
        csv[i + 1].add(streamingModel.ppiData[i].errorEstimate);
        csv[i + 1].add(streamingModel.ppiData[i].hr);
        csv[i + 1].add('');
      } else {
        csv[i + 1].add('');
        csv[i + 1].add('');
        csv[i + 1].add('');
        csv[i + 1].add('');
        csv[i + 1].add('');
      }
    }
  }

  if (streamingModel.gyroData.isNotEmpty) {
    csv[0].add('Time Stamp');
    csv[0].add('X');
    csv[0].add('Y');
    csv[0].add('Z');
    csv[0].add('');
    for (int i = 0; i < maxLength; i++) {
      if (i < streamingModel.gyroData.length) {
        csv[i + 1].add(
          DateTime.fromMicrosecondsSinceEpoch(streamingModel.gyroData[i].tS),
        );
        csv[i + 1].add(streamingModel.gyroData[i].x);
        csv[i + 1].add(streamingModel.gyroData[i].y);
        csv[i + 1].add(streamingModel.gyroData[i].z);
        csv[i + 1].add('');
      } else {
        csv[i + 1].add('');
        csv[i + 1].add('');
        csv[i + 1].add('');
        csv[i + 1].add('');
        csv[i + 1].add('');
      }
    }
  }

  if (streamingModel.magnData.isNotEmpty) {
    csv[0].add('Time Stamp');
    csv[0].add('X');
    csv[0].add('Y');
    csv[0].add('Z');
    csv[0].add('');
    for (int i = 0; i < maxLength; i++) {
      if (i < streamingModel.magnData.length) {
        csv[i + 1].add(
          DateTime.fromMicrosecondsSinceEpoch(streamingModel.magnData[i].tS),
        );
        csv[i + 1].add(streamingModel.magnData[i].x);
        csv[i + 1].add(streamingModel.magnData[i].y);
        csv[i + 1].add(streamingModel.magnData[i].z);
        csv[i + 1].add('');
      } else {
        csv[i + 1].add('');
        csv[i + 1].add('');
        csv[i + 1].add('');
        csv[i + 1].add('');
        csv[i + 1].add('');
      }
    }
  }

  if (streamingModel.ecgData.isNotEmpty) {
    csv[0].add('Time Stamp');
    csv[0].add('Voltage');
    csv[0].add('');
    for (int i = 0; i < maxLength; i++) {
      if (i < streamingModel.ecgData.length) {
        csv[i + 1].add(
          DateTime.fromMicrosecondsSinceEpoch(streamingModel.ecgData[i].tS),
        );
        csv[i + 1].add(streamingModel.ecgData[i].voltage);
        csv[i + 1].add('');
      } else {
        csv[i + 1].add('');
        csv[i + 1].add('');
      }
    }
  }
  final File csvFile = File('${dir?.path}/$date-$distance m.csv');
  logger.i('CSV: ${csvFile}');
  logger.i('Path: ${csvFile.path}');
  final csvConverted = const ListToCsvConverter().convert(csv);
  csvFile.writeAsString(csvConverted);

  logger.d('CSV String : ${csvConverted}');

  sendPort.send([
    'Success',
    '${dir?.path}/$date-$name.json',
    '${dir?.path}/$date-$name.csv'
  ]);
}

void svToExcel(
    (
      SendPort,
      StreamingModel,
      String,
      HrStats,
      AccStats,
      PpgStats,
      PpiStats,
      GyroStats,
      MagnStats,
      EcgStats,
      RootIsolateToken,
    ) args) async {
  final RootIsolateToken iT = args.$11;
  BackgroundIsolateBinaryMessenger.ensureInitialized(iT);
  final SendPort sendPort = args.$1;
  final StreamingModel streamingModel = args.$2;
  final String name = args.$3;
  final HrStats hrStats = args.$4;
  final AccStats accStats = args.$5;
  final PpgStats ppgStats = args.$6;
  final PpiStats ppiStats = args.$7;
  final GyroStats gyroStats = args.$8;
  final MagnStats magnStats = args.$9;
  final EcgStats ecgStats = args.$10;

  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
  final String date = formatter.format(now);
  final Workbook workbook = Workbook(8);

  final Worksheet basicSheet = workbook.worksheets[0];
  basicSheet.name = 'Basic Info';
  final Worksheet hrSheet = workbook.worksheets[1];
  hrSheet.name = 'Heart Rate';
  final Worksheet accSheet = workbook.worksheets[2];
  accSheet.name = 'Accelerometer';
  final Worksheet ppgSheet = workbook.worksheets[3];
  ppgSheet.name = 'PPG';
  final Worksheet ppiSheet = workbook.worksheets[4];
  ppiSheet.name = 'PPI';
  final Worksheet gyroSheet = workbook.worksheets[5];
  gyroSheet.name = 'Gyroscope';
  final Worksheet magnSheet = workbook.worksheets[6];
  magnSheet.name = 'Magnetometer';
  final Worksheet ecgSheet = workbook.worksheets[7];
  ecgSheet.name = 'Electrocardiogram';

//basic info
  basicSheet.getRangeByName('A1:B1').merge();
  formatMergedCell(basicSheet, 'A1', 'Phone Data');
  formatCell(basicSheet, 'A2', 'Operating System', '#00a2ff');
  formatCell(basicSheet, 'A3', 'Manufacturer', '#00a2ff');
  formatCell(basicSheet, 'A4', 'Device Type', '#00a2ff');
  formatCell(basicSheet, 'A5', 'Device ID', '#00a2ff');
  formatCell(basicSheet, 'A6', 'Total Cores', '#00a2ff');

  basicSheet.getRangeByName('B2').setText(streamingModel.phoneInfo.os);
  basicSheet
      .getRangeByName('B3')
      .setText(streamingModel.phoneInfo.manufacturer);
  basicSheet.getRangeByName('B4').setText(streamingModel.phoneInfo.type);
  basicSheet.getRangeByName('B5').setText(streamingModel.phoneInfo.deviceId);
  basicSheet
      .getRangeByName('B6')
      .setNumber(streamingModel.phoneInfo.totalProcessors.toDouble());

  basicSheet.getRangeByName('A8:B8').merge();
  formatMergedCell(basicSheet, 'A8', 'Device Data');
  formatCell(basicSheet, 'A9', 'Device Name', '#00a2ff');
  formatCell(basicSheet, 'A10', 'Device ID', '#00a2ff');
  formatCell(basicSheet, 'A11', 'MAC Address', '#00a2ff');

  basicSheet.getRangeByName('B9').setText(streamingModel.polarDeviceInfo.name);
  basicSheet
      .getRangeByName('B10')
      .setText(streamingModel.polarDeviceInfo.deviceId);
  basicSheet
      .getRangeByName('B11')
      .setText(streamingModel.polarDeviceInfo.address);

  //hr data

  if (streamingModel.hrData.isNotEmpty) {
    hrSheet.getRangeByName('A1:D1').merge();
    formatMergedCell(hrSheet, 'A1', 'HR Data');
    formatCell(hrSheet, 'A2', 'Average', '#00a2ff');
    formatCell(hrSheet, 'A3', 'Minimum', '#00a2ff');
    formatCell(hrSheet, 'A4', 'Maximum', '#00a2ff');
    formatCell(hrSheet, 'A5', 'Last', '#00a2ff');

    hrSheet.getRangeByName('B2').setNumber(hrStats.avgHr.toDouble());
    hrSheet.getRangeByName('B3').setNumber(hrStats.minHr.toDouble());
    hrSheet.getRangeByName('B4').setNumber(hrStats.maxHr.toDouble());
    hrSheet.getRangeByName('B5').setNumber(hrStats.latestHr.toDouble());

    hrSheet.getRangeByName('A7:D7').merge();
    formatMergedCell(hrSheet, 'A7', 'Data');
    formatCell(hrSheet, 'A8', 'Time Stamp', '#00a2ff');
    formatCell(hrSheet, 'B8', 'BPM', '#00a2ff');

    for (int i = 0; i < streamingModel.hrData.length; i++) {
      hrSheet.getRangeByName('A${i + 9}').setDateTime(
          DateTime.fromMicrosecondsSinceEpoch(
              streamingModel.hrData[i].timestamp));
      hrSheet
          .getRangeByName('B${i + 9}')
          .setNumber(streamingModel.hrData[i].hr.toDouble());
      if (streamingModel.hrData
          .where((element) => element.rrsMs.isNotEmpty)
          .isNotEmpty) {
        hrSheet.getRangeByName('C8:D8').merge();
        formatCell(hrSheet, 'C8:D8', 'RR', '#00a2ff');
        hrSheet
            .getRangeByName('C${i + 9}')
            .setNumber(streamingModel.hrData[i].rrsMs[0].toDouble());
        hrSheet
            .getRangeByName('D${i + 9}')
            .setNumber(streamingModel.hrData[i].rrsMs[1].toDouble());
      }
    }
    // final ChartCollection hrChartCollection = ChartCollection(hrSheet);
    // final Chart hrChart = hrChartCollection.add();
    // hrChart.chartType = ExcelChartType.line;
    // if (streamingModel.hrData
    //     .where((element) => element.rrsMs.isNotEmpty)
    //     .isEmpty) {
    //   hrChart.dataRange =
    //       hrSheet.getRangeByName('A8:B${streamingModel.hrData.length + 8}');
    // } else {
    //   hrChart.dataRange =
    //       hrSheet.getRangeByName('A8:D${streamingModel.hrData.length + 8}');
    // }
    // hrChart.isSeriesInRows = false;
    // hrChart.chartTitle = 'Heart Rate';
    // hrChart.legend!.position = ExcelLegendPosition.bottom;
    // hrChart.primaryCategoryAxis.title = 'Time';
    // hrChart.primaryCategoryAxis.numberFormat = 'hh:mm:ss';
    // hrChart.primaryValueAxis.title = 'BPM';
    // hrChart.primaryValueAxis.numberFormat = '0';
    // hrChart.primaryValueAxis.maximumValue = 220;
    // hrChart.primaryValueAxis.minimumValue = 0;

    // hrChart.topRow = 1;
    // hrChart.bottomRow = 30;
    // hrChart.leftColumn = 5;
    // hrChart.rightColumn = 20;

    // hrSheet.charts = hrChartCollection;
  }

  //acc data

  if (streamingModel.accData.isNotEmpty) {
    accSheet.getRangeByName('A1:D1').merge();
    formatMergedCell(accSheet, 'A1', 'Accelerometer Data');
    formatCell(accSheet, 'A3', 'Average', '#00a2ff');
    formatCell(accSheet, 'A4', 'Minimum', '#00a2ff');
    formatCell(accSheet, 'A5', 'Maximum', '#00a2ff');
    formatCell(accSheet, 'A6', 'Last', '#00a2ff');
    formatCell(accSheet, 'B2', 'X', '#00a2ff');
    formatCell(accSheet, 'C2', 'Y', '#00a2ff');
    formatCell(accSheet, 'D2', 'Z', '#00a2ff');

    accSheet.getRangeByName('B3').setNumber(accStats.avgAcc[0].toDouble());
    accSheet.getRangeByName('C3').setNumber(accStats.avgAcc[1].toDouble());
    accSheet.getRangeByName('D3').setNumber(accStats.avgAcc[2].toDouble());
    accSheet.getRangeByName('B4').setNumber(accStats.minAcc[0].toDouble());
    accSheet.getRangeByName('C4').setNumber(accStats.minAcc[1].toDouble());
    accSheet.getRangeByName('D4').setNumber(accStats.minAcc[2].toDouble());
    accSheet.getRangeByName('B5').setNumber(accStats.maxAcc[0].toDouble());
    accSheet.getRangeByName('C5').setNumber(accStats.maxAcc[1].toDouble());
    accSheet.getRangeByName('D5').setNumber(accStats.maxAcc[2].toDouble());
    accSheet.getRangeByName('B6').setNumber(accStats.latestAcc[0].toDouble());
    accSheet.getRangeByName('C6').setNumber(accStats.latestAcc[1].toDouble());
    accSheet.getRangeByName('D6').setNumber(accStats.latestAcc[2].toDouble());

    accSheet.getRangeByName('A8:D8').merge();
    formatMergedCell(accSheet, 'A8', 'Data');
    formatCell(accSheet, 'A9', 'Time Stamp', '#00a2ff');
    formatCell(accSheet, 'B9', 'X', '#00a2ff');
    formatCell(accSheet, 'C9', 'Y', '#00a2ff');
    formatCell(accSheet, 'D9', 'Z', '#00a2ff');

    for (int i = 0; i < streamingModel.accData.length; i++) {
      accSheet.getRangeByName('A${i + 10}').setDateTime(
          DateTime.fromMicrosecondsSinceEpoch(
              streamingModel.accData[i].timestamp));
      accSheet
          .getRangeByName('B${i + 10}')
          .setNumber(streamingModel.accData[i].x.toDouble());
      accSheet
          .getRangeByName('C${i + 10}')
          .setNumber(streamingModel.accData[i].y.toDouble());
      accSheet
          .getRangeByName('D${i + 10}')
          .setNumber(streamingModel.accData[i].z.toDouble());
    }

    // final ChartCollection accChartCollection = ChartCollection(accSheet);
    // final Chart accChart = accChartCollection.add();
    // accChart.chartType = ExcelChartType.line;
    // accChart.dataRange =
    //     accSheet.getRangeByName('A9:D${streamingModel.accData.length + 9}');
    // accChart.isSeriesInRows = false;
    // accChart.chartTitle = 'Accelerometer';
    // accChart.legend!.position = ExcelLegendPosition.bottom;
    // accChart.primaryCategoryAxis.title = 'Time';
    // accChart.primaryCategoryAxis.numberFormat = 'hh:mm:ss';
    // accChart.primaryValueAxis.title = 'Data';
    // accChart.primaryValueAxis.numberFormat = '0';

    // accChart.topRow = 1;
    // accChart.bottomRow = 30;
    // accChart.leftColumn = 5;
    // accChart.rightColumn = 20;

    // accSheet.charts = accChartCollection;
  }

  //ppg data

  if (streamingModel.ppgData.isNotEmpty) {
    ppgSheet.getRangeByName('A1:D1').merge();
    formatMergedCell(ppgSheet, 'A1', 'PPG Data');
    formatCell(ppgSheet, 'A3', 'Average', '#00a2ff');
    formatCell(ppgSheet, 'A4', 'Minimum', '#00a2ff');
    formatCell(ppgSheet, 'A5', 'Maximum', '#00a2ff');
    formatCell(ppgSheet, 'A6', 'Last', '#00a2ff');
    formatCell(ppgSheet, 'B2', 'Red', '#00a2ff');
    formatCell(ppgSheet, 'C2', 'IR', '#00a2ff');
    formatCell(ppgSheet, 'D2', 'Green', '#00a2ff');

    ppgSheet.getRangeByName('B3').setNumber(ppgStats.avgPpg[0].toDouble());
    ppgSheet.getRangeByName('C3').setNumber(ppgStats.avgPpg[1].toDouble());
    ppgSheet.getRangeByName('D3').setNumber(ppgStats.avgPpg[2].toDouble());
    ppgSheet.getRangeByName('B4').setNumber(ppgStats.minPpg[0].toDouble());
    ppgSheet.getRangeByName('C4').setNumber(ppgStats.minPpg[1].toDouble());
    ppgSheet.getRangeByName('D4').setNumber(ppgStats.minPpg[2].toDouble());
    ppgSheet.getRangeByName('B5').setNumber(ppgStats.maxPpg[0].toDouble());
    ppgSheet.getRangeByName('C5').setNumber(ppgStats.maxPpg[1].toDouble());
    ppgSheet.getRangeByName('D5').setNumber(ppgStats.maxPpg[2].toDouble());
    ppgSheet.getRangeByName('B6').setNumber(ppgStats.latestPpg[0].toDouble());
    ppgSheet.getRangeByName('C6').setNumber(ppgStats.latestPpg[1].toDouble());
    ppgSheet.getRangeByName('D6').setNumber(ppgStats.latestPpg[2].toDouble());

    ppgSheet.getRangeByName('A8:D8').merge();
    formatMergedCell(ppgSheet, 'A8', 'Data');
    formatCell(ppgSheet, 'A9', 'Time Stamp', '#00a2ff');
    formatCell(ppgSheet, 'B9', 'Red', '#00a2ff');
    formatCell(ppgSheet, 'C9', 'IR', '#00a2ff');
    formatCell(ppgSheet, 'D9', 'Green', '#00a2ff');

    for (int i = 0; i < streamingModel.ppgData.length; i++) {
      ppgSheet.getRangeByName('A${i + 10}').setDateTime(
          DateTime.fromMicrosecondsSinceEpoch(streamingModel.ppgData[i].tS));
      ppgSheet
          .getRangeByName('B${i + 10}')
          .setNumber(streamingModel.ppgData[i].cS[0].toDouble());
      ppgSheet
          .getRangeByName('C${i + 10}')
          .setNumber(streamingModel.ppgData[i].cS[1].toDouble());
      ppgSheet
          .getRangeByName('D${i + 10}')
          .setNumber(streamingModel.ppgData[i].cS[2].toDouble());
    }

    // final ChartCollection ppgChartCollection = ChartCollection(ppgSheet);
    // final Chart ppgChart = ppgChartCollection.add();
    // ppgChart.chartType = ExcelChartType.line;
    // ppgChart.dataRange =
    //     ppgSheet.getRangeByName('A9:D${streamingModel.ppgData.length + 9}');
    // ppgChart.isSeriesInRows = false;
    // ppgChart.chartTitle = 'PPG';
    // ppgChart.legend!.position = ExcelLegendPosition.bottom;
    // ppgChart.primaryCategoryAxis.title = 'Time';
    // ppgChart.primaryCategoryAxis.numberFormat = 'hh:mm:ss';
    // ppgChart.primaryValueAxis.title = 'Data';
    // ppgChart.primaryValueAxis.numberFormat = '0';

    // ppgChart.topRow = 1;
    // ppgChart.bottomRow = 30;
    // ppgChart.leftColumn = 5;
    // ppgChart.rightColumn = 20;

    // ppgSheet.charts = ppgChartCollection;
  }

  //ppi data

  if (streamingModel.ppiData.isNotEmpty) {
    ppiSheet.getRangeByName('A1:D1').merge();
    formatMergedCell(ppiSheet, 'A1', 'PPI Data');
    formatCell(ppiSheet, 'A3', 'Average', '#00a2ff');
    formatCell(ppiSheet, 'A4', 'Minimum', '#00a2ff');
    formatCell(ppiSheet, 'A5', 'Maximum', '#00a2ff');
    formatCell(ppiSheet, 'A6', 'Last', '#00a2ff');
    formatCell(ppiSheet, 'B2', 'Ppi', '#00a2ff');
    formatCell(ppiSheet, 'C2', 'Error Estimation', '#00a2ff');
    formatCell(ppiSheet, 'D2', 'Heart Rate', '#00a2ff');

    ppiSheet.getRangeByName('B3').setNumber(ppiStats.avgPpi[0].toDouble());
    ppiSheet.getRangeByName('C3').setNumber(ppiStats.avgPpi[1].toDouble());
    ppiSheet.getRangeByName('D3').setNumber(ppiStats.avgPpi[2].toDouble());
    ppiSheet.getRangeByName('B4').setNumber(ppiStats.minPpi[0].toDouble());
    ppiSheet.getRangeByName('C4').setNumber(ppiStats.minPpi[1].toDouble());
    ppiSheet.getRangeByName('D4').setNumber(ppiStats.minPpi[2].toDouble());
    ppiSheet.getRangeByName('B5').setNumber(ppiStats.maxPpi[0].toDouble());
    ppiSheet.getRangeByName('C5').setNumber(ppiStats.maxPpi[1].toDouble());
    ppiSheet.getRangeByName('D5').setNumber(ppiStats.maxPpi[2].toDouble());
    ppiSheet.getRangeByName('B6').setNumber(ppiStats.latestPpi[0].toDouble());
    ppiSheet.getRangeByName('C6').setNumber(ppiStats.latestPpi[1].toDouble());
    ppiSheet.getRangeByName('D6').setNumber(ppiStats.latestPpi[2].toDouble());

    ppiSheet.getRangeByName('A8:D8').merge();
    formatMergedCell(ppiSheet, 'A8', 'Data');
    formatCell(ppiSheet, 'A9', 'Time Stamp', '#00a2ff');
    formatCell(ppiSheet, 'B9', 'PPI', '#00a2ff');
    formatCell(ppiSheet, 'C9', 'Error Estimation', '#00a2ff');
    formatCell(ppiSheet, 'D9', 'Heart Rate', '#00a2ff');

    for (int i = 0; i < streamingModel.ppiData.length; i++) {
      ppiSheet.getRangeByName('A${i + 10}').setDateTime(
          DateTime.fromMicrosecondsSinceEpoch(streamingModel.ppiData[i].tS));
      ppiSheet
          .getRangeByName('B${i + 10}')
          .setNumber(streamingModel.ppiData[i].ppi.toDouble());
      ppiSheet
          .getRangeByName('C${i + 10}')
          .setNumber(streamingModel.ppiData[i].errorEstimate.toDouble());
      ppiSheet
          .getRangeByName('D${i + 10}')
          .setNumber(streamingModel.ppiData[i].hr.toDouble());
    }

    // final ChartCollection ppiChartCollection = ChartCollection(ppiSheet);
    // final Chart ppiChart = ppiChartCollection.add();
    // ppiChart.chartType = ExcelChartType.line;
    // ppiChart.dataRange =
    //     ppiSheet.getRangeByName('A9:D${streamingModel.ppiData.length + 9}');
    // ppiChart.isSeriesInRows = false;
    // ppiChart.chartTitle = 'PPI';
    // ppiChart.legend!.position = ExcelLegendPosition.bottom;
    // ppiChart.primaryCategoryAxis.title = 'Time';
    // ppiChart.primaryCategoryAxis.numberFormat = 'hh:mm:ss';
    // ppiChart.primaryValueAxis.title = 'Data';
    // ppiChart.primaryValueAxis.numberFormat = '0';

    // ppiChart.topRow = 1;
    // ppiChart.bottomRow = 30;
    // ppiChart.leftColumn = 5;
    // ppiChart.rightColumn = 20;

    // ppiSheet.charts = ppiChartCollection;
  }

  //gyro data

  if (streamingModel.gyroData.isNotEmpty) {
    gyroSheet.getRangeByName('A1:D1').merge();
    formatMergedCell(gyroSheet, 'A1', 'Gyro Data');
    formatCell(gyroSheet, 'A3', 'Average', '#00a2ff');
    formatCell(gyroSheet, 'A4', 'Minimum', '#00a2ff');
    formatCell(gyroSheet, 'A5', 'Maximum', '#00a2ff');
    formatCell(gyroSheet, 'A6', 'Last', '#00a2ff');
    formatCell(gyroSheet, 'B2', 'X', '#00a2ff');
    formatCell(gyroSheet, 'C2', 'Y', '#00a2ff');
    formatCell(gyroSheet, 'D2', 'Z', '#00a2ff');

    gyroSheet.getRangeByName('B3').setNumber(gyroStats.avgGyro[0].toDouble());
    gyroSheet.getRangeByName('C3').setNumber(gyroStats.avgGyro[1].toDouble());
    gyroSheet.getRangeByName('D3').setNumber(gyroStats.avgGyro[2].toDouble());
    gyroSheet.getRangeByName('B4').setNumber(gyroStats.minGyro[0].toDouble());
    gyroSheet.getRangeByName('C4').setNumber(gyroStats.minGyro[1].toDouble());
    gyroSheet.getRangeByName('D4').setNumber(gyroStats.minGyro[2].toDouble());
    gyroSheet.getRangeByName('B5').setNumber(gyroStats.maxGyro[0].toDouble());
    gyroSheet.getRangeByName('C5').setNumber(gyroStats.maxGyro[1].toDouble());
    gyroSheet.getRangeByName('D5').setNumber(gyroStats.maxGyro[2].toDouble());
    gyroSheet
        .getRangeByName('B6')
        .setNumber(gyroStats.latestGyro[0].toDouble());
    gyroSheet
        .getRangeByName('C6')
        .setNumber(gyroStats.latestGyro[1].toDouble());
    gyroSheet
        .getRangeByName('D6')
        .setNumber(gyroStats.latestGyro[2].toDouble());

    gyroSheet.getRangeByName('A8:D8').merge();
    formatMergedCell(gyroSheet, 'A8', 'Data');
    formatCell(gyroSheet, 'A9', 'Time Stamp', '#00a2ff');
    formatCell(gyroSheet, 'B9', 'X', '#00a2ff');
    formatCell(gyroSheet, 'C9', 'Y', '#00a2ff');
    formatCell(gyroSheet, 'D9', 'Z', '#00a2ff');

    for (int i = 0; i < streamingModel.gyroData.length; i++) {
      gyroSheet.getRangeByName('A${i + 10}').setDateTime(
          DateTime.fromMicrosecondsSinceEpoch(streamingModel.gyroData[i].tS));
      gyroSheet
          .getRangeByName('B${i + 10}')
          .setNumber(streamingModel.gyroData[i].x.toDouble());
      gyroSheet
          .getRangeByName('C${i + 10}')
          .setNumber(streamingModel.gyroData[i].y.toDouble());
      gyroSheet
          .getRangeByName('D${i + 10}')
          .setNumber(streamingModel.gyroData[i].z.toDouble());
    }

    // final ChartCollection gyroChartCollection = ChartCollection(gyroSheet);
    // final Chart gyroChart = gyroChartCollection.add();
    // gyroChart.chartType = ExcelChartType.line;
    // gyroChart.dataRange =
    //     gyroSheet.getRangeByName('A9:D${streamingModel.gyroData.length + 9}');
    // gyroChart.isSeriesInRows = false;
    // gyroChart.chartTitle = 'Gyro';
    // gyroChart.legend!.position = ExcelLegendPosition.bottom;
    // gyroChart.primaryCategoryAxis.title = 'Time';
    // gyroChart.primaryCategoryAxis.numberFormat = 'hh:mm:ss';
    // gyroChart.primaryValueAxis.title = 'Data';
    // gyroChart.primaryValueAxis.numberFormat = '0';

    // gyroChart.topRow = 1;
    // gyroChart.bottomRow = 30;
    // gyroChart.leftColumn = 5;
    // gyroChart.rightColumn = 20;

    // gyroSheet.charts = gyroChartCollection;
  }

  //magnetometer data
  if (streamingModel.magnData.isNotEmpty) {
    magnSheet.getRangeByName('A1:D1').merge();
    formatMergedCell(magnSheet, 'A1', 'Magnetometer Data');
    formatCell(magnSheet, 'A3', 'Average', '#00a2ff');
    formatCell(magnSheet, 'A4', 'Minimum', '#00a2ff');
    formatCell(magnSheet, 'A5', 'Maximum', '#00a2ff');
    formatCell(magnSheet, 'A6', 'Last', '#00a2ff');
    formatCell(magnSheet, 'B2', 'X', '#00a2ff');
    formatCell(magnSheet, 'C2', 'Y', '#00a2ff');
    formatCell(magnSheet, 'D2', 'Z', '#00a2ff');

    magnSheet.getRangeByName('B3').setNumber(magnStats.avgMagn[0].toDouble());
    magnSheet.getRangeByName('C3').setNumber(magnStats.avgMagn[1].toDouble());
    magnSheet.getRangeByName('D3').setNumber(magnStats.avgMagn[2].toDouble());
    magnSheet.getRangeByName('B4').setNumber(magnStats.minMagn[0].toDouble());
    magnSheet.getRangeByName('C4').setNumber(magnStats.minMagn[1].toDouble());
    magnSheet.getRangeByName('D4').setNumber(magnStats.minMagn[2].toDouble());
    magnSheet.getRangeByName('B5').setNumber(magnStats.maxMagn[0].toDouble());
    magnSheet.getRangeByName('C5').setNumber(magnStats.maxMagn[1].toDouble());
    magnSheet.getRangeByName('D5').setNumber(magnStats.maxMagn[2].toDouble());
    magnSheet
        .getRangeByName('B6')
        .setNumber(magnStats.latestMagn[0].toDouble());
    magnSheet
        .getRangeByName('C6')
        .setNumber(magnStats.latestMagn[1].toDouble());
    magnSheet
        .getRangeByName('D6')
        .setNumber(magnStats.latestMagn[2].toDouble());

    magnSheet.getRangeByName('A8:D8').merge();
    formatMergedCell(magnSheet, 'A8', 'Data');
    formatCell(magnSheet, 'A9', 'Time Stamp', '#00a2ff');
    formatCell(magnSheet, 'B9', 'X', '#00a2ff');
    formatCell(magnSheet, 'C9', 'Y', '#00a2ff');
    formatCell(magnSheet, 'D9', 'Z', '#00a2ff');

    for (int i = 0; i < streamingModel.magnData.length; i++) {
      magnSheet.getRangeByName('A${i + 10}').setDateTime(
          DateTime.fromMicrosecondsSinceEpoch(streamingModel.magnData[i].tS));
      magnSheet
          .getRangeByName('B${i + 10}')
          .setNumber(streamingModel.magnData[i].x.toDouble());
      magnSheet
          .getRangeByName('C${i + 10}')
          .setNumber(streamingModel.magnData[i].y.toDouble());
      magnSheet
          .getRangeByName('D${i + 10}')
          .setNumber(streamingModel.magnData[i].z.toDouble());
    }

    // final ChartCollection magnChartCollection = ChartCollection(magnSheet);
    // final Chart magnChart = magnChartCollection.add();
    // magnChart.chartType = ExcelChartType.line;
    // magnChart.dataRange =
    //     magnSheet.getRangeByName('A9:D${streamingModel.magnData.length + 9}');
    // magnChart.isSeriesInRows = false;
    // magnChart.chartTitle = 'Magnetometer';
    // magnChart.legend!.position = ExcelLegendPosition.bottom;
    // magnChart.primaryCategoryAxis.title = 'Time';
    // magnChart.primaryCategoryAxis.numberFormat = 'hh:mm:ss';
    // magnChart.primaryValueAxis.title = 'Data';
    // magnChart.primaryValueAxis.numberFormat = '0';

    // magnChart.topRow = 1;
    // magnChart.bottomRow = 30;
    // magnChart.leftColumn = 5;
    // magnChart.rightColumn = 20;

    // magnSheet.charts = magnChartCollection;
  }

  // ecg data
  if (streamingModel.ecgData.isNotEmpty) {
    ecgSheet.getRangeByName('A1:B1').merge();
    formatMergedCell(ecgSheet, 'A1', 'ECG Data');
    formatCell(ecgSheet, 'A3', 'Average', '#00a2ff');
    formatCell(ecgSheet, 'A4', 'Minimum', '#00a2ff');
    formatCell(ecgSheet, 'A5', 'Maximum', '#00a2ff');
    formatCell(ecgSheet, 'A6', 'Last', '#00a2ff');

    ecgSheet.getRangeByName('B3').setNumber(ecgStats.avgEcg.toDouble());
    ecgSheet.getRangeByName('B4').setNumber(ecgStats.minEcg.toDouble());
    ecgSheet.getRangeByName('B5').setNumber(ecgStats.maxEcg.toDouble());
    ecgSheet.getRangeByName('B6').setNumber(ecgStats.latestEcg.toDouble());

    ecgSheet.getRangeByName('A8:B8').merge();
    formatMergedCell(ecgSheet, 'A8', 'Data');
    formatCell(ecgSheet, 'A9', 'Time Stamp', '#00a2ff');
    formatCell(ecgSheet, 'B9', 'Voltage', '#00a2ff');

    for (int i = 0; i < streamingModel.ecgData.length; i++) {
      ecgSheet.getRangeByName('A${i + 10}').setDateTime(
          DateTime.fromMicrosecondsSinceEpoch(streamingModel.ecgData[i].tS));
      ecgSheet
          .getRangeByName('B${i + 10}')
          .setNumber(streamingModel.ecgData[i].voltage.toDouble());
    }
    // final ChartCollection ecgChartCollection = ChartCollection(ecgSheet);
    // final Chart ecgChart = ecgChartCollection.add();
    // ecgChart.chartType = ExcelChartType.line;
    // ecgChart.dataRange =
    //     ecgSheet.getRangeByName('A9:B${streamingModel.ecgData.length + 9}');
    // ecgChart.isSeriesInRows = false;
    // ecgChart.chartTitle = 'ECG';
    // ecgChart.legend!.position = ExcelLegendPosition.bottom;
    // ecgChart.primaryCategoryAxis.title = 'Time';
    // ecgChart.primaryCategoryAxis.numberFormat = 'hh:mm:ss';
    // ecgChart.primaryValueAxis.title = 'Data';
    // ecgChart.primaryValueAxis.numberFormat = '0';

    // ecgChart.topRow = 1;
    // ecgChart.bottomRow = 30;
    // ecgChart.leftColumn = 5;
    // ecgChart.rightColumn = 20;

    // ecgSheet.charts = ecgChartCollection;
  }

  List<int> bytes = workbook.saveAsStream();
  Directory? directory = await getExternalStorageDirectory();
  String path = directory!.path;

  await File('$path/$date-$name.xlsx').writeAsBytes(bytes);

  // save as csv
  // hrSheet.showGridlines = false;
  // accSheet.showGridlines = false;
  // gyroSheet.showGridlines = false;
  // magnSheet.showGridlines = false;
  // ecgSheet.showGridlines = false;
  // ppgSheet.showGridlines = false;
  // ppiSheet.showGridlines = false;
  // List<int> csvBytes = workbook.saveAsCSV(',');
  // await File('$path/$name.csv').writeAsBytes(csvBytes);

  workbook.dispose();

  sendPort.send(['done', 'Saved to $path/$date-$name.xlsx']);
}

void formatMergedCell(Worksheet sheet, String cell, String text) {
  sheet.getRangeByName(cell).setText(text);
  sheet.getRangeByName(cell).cellStyle.bold = true;
  sheet.getRangeByName(cell).cellStyle.hAlign = HAlignType.center;
  sheet.getRangeByName(cell).cellStyle.vAlign = VAlignType.center;
  sheet.getRangeByName(cell).cellStyle.backColor = '#FFC000';
}

void formatCell(Worksheet sheet, String cell, String text, String color) {
  sheet.getRangeByName(cell).setText(text);
  sheet.getRangeByName(cell).cellStyle.hAlign = HAlignType.left;
  sheet.getRangeByName(cell).cellStyle.vAlign = VAlignType.center;
  sheet.getRangeByName(cell).cellStyle.backColor = color;
  sheet.getRangeByName(cell).cellStyle.borders.all.lineStyle = LineStyle.thin;
  sheet.getRangeByName(cell).cellStyle.borders.all.color = '#000000';
}
