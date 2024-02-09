import 'package:freezed_annotation/freezed_annotation.dart';

part 'by_limit_params.freezed.dart';
part 'by_limit_params.g.dart';

@freezed
class ByLimitParams with _$ByLimitParams {
  const factory ByLimitParams({
    bool? showFromCompany,
    bool? showFromLocal,
    @Default(0) int page,
    @Default(10) int limit,
  }) = _ByLimitParams;

  factory ByLimitParams.fromJson(Map<String, dynamic> json) =>
      _$ByLimitParamsFromJson(json);
      
}
