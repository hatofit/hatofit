import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_reports_params.freezed.dart';
part 'get_reports_params.g.dart';

@freezed
class GetReportsParams with _$GetReportsParams {
  const factory GetReportsParams({ 
    @Default(0) int page,
    @Default(5) int limit,
  }) = _GetReportsParams;

  factory GetReportsParams.fromJson(Map<String, dynamic> json) =>
      _$GetReportsParamsFromJson(json);
}
