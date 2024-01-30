import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_sessions_params.freezed.dart';
part 'get_sessions_params.g.dart';

@freezed
class GetSessionsParams with _$GetSessionsParams {
  const factory GetSessionsParams({
    @Default(0) int page,
    @Default(10) int limit,
  }) = _GetSessionsParams;

  factory GetSessionsParams.fromJson(Map<String, dynamic> json) =>
      _$GetSessionsParamsFromJson(json);
}
