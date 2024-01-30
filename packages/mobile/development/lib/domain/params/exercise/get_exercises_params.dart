import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_exercises_params.freezed.dart';
part 'get_exercises_params.g.dart';

@freezed
class GetExercisesParams with _$GetExercisesParams {
  const factory GetExercisesParams({
    @Default(false) bool showFromCompany,
  }) = _GetExercisesParams;

  factory GetExercisesParams.fromJson(Map<String, dynamic> json) =>
      _$GetExercisesParamsFromJson(json);
}
