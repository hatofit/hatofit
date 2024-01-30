import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_report_params.freezed.dart';
part 'get_report_params.g.dart';

@freezed
class GetReportParams with _$GetReportParams {
  const factory GetReportParams({
    @Default("") String id,
  }) = _GetReportParams;

  factory GetReportParams.fromJson(Map<String, dynamic> json) =>
      _$GetReportParamsFromJson(json);
}
