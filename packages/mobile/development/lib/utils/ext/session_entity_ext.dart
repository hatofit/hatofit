import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/entities/session/session_entity.dart';
import 'package:hatofit/ui/home/cubit/home_cubit.dart';

extension SessExt on SessionEntity {
  Future<HrBarChartItem?> generateHrData() async {
    final parser = ModelToEntityIsolateParser(this, (res) {
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
        return HrBarChartItem(
          DateTime.fromMillisecondsSinceEpoch(startTime!),
          avgHr.toDouble(),
        );
      }
      return null;
    });
    final res = await parser.parseInBackground();
    return res;
  }

  Future<MetaHr?> generateMeta() async {
    final parser = ModelToEntityIsolateParser(this, (res) {
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
