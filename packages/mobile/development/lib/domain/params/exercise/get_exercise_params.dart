import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_exercise_params.freezed.dart';
part 'get_exercise_params.g.dart';

@freezed
class GetExerciseParams with _$GetExerciseParams {
  const factory GetExerciseParams({
    @Default("") String id,
  }) = _GetExerciseParams;

  factory GetExerciseParams.fromJson(Map<String, dynamic> json) =>
      _$GetExerciseParamsFromJson(json);
}
