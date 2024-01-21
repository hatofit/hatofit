import 'package:freezed_annotation/freezed_annotation.dart';
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
}

@freezed
class ReportDeviceModel with _$ReportDeviceModel {
  const factory ReportDeviceModel({
    String? name,
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

@freezed
class ReportDataModel with _$ReportDataModel {
  const factory ReportDataModel({
    String? type,
    List<DataValueModel>? data,
  }) = _ReportDataModel;

  const ReportDataModel._();

  factory ReportDataModel.fromJson(Map<String, dynamic> json) =>
      _$ReportDataModelFromJson(json);

  ReportDataEntity toEntity() => ReportDataEntity(
        type: type,
        data: data?.map((e) => e.toEntity()).toList(),
      );
}

@freezed
class DataValueModel with _$DataValueModel {
  const factory DataValueModel({
    String? name,
    String? value,
  }) = _DataValueModel;

  const DataValueModel._();

  factory DataValueModel.fromJson(Map<String, dynamic> json) =>
      _$DataValueModelFromJson(json);

  DataValueEntity toEntity() => DataValueEntity(
        name: name,
        value: value,
      );
}
