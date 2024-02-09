import 'package:freezed_annotation/freezed_annotation.dart';

part 'by_id_params.freezed.dart';
part 'by_id_params.g.dart';

@freezed
class ByIdParams with _$ByIdParams {
  const factory ByIdParams({
    @Default("") String id,
  }) = _ByIdParams;

  factory ByIdParams.fromJson(Map<String, dynamic> json) =>
      _$ByIdParamsFromJson(json);
}