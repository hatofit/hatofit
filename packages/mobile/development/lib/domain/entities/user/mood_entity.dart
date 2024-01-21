import 'package:freezed_annotation/freezed_annotation.dart';

part 'mood_entity.freezed.dart';

@freezed
class MoodEntity with _$MoodEntity {
  const factory MoodEntity({
    required String mood,
    required String date,
  }) = _MoodEntity;
}
