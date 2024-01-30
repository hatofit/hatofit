import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_session_params.freezed.dart';
part 'get_session_params.g.dart';

@freezed
class GetSessionParams with _$GetSessionParams {
  const factory GetSessionParams({
    @Default("") String id,
  }) = _GetSessionParams;

  factory GetSessionParams.fromJson(Map<String, dynamic> json) =>
      _$GetSessionParamsFromJson(json);
}
