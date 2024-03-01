import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/ui/home/cubit/home_cubit.dart';

extension SessExt on SessionEntity {
  Future<Tuple2<HrBarChartItem, int>?> generateHrData(UserEntity? user) async {
    final IParser<Tuple2<HrBarChartItem, int>?> parser = IParser(this, (res) {
      if (res.data != null) {
        if (res.data!.isEmpty) return null;
        final List<int> hrList = [];
        for (var element in res.data!) {
          if (element.devices != null) {
            for (var device in element.devices!) {
              if (device.type!.contains("hr")) {
                hrList.add(device.value!.last['hr']);
              }
            }
          }
        }
        if (hrList.isEmpty) return null;
        final double avgHr = hrList.reduce((a, b) => a + b) / hrList.length;
        double calories = 0;
        final sDate = DateTime.fromMicrosecondsSinceEpoch(startTime ?? 0);
        if (user != null) { 
          final now = DateTime.now();
          final age = now.year - (user.dateOfBirth ?? now).year;
          final gender = user.gender ?? 'male';
          final weight = user.weight ?? 0;
          final endTime = this.endTime ?? 0;

          final duration =
              DateTime.fromMicrosecondsSinceEpoch(endTime).difference(sDate);

          final weightUnits = user.metricUnits?.weightUnits;
          final energyUnits = user.metricUnits?.energyUnits;
          final secToMin = duration.inSeconds / 60;

          final weightInKg = weightUnits == 'lb' ? weight * 0.453592 : weight;
          switch (gender) {
            case 'male':
              calories = secToMin *
                  (0.6309 * avgHr +
                      0.1988 * weightInKg +
                      0.2017 * age -
                      55.0969) /
                  4.184;
              break;

            case 'female':
              calories = secToMin *
                  (0.4472 * avgHr -
                      0.1263 * weightInKg +
                      0.074 * age -
                      20.4022) /
                  4.184;
              break;
          }

          if (energyUnits == 'kcal') {
            calories.round();
          } else if (energyUnits == 'kj') {
            (calories * 4.184).round();
          }
        }
        return Tuple2(
            HrBarChartItem(
              sDate,
              avgHr.toDouble(),
            ),
            calories.round());
      }
      return null;
    });
    return await parser.parseInBackground();
  }

  Future<MetaHr?> generateMeta() async {
    final parser = IParser(this, (res) {
      if (res.data != null) {
        if (res.data!.isEmpty) return null;
        final List<int> hrList = [];
        for (var element in res.data!) {
          if (element.devices != null) {
            for (var device in element.devices!) {
              if (device.type!.contains("hr")) {
                hrList.add(device.value!.last['hr']);
              }
            }
          }
        }
        if (hrList.isEmpty) return null;
        final int avgHr =
            (hrList.reduce((a, b) => a + b) / hrList.length).round();
        final int minHr = hrList.reduce((a, b) => a < b ? a : b);
        final int maxHr = hrList.reduce((a, b) => a > b ? a : b);
        return MetaHr(avgHr, minHr, maxHr);
      }
      return null;
    });
    final res = await parser.parseInBackground();
    return res;
  }
}

class MetaHr {
  final int avg;
  final int min;
  final int max;

  MetaHr(this.avg, this.min, this.max);
}
