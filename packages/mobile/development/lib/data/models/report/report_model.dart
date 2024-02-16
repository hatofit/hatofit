import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

part 'report_model.freezed.dart';
part 'report_model.g.dart';

@freezed
class ReportModel with _$ReportModel {
  const factory ReportModel({
    @JsonKey(name: '_id') String? id,
    String? sessionId,
    String? exerciseId,
    int? startTime,
    int? endTime,
    List<ReportDeviceModel>? devices,
    List<ReportDataModel>? reports,
  }) = _ReportModel;

  const ReportModel._();

  factory ReportModel.fromJson(Map<String, dynamic> json) =>
      _$ReportModelFromJson(json);

  ReportEntity toEntity() => ReportEntity(
        id: id,
        sessionId: sessionId,
        exerciseId: exerciseId,
        startTime: startTime,
        endTime: endTime,
        devices: devices?.map((e) => e.toEntity()).toList(),
        reports: reports?.map((e) => e.toEntity()).toList(),
      );
  factory ReportModel.fromSession(SessionEntity session) {
    const knownBrand = [
      'Polar',
      'Common',
    ];

    List<ReportDeviceModel> devices = [];
    List<ReportDataModel> reports = [];

    for (var item in session.data!) {
      if (item.second == null ||
          item.timeStamp == null ||
          item.devices == null ||
          item.devices!.isEmpty) {
        continue;
      }
      for (var device in item.devices!) {
        if (device.type == null || device.identifier == null) {
          continue;
        }
        if (device.type!.contains(knownBrand[0]) ||
            device.type!.contains(knownBrand[1])) {
          //  check if device is already in list
          final index = devices.indexWhere(
            (e) => e.identifier == device.identifier,
          );
          if (index == -1) {
            devices.add(
              ReportDeviceModel(
                name: device.model,
                identifier: device.identifier,
                brand: device.brand,
              ),
            );
          } else {
            devices[index] = devices[index].copyWith(
              name: device.model,
              identifier: device.identifier,
              brand: device.brand,
            );
          }
          if (device.type!.contains("hr")) {
            final reportIndex = reports.indexWhere(
              (e) => e.type == "hr",
            );
            if (reportIndex == -1) {
              reports.add(ReportDataModel(
                type: "hr",
                data: [
                  ReportDataValueModel(
                    device: device.identifier,
                    value: [
                      [item.timeStamp!, device.value!.first['hr']],
                    ],
                  )
                ],
              ));
            } else {
              reports[reportIndex].data![0].value!.add(
                [
                  item.timeStamp!,
                  device.value!.first['hr'],
                ],
              );
            }
          }
          // if (device.type! == "PolarDataType.acc") {
          //   final reportIndex = reports.indexWhere(
          //     (e) => e.type == "acc",
          //   );
          //   if (reportIndex == -1) {
          //     reports.add(ReportDataModel(
          //       type: "acc",
          //       data: [
          //         ReportDataValueModel(
          //           device: device.identifier,
          //           value: [
          //             [
          //               item.second!,
          //               device.value!.first['x'],
          //               device.value!.first['y'],
          //               device.value!.first['z']
          //             ],
          //           ],
          //         )
          //       ],
          //     ));
          //   } else {
          //     reports[reportIndex].data![0].value!.add(
          //       [
          //         item.second!,
          //         device.value!.first['x'],
          //         device.value!.first['y'],
          //         device.value!.first['z'],
          //       ],
          //     );
          //   }
          // }
          // if (device.type! == "PolarDataType.gyro") {
          //   final reportIndex = reports.indexWhere(
          //     (e) => e.type == "gyro",
          //   );
          //   if (reportIndex == -1) {
          //     reports.add(ReportDataModel(
          //       type: "gyro",
          //       data: [
          //         ReportDataValueModel(
          //           device: device.identifier,
          //           value: [
          //             [
          //               item.second!,
          //               device.value!.first['x'],
          //               device.value!.first['y'],
          //               device.value!.first['z']
          //             ],
          //           ],
          //         )
          //       ],
          //     ));
          //   } else {
          //     reports[reportIndex].data![0].value!.add(
          //       [
          //         item.second!,
          //         device.value!.first['x'],
          //         device.value!.first['y'],
          //         device.value!.first['z'],
          //       ],
          //     );
          //   }
          // }
          // if (device.type?.contains("ecg")) {
          //   final reportIndex = reports.indexWhere(
          //     (e) => e.type == "ecg",
          //   );
          //   if (reportIndex == -1) {
          //     reports.add(ReportDataModel(
          //       type: "ecg",
          //       data: [
          //         ReportDataValueModel(
          //           device: device.identifier,
          //           value: [
          //             [
          //               item.second!,
          //               device.value!.first['voltage'],
          //               device.value!.first['timeStamp'],
          //             ],
          //           ],
          //         )
          //       ],
          //     ));
          //   } else {
          //     reports[reportIndex].data![0].value!.add(
          //       [
          //         item.second!,
          //         device.value!.first['voltage'],
          //         device.value!.first['timeStamp'],
          //       ],
          //     );
          //   }
          // }
        }
      }
    }

    final report = ReportModel(
      exerciseId: session.exercise!.id,
      sessionId: session.id,
      startTime: session.startTime,
      endTime: session.endTime,
      devices: devices,
      reports: reports,
    );
    return report;
  }
}

@freezed
class ReportDeviceModel with _$ReportDeviceModel {
  const factory ReportDeviceModel({
    String? name,
    String? brand,
    String? identifier,
  }) = _ReportDeviceModel;

  const ReportDeviceModel._();

  factory ReportDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$ReportDeviceModelFromJson(json);

  ReportDeviceEntity toEntity() => ReportDeviceEntity(
        name: name,
        identifier: identifier,
      );
}

@Freezed(makeCollectionsUnmodifiable: false)
class ReportDataModel with _$ReportDataModel {
  const factory ReportDataModel({
    String? type,
    List<ReportDataValueModel>? data,
  }) = _ReportDataModel;

  const ReportDataModel._();

  factory ReportDataModel.fromJson(Map<String, dynamic> json) =>
      _$ReportDataModelFromJson(json);

  ReportDataEntity toEntity() => ReportDataEntity(
        type: type,
        data: data?.map((e) => e.toEntity()).toList(),
      );

  Future<List<HrChartModel>> generateHrChart() async {
    final hrParser = IParser(data, (response) {
      final nD = response as List<ReportDataValueModel>;
      List<HrChartModel> chart = [];
      for (var item in nD) {
        for (var value in item.value!) {
          chart.add(
            HrChartModel(
              timeStamp: DateTime.fromMicrosecondsSinceEpoch(value[0]),
              hr: value[1],
            ),
          );
        }
      }
      return chart;
    });
    return await hrParser.parseInBackground();
  }

  // Future<List<EcgChartModel>> generateEcgChart() async {
  //   final ecgParser = IParser(data, (res) {
  //     final nD = res as List<ReportDataValueModel>;
  //     List<EcgChartModel> chart = [];
  //     for (var item in nD) {
  //       for (var value in item.value!) {
  //         chart.add(
  //           EcgChartModel(
  //             timeStamp: DateTime.fromMicrosecondsSinceEpoch(value[2]),
  //             voltage: value[1],
  //           ),
  //         );
  //       }
  //     }
  //     return chart;
  //   });
  //   return await ecgParser.parseInBackground();
  // }
}

@Freezed(makeCollectionsUnmodifiable: false)
class ReportDataValueModel with _$ReportDataValueModel {
  const factory ReportDataValueModel({
    String? device,
    List<List<dynamic>>? value,
  }) = _ReportDataValueModel;

  const ReportDataValueModel._();

  factory ReportDataValueModel.fromJson(Map<String, dynamic> json) =>
      _$ReportDataValueModelFromJson(json);

  ReportDataValueEntity toEntity() => ReportDataValueEntity(
        device: device,
        value: value,
      );
}

class HrChartModel {
  final DateTime timeStamp;
  final int hr;

  HrChartModel({
    required this.timeStamp,
    required this.hr,
  });
}

class EcgChartModel {
  final DateTime timeStamp;
  final int voltage;

  EcgChartModel({
    required this.timeStamp,
    required this.voltage,
  });
}
