import 'dart:isolate';

import 'package:fl_chart/fl_chart.dart';
import 'package:hatofit/controller/calc_con.dart';
import 'package:hatofit/models/streaming_model.dart';

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
