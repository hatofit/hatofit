import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_exercises_params.freezed.dart';
part 'get_exercises_params.g.dart';

@freezed
class GetExercisesParams with _$GetExercisesParams {
  const factory GetExercisesParams({
    @Default(false) bool showFromCompany,
    @Default(0) int page,
    @Default(10) int limit,
  }) = _GetExercisesParams;

  factory GetExercisesParams.fromJson(Map<String, dynamic> json) =>
      _$GetExercisesParamsFromJson(json);
}
