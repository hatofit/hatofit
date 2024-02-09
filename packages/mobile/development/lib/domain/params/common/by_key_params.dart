import 'package:freezed_annotation/freezed_annotation.dart';

part 'by_key_params.freezed.dart';
part 'by_key_params.g.dart';

@freezed
class ByKeyParams with _$ByKeyParams {
  const factory ByKeyParams({
    @Default(0) int key,
  }) = _ByKeyParams;

  factory ByKeyParams.fromJson(Map<String, dynamic> json) =>
      _$ByKeyParamsFromJson(json);
}
